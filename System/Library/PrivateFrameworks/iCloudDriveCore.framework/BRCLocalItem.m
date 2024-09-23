@implementation BRCLocalItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_serverPathMatchID, 0);
  objc_storeStrong((id *)&self->_isInDocumentScope, 0);
  objc_storeStrong((id *)&self->_sideCarCKInfo, 0);
  objc_storeStrong((id *)&self->_parentFileID, 0);
  objc_storeStrong((id *)&self->_knownByServer, 0);
  objc_storeStrong((id *)&self->_minimumSupportedOSRowID, 0);
  objc_storeStrong((id *)&self->_orig, 0);
  objc_storeStrong((id *)&self->_st, 0);
  objc_storeStrong((id *)&self->_ownerKey, 0);
  objc_storeStrong((id *)&self->_parentZoneRowID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)setAppLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_appLibrary, a3);
}

- (BRCAppLibrary)appLibrary
{
  BRCAppLibrary *appLibrary;

  appLibrary = self->_appLibrary;
  if (!appLibrary)
  {
    -[BRCLocalItem _refreshAppLibraryFromParent](self, "_refreshAppLibraryFromParent");
    appLibrary = self->_appLibrary;
  }
  return appLibrary;
}

- (NSString)bookmarkData
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BRCItemID itemIDString](self->_itemID, "itemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bookmarkDataWithItemResolutionString:serverZone:", v4, self->_serverZone);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (id)_bookmarkDataWithItemResolutionString:(id)a3 serverZone:(id)a4 salted:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a3;
  objc_msgSend(v7, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isSharedZone");
  if (v11)
  {
    objc_msgSend(v7, "ownerName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v7, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bookmarkDataWithItemResolutionString:serverZoneName:ownerName:accountDSID:salted:", v9, v10, v12, v14, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  return v15;
}

+ (id)bookmarkDataWithItemResolutionString:(id)a3 serverZone:(id)a4
{
  return (id)objc_msgSend(a1, "_bookmarkDataWithItemResolutionString:serverZone:salted:", a3, a4, 1);
}

+ (id)unsaltedBookmarkDataWithItemResolutionString:(id)a3 serverZone:(id)a4
{
  return (id)objc_msgSend(a1, "_bookmarkDataWithItemResolutionString:serverZone:salted:", a3, a4, 0);
}

+ (BOOL)parseUnsaltedBookmarkData:(id)a3 itemID:(id *)a4 mangledID:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  BRCItemID *v13;
  BRCItemID *v14;
  void *v15;
  BRCItemID *v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  BRCItemID *v22;
  void *v23;
  NSObject *v24;
  const char *v26;
  const char *v27;
  const char *v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  BRCItemID *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("/"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 2)
  {
    v11 = objc_alloc(MEMORY[0x24BE17640]);
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (BRCItemID *)objc_msgSend(v11, "initWithAliasTargetContainerString:", v12);

    if (v13)
    {
      v14 = [BRCItemID alloc];
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[BRCItemID initWithUUIDString:](v14, "initWithUUIDString:", v15);

      if (v16)
      {
        if (a5)
          objc_storeStrong(a5, v13);
        if (a4)
          objc_storeStrong(a4, v16);
        v17 = 1;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("unsaltedBookmarkData"), v9);
      v22 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        {
          v28 = "(passed to caller)";
          v29 = 136315906;
          v30 = "+[BRCLocalItem(BRCBookmarkAdditions) parseUnsaltedBookmarkData:itemID:mangledID:error:]";
          v31 = 2080;
          if (!a6)
            v28 = "(ignored by caller)";
          v32 = v28;
          v33 = 2112;
          v34 = v22;
          v35 = 2112;
          v36 = v23;
          _os_log_error_impl(&dword_230455000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v29, 0x2Au);
        }

      }
      if (a6)
        *a6 = objc_retainAutorelease(v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("unsaltedBookmarkData"), v9);
      v16 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        {
          v27 = "(passed to caller)";
          v29 = 136315906;
          v30 = "+[BRCLocalItem(BRCBookmarkAdditions) parseUnsaltedBookmarkData:itemID:mangledID:error:]";
          v31 = 2080;
          if (!a6)
            v27 = "(ignored by caller)";
          v32 = v27;
          v33 = 2112;
          v34 = v16;
          v35 = 2112;
          v36 = v20;
          _os_log_error_impl(&dword_230455000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v29, 0x2Au);
        }

      }
      if (a6)
      {
        v16 = objc_retainAutorelease(v16);
        v17 = 0;
        *a6 = v16;
LABEL_27:

        goto LABEL_28;
      }
    }
    v17 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("unsaltedBookmarkData"), v9);
  v13 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v26 = "(passed to caller)";
      v29 = 136315906;
      v30 = "+[BRCLocalItem(BRCBookmarkAdditions) parseUnsaltedBookmarkData:itemID:mangledID:error:]";
      v31 = 2080;
      if (!a6)
        v26 = "(ignored by caller)";
      v32 = v26;
      v33 = 2112;
      v34 = v13;
      v35 = 2112;
      v36 = v18;
      _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v29, 0x2Au);
    }

  }
  if (a6)
  {
    v13 = objc_retainAutorelease(v13);
    v17 = 0;
    *a6 = v13;
  }
  else
  {
    v17 = 0;
  }
LABEL_28:

  return v17;
}

+ (BOOL)parseBookmarkData:(id)a3 inAccountSession:(id)a4 itemID:(id *)a5 mangledID:(id *)a6 unsaltedBookmarkData:(id *)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  char *v18;
  id v19;
  char *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  BRCItemID *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  const char *v41;
  const char *v42;
  id v43;
  void *v44;
  char *v45;
  id *v46;
  uint64_t v47;
  void *v48;
  id obj;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("/"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") == 3)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithAliasTargetContainerString:", v16);
    objc_msgSend(v14, "accountDSID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "brc_SHA1WithSalt:");
    v47 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:") & 1) == 0
      && (objc_msgSend(v18, "isEqualToString:", CFSTR("BRGetFileNameFromServerInfoBlob")) & 1) == 0)
    {
      v28 = v18;
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v47;
      if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138413058;
        v51 = v28;
        v52 = 2112;
        v53 = v47;
        v54 = 2112;
        v55 = v13;
        v56 = 2112;
        v57 = v29;
        _os_log_error_impl(&dword_230455000, v30, (os_log_type_t)0x90u, "[ERROR] checksum from bookmark %@ is not equal to expected checksum %@ for %@%@", buf, 0x2Au);
      }

      if (a8)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAccountMismatch");
        v24 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
      v18 = (char *)v28;
      v34 = obj;
      goto LABEL_39;
    }
    if (a5)
    {
      objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(":"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v18;
      v46 = a8;
      if (objc_msgSend(v44, "count") == 2 && objc_msgSend(v17, "hasPrefix:", CFSTR("docID:")))
      {
        v19 = *a5;
        *a5 = 0;

        brc_bread_crumbs();
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v20;
          _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] can't parse docID based bookmark%@", buf, 0xCu);
        }

      }
      else
      {
        v43 = v14;
        if (objc_msgSend(obj, "isShared"))
        {
          objc_msgSend(v14, "sharedClientZoneByMangledID:", obj);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dbRowID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
        }
        else
        {
          objc_msgSend(v14, "appLibraryByMangledID:", obj);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dbRowID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
        }

        v32 = -[BRCItemID initWithString:libraryRowID:sharedZoneRowID:]([BRCItemID alloc], "initWithString:libraryRowID:sharedZoneRowID:", v17, v27, v26);
        v33 = *a5;
        *a5 = v32;

        v14 = v43;
      }
      if (!*a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("bookmarkData"), v13);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          brc_bread_crumbs();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
          {
            v42 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v51 = "+[BRCLocalItem(BRCBookmarkAdditions) parseBookmarkData:inAccountSession:itemID:mangledID:unsaltedBookmarkData:error:]";
            v52 = 2080;
            if (!v46)
              v42 = "(ignored by caller)";
            v53 = (uint64_t)v42;
            v54 = 2112;
            v55 = v37;
            v56 = 2112;
            v57 = v38;
            _os_log_error_impl(&dword_230455000, v39, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (v46)
          *v46 = objc_retainAutorelease(v37);

        v24 = 0;
        v18 = v45;
        v34 = obj;
        v31 = (void *)v47;
        goto LABEL_39;
      }

      v18 = v45;
    }
    v34 = obj;
    if (a6)
      objc_storeStrong(a6, obj);
    v31 = (void *)v47;
    if (a7)
    {
      objc_msgSend(v16, "stringByAppendingPathComponent:", v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *a7;
      *a7 = v35;

    }
    v24 = 1;
LABEL_39:

    goto LABEL_40;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("bookmarkData"), v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
    {
      v41 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v51 = "+[BRCLocalItem(BRCBookmarkAdditions) parseBookmarkData:inAccountSession:itemID:mangledID:unsaltedBookmarkData:error:]";
      v52 = 2080;
      if (!a8)
        v41 = "(ignored by caller)";
      v53 = (uint64_t)v41;
      v54 = 2112;
      v55 = v16;
      v56 = 2112;
      v57 = v22;
      _os_log_error_impl(&dword_230455000, v23, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a8)
  {
    v16 = objc_retainAutorelease(v16);
    v24 = 0;
    *a8 = v16;
  }
  else
  {
    v24 = 0;
  }
LABEL_40:

  return v24;
}

- (unint64_t)diffAgainstServerAliasItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:].cold.1();

  }
  -[BRCLocalItem st](self, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "diffAgainst:", v6);
  return v7;
}

- (id)sharedAliasItemID
{
  BRCItemID *itemID;
  void *v4;
  void *v5;
  void *v7;
  NSObject *v8;

  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:].cold.1();

  }
  itemID = self->_itemID;
  -[BRCServerZone ownerName](self->_serverZone, "ownerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID derivedAliasItemIDWithOwnerName:](itemID, "derivedAliasItemIDWithOwnerName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)structureRecordIDInZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  NSObject *v11;

  v4 = a3;
  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:].cold.1();

  }
  -[BRCAccountSessionFPFS serverAliasItemForSharedItem:inZone:](self->_session, "serverAliasItemForSharedItem:inZone:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "st");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", objc_msgSend(v7, "type"), v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 shouldPCSChainStatus:(unsigned __int8)a4 inZone:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t localDiffs;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  BRCItemID *itemID;
  BRCServerZone *serverZone;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _BOOL8 v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  void *v69;
  void *v70;

  v6 = a5;
  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) diffAgainstServerAliasItem:].cold.1();

  }
  if (!-[BRCServerZone isSharedZone](self->_serverZone, "isSharedZone"))
  {
    brc_bread_crumbs();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:].cold.3();

  }
  if ((objc_msgSend(v6, "isPrivateZone") & 1) == 0)
  {
    brc_bread_crumbs();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:].cold.2();

  }
  -[BRCAccountSessionFPFS serverAliasItemForSharedItem:inZone:](self->_session, "serverAliasItemForSharedItem:inZone:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[BRCLocalItem sharedAliasItemID](self, "sharedAliasItemID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v70 = v10;

  v11 = -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem");
  localDiffs = self->_localDiffs;
  v69 = v7;
  if (v7)
  {
    -[BRCStatInfo ckInfo](self->_st, "ckInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v66 = 1;
      goto LABEL_17;
    }
  }
  -[BRCServerZone zoneName](self->_serverZone, "zoneName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BE17550];
  v16 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE17550]);

  if ((v16 & 1) != 0)
  {
    v66 = 0;
    goto LABEL_17;
  }
  v17 = objc_alloc(MEMORY[0x24BE17640]);
  -[BRCServerZone ownerName](self->_serverZone, "ownerName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithZoneName:ownerName:", v15, v18);

  v20 = (void *)MEMORY[0x24BDD17C8];
  -[BRCItemID itemIDString](self->_itemID, "itemIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v21, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clientZone");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "asPrivateClientZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "serverAliasByUnsaltedBookmarkData:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {

    v66 = 0;
    v7 = v69;
LABEL_17:
    v32 = localDiffs | v11;
    objc_msgSend(v70, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", 3, v6, 1);
    v67 = objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("structure"), v67);
    -[BRCStatInfo ckInfo](self->_st, "ckInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo parentID](self->_st, "parentID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    itemID = self->_itemID;
    serverZone = self->_serverZone;
    BYTE2(v65) = a4;
    BYTE1(v65) = v7 == 0;
    LOBYTE(v65) = -[BRCLocalItem isDirectory](self, "isDirectory");
    +[BRCAliasItem fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:](BRCAliasItem, "fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:", v29, v6, v70, v33, v34, itemID, serverZone, v32, v65);

    if (!v66 || (v32 & 0x800) != 0)
    {
      -[BRCLocalItem st](self, "st");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setLastUsedTime:", objc_msgSend(v37, "lastUsedTime"));

    }
    if ((v32 & 0x1000) != 0)
      v38 = 0;
    else
      v38 = v66;
    v28 = v69;
    if ((v38 & 1) == 0)
    {
      -[BRCLocalItem st](self, "st");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "favoriteRank"))
      {
        v40 = (void *)MEMORY[0x24BDD16E0];
        -[BRCLocalItem st](self, "st");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "numberWithLongLong:", objc_msgSend(v41, "favoriteRank"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v42, CFSTR("favoriteRank"));

      }
      else
      {
        objc_msgSend(v29, "setObject:forKeyedSubscript:", 0, CFSTR("favoriteRank"));
      }

    }
    if ((v32 & 0x40) != 0)
    {
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "isCloudDocsAppLibrary"))
      {
        -[BRCLocalItem clientZone](self, "clientZone");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "isCloudDocsZone"))
        {
          -[BRCLocalItem parentItemIDInZone](self, "parentItemIDInZone");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isNonDesktopRoot");

          v28 = v69;
        }
        else
        {
          v46 = 0;
        }

      }
      else
      {
        v46 = 0;
      }
      v47 = v28 == 0;

      -[BRCLocalItem parentItemIDInZone](self, "parentItemIDInZone");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isDocumentsFolder");

      -[BRCLocalItem st](self, "st");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "logicalName");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v64) = v49;
      v28 = v69;
      objc_msgSend(v29, "serializeFilename:forCreation:setExtension:inSharedAlias:basehashSaltIfNotShareAlias:parentIDIsCloudDocsRoot:parentIDIsDocumentsFolder:", v51, v47, 1, 1, 0, v46, v64);

    }
    if ((v32 & 0x200) != 0)
      v52 = 0;
    else
      v52 = v66;
    if ((v52 & 1) == 0)
    {
      -[BRCLocalItem st](self, "st");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "finderTags");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "serializeFinderTags:forCreation:", v54, v28 == 0);

    }
    -[BRCLocalItem serializeStructuralPluginHints:](self, "serializeStructuralPluginHints:", v29);
    -[BRCLocalItem session](self, "session");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v29, "validateEnhancedDrivePrivacyFieldsWithSession:error:", v55, 0);

    if (v56)
    {
      v29 = v29;
      v31 = v29;
    }
    else
    {
      v31 = 0;
    }
    v30 = (void *)v67;
    goto LABEL_45;
  }
  brc_bread_crumbs();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v69;
  if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
    -[BRCLocalItem(BRCSharedToMeTopLevel) structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:].cold.1();

  v29 = 0;
  v30 = 0;
  v31 = 0;
LABEL_45:

  return v31;
}

- (void)insertTombstoneAliasRecordInZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  BRCLocalItem *v20;

  v4 = a3;
  -[BRCAccountSessionFPFS serverAliasItemForSharedItem:inZone:](self->_session, "serverAliasItemForSharedItem:inZone:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "serverZone");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "clientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemByItemID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asBRAlias");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isDead"))
    {
      brc_bread_crumbs();
      v12 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.2();

    }
    else
    {
      if (v11)
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.4();
      }
      else
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.3();
      }

      -[BRCLocalItem db](self, "db");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __72__BRCLocalItem_BRCSharedToMeTopLevel__insertTombstoneAliasRecordInZone___block_invoke;
      v17[3] = &unk_24FE3FDA8;
      v18 = v6;
      v7 = v7;
      v19 = v7;
      v20 = self;
      objc_msgSend(v16, "groupInBatch:", v17);

      v12 = v18;
    }
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(BRCSharedToMeTopLevel) insertTombstoneAliasRecordInZone:].cold.1();
    v7 = v4;
  }

}

void __72__BRCLocalItem_BRCSharedToMeTopLevel__insertTombstoneAliasRecordInZone___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newLocalItemWithServerZone:dbRowID:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v2, "asBRAlias");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "ckInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCkInfo:", v3);

  objc_msgSend(v6, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemScope:", 2);

  objc_msgSend(v6, "saveToDB");
  objc_msgSend(v6, "markDead");
  objc_msgSend(v6, "markNeedsUploadOrSyncingUpWithAliasTarget:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "saveToDB");

}

- (void)updateParentZoneRowID:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  BRCLocalItem *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](self->_db, "isBatchSuspended") & 1) != 0)
  {
    if (v5)
      goto LABEL_3;
LABEL_15:
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.1();
    goto LABEL_17;
  }
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.4();

  if (!v5)
    goto LABEL_15;
LABEL_3:
  if ((-[BRCZoneRowID br_isEqualToNumber:](self->_parentZoneRowID, "br_isEqualToNumber:", v5) & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Parent zone updated on %@, clearing ckinfo and inserting dead item%@", (uint8_t *)&v19, 0x16u);
    }

    -[BRCAccountSessionFPFS serverZoneByRowID:](self->_session, "serverZoneByRowID:", self->_parentZoneRowID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem insertTombstoneAliasRecordInZone:](self, "insertTombstoneAliasRecordInZone:", v8);
    -[BRCAccountSessionFPFS serverZoneByRowID:](self->_session, "serverZoneByRowID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientZone");
    v10 = objc_claimAutoreleasedReturnValue();

    -[BRCAccountSessionFPFS localAliasForSharedItem:inZone:](self->_session, "localAliasForSharedItem:inZone:", self, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((objc_msgSend(v11, "isDead") & 1) == 0)
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.3();

      }
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem(BRCSharedToMeTopLevel) updateParentZoneRowID:].cold.2();

      objc_msgSend(v12, "markNeedsDeleteForRescheduleOfItem:", 0);
      objc_msgSend(v12, "saveToDB");
    }
    objc_storeStrong((id *)&self->_parentZoneRowID, a3);
    -[BRCStatInfo setCkInfo:](self->_st, "setCkInfo:", 0);

LABEL_17:
  }

}

- (BOOL)requiresShareAlias
{
  void *v3;
  uint64_t v4;
  int v5;
  BRCAccountSessionFPFS *session;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (-[BRCStatInfo favoriteRank](self->_st, "favoriteRank")
    || -[BRCStatInfo lastUsedTime](self->_st, "lastUsedTime")
    || (-[BRCStatInfo finderTags](self->_st, "finderTags"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "length"),
        v3,
        v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    session = self->_session;
    -[BRCLocalItem clientZone](self, "clientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asSharedClientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem st](self, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logicalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "br_pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS fallbackAppLibraryForClientZone:extension:](session, "fallbackAppLibraryForClientZone:extension:", v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCStatInfo parentID](self->_st, "parentID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "documentsFolderItemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v15, "isEqualToItemID:", v16) ^ 1;

  }
  return v5;
}

- (BRCAliasItem)asBRAlias
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asBRAlias].cold.1();

  return 0;
}

- (BRCDirectoryItem)asDirectory
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asDirectory].cold.1();

  return 0;
}

- (BRCDocumentItem)asDocument
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asDocument].cold.1();

  return 0;
}

- (BOOL)isShareableItem
{
  return 0;
}

- (BRCTopLevelShareable)asShareableItem
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asShareableItem].cold.1();

  return 0;
}

- (BRCFSRooted)asFSRoot
{
  BRCLocalItem *v3;
  void *v4;
  NSObject *v5;

  if (-[BRCLocalItem isDirectory](self, "isDirectory") && -[BRCLocalItem isFSRoot](self, "isFSRoot"))
  {
    v3 = self;
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem asFSRoot].cold.1();

    v3 = 0;
  }
  return (BRCFSRooted *)v3;
}

- (BRCSymlinkItem)asSymlink
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asSymlink].cold.1();

  return 0;
}

- (BRCFinderBookmarkItem)asFinderBookmark
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asFinderBookmark].cold.1();

  return 0;
}

- (BRCShareAcceptationFault)asShareAcceptationFault
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem asShareAcceptationFault].cold.1();

  return 0;
}

- (NSString)path
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSString *v10;
  _QWORD v11[5];
  NSObject *v12;

  if (self->_resolvedPath)
    return self->_path;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  objc_msgSend(MEMORY[0x24BDC83F0], "br_sharedProviderManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem fileObjectID](self, "fileObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __20__BRCLocalItem_path__block_invoke;
  v11[3] = &unk_24FE42B78;
  v11[4] = self;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v5, "getUserVisibleURLForItemIdentifier:completionHandler:", v7, v11);

  v9 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v8, v9);
  self->_resolvedPath = 1;
  v10 = self->_path;

  return v10;
}

void __20__BRCLocalItem_path__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138412802;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Got an error while computing the URL of %@ - %@%@", (uint8_t *)&v13, 0x20u);
    }

  }
  if (v5)
  {
    objc_msgSend(v5, "path");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 192);
    *(_QWORD *)(v10 + 192) = v9;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (NSString)logicalName
{
  return (NSString *)-[BRCLocalStatInfo logicalName](self->_st, "logicalName");
}

- (NSString)extension
{
  void *v2;
  void *v3;

  -[BRCLocalItem logicalName](self, "logicalName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)appLibraryID
{
  void *v2;
  void *v3;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appLibraryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)needsInsert
{
  return self->_dbRowID == 0;
}

- (BOOL)isFromInitialScan
{
  if ((self->_localDiffs & 0x8000000000000000) != 0)
    return !-[BRCLocalItem isKnownByServerOrInFlight](self, "isKnownByServerOrInFlight");
  else
    return 0;
}

- (BOOL)checkIsInDocumentsScopeWithParent:(id)a3
{
  id v4;
  NSNumber *isInDocumentScope;
  char v6;
  void *v7;
  char v8;
  NSNumber *v9;
  NSNumber *v10;
  void *v12;
  char v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  void *v17;
  char v18;
  BRCItemGlobalID *v19;
  void *v20;
  void *v21;
  void *v22;
  BRCItemGlobalID *v23;
  _BOOL4 v24;
  NSNumber *v25;
  void *v26;
  BRCAccountSessionFPFS *session;
  void *v28;

  v4 = a3;
  isInDocumentScope = self->_isInDocumentScope;
  if (!isInDocumentScope)
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "includesDataScope"))
    {
      v8 = objc_msgSend(v4, "isFSRoot");
      v9 = (NSNumber *)MEMORY[0x24BDBD1C0];
      if ((v8 & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        -[BRCStatInfo parentID](self->_st, "parentID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isDocumentsFolder");

        v14 = (NSNumber *)MEMORY[0x24BDBD1C8];
        if ((v13 & 1) == 0)
        {
          if (v4)
          {
            if (objc_msgSend(v4, "checkIsInDocumentsScopeWithParent:", 0))
              v15 = v14;
            else
              v15 = v9;
            v16 = v15;
          }
          else
          {
            -[BRCLocalItem clientZone](self, "clientZone");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isSharedZone");

            v16 = (NSNumber *)MEMORY[0x24BDBD1C8];
            if ((v18 & 1) == 0)
            {
              session = self->_session;
              -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = [BRCItemGlobalID alloc];
              objc_msgSend(v7, "defaultClientZone");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "dbRowID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "dbRowID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[BRCItemID documentsItemIDWithAppLibraryRowID:](BRCItemID, "documentsItemIDWithAppLibraryRowID:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v19, "initWithZoneRowID:itemID:", v20, v22);
              v24 = -[BRCAccountSessionFPFS globalID:isStrictChildOfGlobalID:](session, "globalID:isStrictChildOfGlobalID:", v26, v23);

              if (!v24)
                v16 = v9;
            }
          }
          v25 = self->_isInDocumentScope;
          self->_isInDocumentScope = v16;

          isInDocumentScope = self->_isInDocumentScope;
          goto LABEL_2;
        }
        v6 = 1;
        v9 = (NSNumber *)MEMORY[0x24BDBD1C8];
      }
    }
    else
    {
      v6 = 1;
      v9 = (NSNumber *)MEMORY[0x24BDBD1C8];
    }
    v10 = self->_isInDocumentScope;
    self->_isInDocumentScope = v9;

    goto LABEL_8;
  }
LABEL_2:
  v6 = -[NSNumber BOOLValue](isInDocumentScope, "BOOLValue");
LABEL_8:

  return v6;
}

- (BOOL)isInDocumentScope
{
  return -[BRCLocalStatInfo itemScope](self->_st, "itemScope") == 2;
}

- (BOOL)isInDocumentOrTrashScope
{
  return -[BRCLocalItem isInDocumentScope](self, "isInDocumentScope")
      || -[BRCLocalItem isInTrashScope](self, "isInTrashScope");
}

- (BOOL)isInDataScope
{
  return -[BRCLocalStatInfo itemScope](self->_st, "itemScope") == 1;
}

- (BOOL)isInTrashScope
{
  return -[BRCLocalStatInfo itemScope](self->_st, "itemScope") == 3;
}

- (unsigned)itemScope
{
  return -[BRCLocalStatInfo itemScope](self->_st, "itemScope");
}

- (NSNumber)parentFileID
{
  NSNumber *parentFileID;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  parentFileID = self->_parentFileID;
  if (!parentFileID)
  {
    -[BRCLocalItem parentItemOnFS](self, "parentItemOnFS");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileID");
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_parentFileID;
    self->_parentFileID = v5;

    parentFileID = self->_parentFileID;
  }
  return parentFileID;
}

- (BRFileObjectID)fileObjectID
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  unint64_t dbRowID;
  uint64_t v14;
  void *v16;
  NSObject *v17;

  if (-[BRCLocalItem isZoneRoot](self, "isZoneRoot"))
  {
    v3 = objc_alloc(MEMORY[0x24BE17618]);
    -[BRCAppLibrary dbRowID](self->_appLibrary, "dbRowID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedLongLongValue");
    v6 = v3;
    v7 = 1;
LABEL_5:
    v9 = (void *)objc_msgSend(v6, "initWithRowID:type:", v5, v7);

    return (BRFileObjectID *)v9;
  }
  if (-[BRCItemID isDocumentsFolder](self->_itemID, "isDocumentsFolder"))
  {
    v8 = objc_alloc(MEMORY[0x24BE17618]);
    -[BRCAppLibrary dbRowID](self->_appLibrary, "dbRowID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedLongLongValue");
    v6 = v8;
    v7 = 4;
    goto LABEL_5;
  }
  -[BRCLocalItem st](self, "st");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "type");
  if (v11 > 0xA)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem fileObjectID].cold.1();

    v9 = 0;
  }
  else
  {
    if (((1 << v11) & 0x639) != 0)
    {
      v12 = objc_alloc(MEMORY[0x24BE17618]);
      dbRowID = self->_dbRowID;
      v14 = 3;
    }
    else
    {
      v12 = objc_alloc(MEMORY[0x24BE17618]);
      dbRowID = self->_dbRowID;
      v14 = 2;
    }
    v9 = (void *)objc_msgSend(v12, "initWithRowID:type:", dbRowID, v14);
  }

  return (BRFileObjectID *)v9;
}

- (BRFileObjectID)parentFileObjectID
{
  void *v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v16;
  NSObject *v17;
  BRCPQLConnection *db;
  void *v19;
  void *v20;
  NSObject *v21;

  -[BRCStatInfo parentID](self->_st, "parentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNonDesktopRoot");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE17618]);
    -[BRCStatInfo parentID](self->_st, "parentID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appLibraryRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongLongValue");
    v9 = v5;
    v10 = 1;
LABEL_5:
    v14 = (void *)objc_msgSend(v9, "initWithRowID:type:", v8, v10);

LABEL_6:
    return (BRFileObjectID *)v14;
  }
  -[BRCStatInfo parentID](self->_st, "parentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isDocumentsFolder");

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x24BE17618]);
    -[BRCStatInfo parentID](self->_st, "parentID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appLibraryRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongLongValue");
    v9 = v13;
    v10 = 4;
    goto LABEL_5;
  }
  if (!-[BRCLocalItem isZoneRoot](self, "isZoneRoot"))
  {
    db = self->_db;
    -[BRCStatInfo parentID](self->_st, "parentID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT rowid FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v19, self->_parentZoneRowID);

    if (v6)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17618]), "initWithRowID:type:", objc_msgSend(v6, "unsignedLongLongValue"), 3);
    }
    else
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem parentFileObjectID].cold.2();

      v14 = 0;
    }
    goto LABEL_6;
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem parentFileObjectID].cold.1();

  v14 = 0;
  return (BRFileObjectID *)v14;
}

- (NSNumber)fileID
{
  void *v3;
  void *v4;

  if (-[BRCLocalItem isDocument](self, "isDocument"))
  {
    -[BRCLocalItem asDocument](self, "asDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileIDForUpload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSNumber *)v4;
}

- (void)_refreshAppLibraryFromParent
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: hierarchy too deep to compute the app library root of %@%@");
  OUTLINED_FUNCTION_0();
}

- (BRCClientZone)parentClientZone
{
  void *v2;
  void *v3;

  -[BRCAccountSessionFPFS serverZoneByRowID:](self->_session, "serverZoneByRowID:", self->_parentZoneRowID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCClientZone *)v3;
}

- (BOOL)isKnownByServer
{
  NSNumber *knownByServer;
  BRCItemID *itemID;
  BRCPQLConnection *db;
  void *v7;
  NSNumber *v8;
  NSNumber *v9;

  if (-[BRCLocalItem hasValidCKInfo](self, "hasValidCKInfo"))
    return 1;
  knownByServer = self->_knownByServer;
  if (!knownByServer)
  {
    itemID = self->_itemID;
    db = self->_db;
    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT 1 FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1"), itemID, v7);
    v9 = self->_knownByServer;
    self->_knownByServer = v8;

    knownByServer = self->_knownByServer;
    if (!knownByServer)
    {
      self->_knownByServer = (NSNumber *)MEMORY[0x24BDBD1C0];

      knownByServer = self->_knownByServer;
    }
  }
  return -[NSNumber BOOLValue](knownByServer, "BOOLValue");
}

- (BOOL)isKnownByServerOrInFlight
{
  void *v3;
  char v4;

  -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isItemInSyncUpAndInFlight:", self);

  return (v4 & 1) != 0 || -[BRCLocalItem isKnownByServer](self, "isKnownByServer");
}

- (BOOL)isDeadOrMissingInServerTruth
{
  BRCItemID *itemID;
  BRCPQLConnection *db;
  void *v4;
  id v5;

  itemID = self->_itemID;
  db = self->_db;
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT 1 FROM server_items WHERE item_id = %@ AND item_state = 0 AND zone_rowid = %@ LIMIT 1"), itemID, v4);
  LOBYTE(itemID) = objc_msgSend(v5, "BOOLValue") ^ 1;

  return (char)itemID;
}

- (BRCItemID)serverPathMatchItemID
{
  id serverPathMatchID;
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  serverPathMatchID = self->_serverPathMatchID;
  if (!serverPathMatchID)
  {
    db = self->_db;
    itemID = self->_itemID;
    -[BRCStatInfo parentID](self->_st, "parentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->_st, "logicalNameWithoutLocalBounce");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PQLConnection itemIDWithSQL:](db, "itemIDWithSQL:", CFSTR("SELECT item_id FROM server_items WHERE item_id != %@ AND item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@"), itemID, v6, v7, v8);
    v10 = self->_serverPathMatchID;
    self->_serverPathMatchID = v9;

    serverPathMatchID = self->_serverPathMatchID;
    if (!serverPathMatchID)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_serverPathMatchID;
      self->_serverPathMatchID = v11;

      serverPathMatchID = self->_serverPathMatchID;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (serverPathMatchID == v13)
    v14 = 0;
  else
    v14 = self->_serverPathMatchID;
  return (BRCItemID *)v14;
}

- (BOOL)isNewToServer:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL result;

  -[BRCLocalItem st](self, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "etag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    result = -[BRCLocalItem isDeadOrMissingInServerTruth](self, "isDeadOrMissingInServerTruth");
    if (!a3)
      return result;
  }
  else
  {
    result = 1;
    if (!a3)
      return result;
  }
  *a3 = v7 == 0;
  return result;
}

- (BOOL)isLive
{
  return -[BRCStatInfo state](self->_st, "state") == 0;
}

- (BOOL)isDead
{
  return -[BRCStatInfo state](self->_st, "state") == 1;
}

- (BOOL)isAlmostDead
{
  int v3;

  v3 = -[BRCStatInfo state](self->_st, "state");
  if (v3 != 1)
    LOBYTE(v3) = -[BRCStatInfo state](self->_st, "state") == -3;
  return v3;
}

- (BOOL)isLost
{
  return -[BRCStatInfo state](self->_st, "state") == -3;
}

- (BOOL)isOnDisk
{
  return -[BRCStatInfo state](self->_st, "state") == 0;
}

- (BOOL)isBRAlias
{
  return 0;
}

- (BOOL)isDirectory
{
  return 0;
}

- (BOOL)isDirectoryFault
{
  return 0;
}

- (BOOL)isDirectoryWithPackageName
{
  return 0;
}

- (BOOL)isPackage
{
  return 0;
}

- (BOOL)isDocument
{
  return 0;
}

- (BOOL)isZoneRoot
{
  return 0;
}

- (BOOL)isFSRoot
{
  return -[BRCStatInfo type](self->_st, "type") == 4;
}

- (BOOL)isSymLink
{
  return 0;
}

- (BOOL)isFinderBookmark
{
  return 0;
}

- (BOOL)isShareAcceptationFault
{
  return 0;
}

- (BOOL)isSharedToMe
{
  return -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem")
      || -[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem");
}

- (BOOL)isSharedToMeTopLevelItem
{
  _BOOL4 v3;

  v3 = -[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone");
  if (v3)
    return (LOBYTE(self->_sharingOptions) >> 2) & 1;
  return v3;
}

- (BOOL)isSharedToMeChildItem
{
  _BOOL4 v3;

  v3 = -[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone");
  if (v3)
    LOBYTE(v3) = (self->_sharingOptions & 4) == 0;
  return v3;
}

- (BRCSharedToMeTopLevel)asSharedToMeTopLevelItem
{
  BRCLocalItem *v3;
  void *v4;
  NSObject *v5;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    v3 = self;
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem asSharedToMeTopLevelItem].cold.1();

    v3 = 0;
  }
  return (BRCSharedToMeTopLevel *)v3;
}

- (BOOL)isOwnedByMe
{
  return !-[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone");
}

- (BOOL)isSharedByMe
{
  _BOOL4 v3;

  v3 = -[BRCLocalItem isOwnedByMe](self, "isOwnedByMe");
  if (v3)
    LOBYTE(v3) = -[BRCLocalItem isShared](self, "isShared");
  return v3;
}

- (BOOL)isShared
{
  return (self->_sharingOptions & 0x48) != 0;
}

- (BOOL)isTopLevelSharedItem
{
  return (self->_sharingOptions & 4) != 0 && -[BRCLocalItem isShared](self, "isShared");
}

- (BOOL)isChildSharedItem
{
  return (self->_sharingOptions & 4) == 0 && -[BRCLocalItem isShared](self, "isShared");
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  return 0;
}

- (NSString)collaborationIdentifierIfComputable
{
  return 0;
}

- (BOOL)isDocumentBeingCopiedToNewZone
{
  return 0;
}

- (BOOL)isCrossZoneMoveTombstone
{
  return 0;
}

- (BOOL)shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:(BOOL)a3
{
  void *v3;
  char v4;

  if (!a3)
    return -[BRCClientZone enhancedDrivePrivacyEnabled](self->_clientZone, "enhancedDrivePrivacyEnabled");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsEnhancedDrivePrivacy");

  return v4;
}

- (void)inheritOSUpgradeNeededFromItem:(id)a3
{
  id *v4;
  NSNumber **p_minimumSupportedOSRowID;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  if (!v4[13])
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem inheritOSUpgradeNeededFromItem:].cold.2();

  }
  p_minimumSupportedOSRowID = &self->_minimumSupportedOSRowID;
  if (self->_minimumSupportedOSRowID)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem inheritOSUpgradeNeededFromItem:].cold.1();

  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[BRCLocalItem itemID](self, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4[13];
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v6;
    _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: inheriting %@ minimum supported OS%@", (uint8_t *)&v14, 0x20u);

  }
  objc_storeStrong((id *)p_minimumSupportedOSRowID, v4[13]);

}

- (BOOL)needsOSUpgradeToSyncUp
{
  return self->_minimumSupportedOSRowID != 0;
}

- (id)osNameNeededToSyncUp
{
  id v2;

  if (self->_minimumSupportedOSRowID)
    v2 = -[BRCPQLConnection fetchObjectOfClass:sql:](self->_db, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT name FROM os_names WHERE rowid = %@"), self->_minimumSupportedOSRowID);
  else
    v2 = 0;
  return v2;
}

- (void)markNeedsOSUpgradeToSyncUpWithName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSNumber *v9;
  NSNumber *minimumSupportedOSRowID;
  uint8_t buf[4];
  BRCLocalItem *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ needs %@ to sync-up%@", buf, 0x20u);
  }

  if (!-[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("INSERT OR IGNORE INTO os_names (name) VALUES (%@)"), v4))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem markNeedsOSUpgradeToSyncUpWithName:].cold.1();

  }
  v9 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT rowid FROM os_names WHERE name = %@"), v4);
  minimumSupportedOSRowID = self->_minimumSupportedOSRowID;
  self->_minimumSupportedOSRowID = v9;

}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BRCZoneRowID *parentZoneRowID;
  void *v15;
  BRFieldCKInfo *sideCarCKInfo;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 128);
  objc_msgSend(v5, "appendFormat:", CFSTR("r:%lld "), self->_dbRowID);
  if (v4)
  {
    +[BRCDumpContext stringFromItemID:context:](BRCDumpContext, "stringFromItemID:context:", self->_itemID, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("i:%@ "), v6);
  }
  else
  {
    -[BRCClientZone mangledID](self->_clientZone, "mangledID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("i:%@:%@ "), v6, v7);

  }
  -[BRCAppLibrary dbRowID](self->_appLibrary, "dbRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("al:%@ "), v8);

  if (-[BRCUserRowID BOOLValue](self->_ownerKey, "BOOLValue"))
    objc_msgSend(v5, "appendFormat:", CFSTR("o:%@ "), self->_ownerKey);
  -[BRCLocalItem fileObjectID](self, "fileObjectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("foid:%@ "), v9);

  if (self->_localDiffs)
  {
    BRCItemFieldsPrettyPrint();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("ld{%@} "), v10);

  }
  BRCPrettyPrintEnumWithContext(self->_syncUpState, (uint64_t)&brc_sync_up_state_pretty_entries, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("up:%@"), v11);

  if (self->_minimumSupportedOSRowID)
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("needs-os-upgrade"), 3, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" %@:%@"), v12, self->_minimumSupportedOSRowID);

  }
  objc_msgSend(v5, "appendFormat:", CFSTR(" uv:%d"), self->_isUserVisible);
  if (-[BRCLocalItem isDirectory](self, "isDirectory"))
  {
    -[BRCLocalItem asDirectory](self, "asDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" mt:%lld"), objc_msgSend(v13, "mtime"));

  }
  parentZoneRowID = self->_parentZoneRowID;
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(parentZoneRowID) = -[BRCZoneRowID br_isEqualToNumber:](parentZoneRowID, "br_isEqualToNumber:", v15);

  if ((parentZoneRowID & 1) == 0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" pzone:%@"), self->_parentZoneRowID);
  sideCarCKInfo = self->_sideCarCKInfo;
  if (sideCarCKInfo)
  {
    -[BRFieldCKInfo etag](sideCarCKInfo, "etag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" ppm:%@"), v17);

  }
  -[BRCLocalStatInfo descriptionWithContext:origName:](self->_st, "descriptionWithContext:origName:", v4, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" st{%@"), v18);

  if (self->_parentFileID)
    objc_msgSend(v5, "appendFormat:", CFSTR(" pino:%@"), self->_parentFileID);
  objc_msgSend(v5, "appendString:", CFSTR("}"));
  if (self->_sharingOptions)
  {
    BRCPrettyPrintBitmap();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" sharing-options:{%@}"), v19);

  }
  return v5;
}

- (NSString)description
{
  return (NSString *)-[BRCLocalItem descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  BRCItemID *itemID;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  itemID = self->_itemID;
  -[BRCLocalStatInfo filename](self->_st, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p {ID : %@; name : %@}>"), v4, self, itemID, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)digestDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BRCLocalStatInfo filename](self->_st, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\" id:%@"), v4, self->_itemID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6;
  BRCLocalItem *v7;
  BRCLocalItem *v8;
  uint64_t v9;
  BRCItemID *itemID;
  uint64_t v11;
  BRCUserRowID *ownerKey;
  void *v13;
  uint64_t v14;
  BRFieldCKInfo *sideCarCKInfo;
  uint64_t v16;
  BRCClientZone *clientZone;
  uint64_t v18;
  BRCPQLConnection *db;
  BRCLocalStatInfo *v20;
  void *v21;
  uint64_t v22;
  BRCLocalStatInfo *st;
  void *v24;
  void *v25;
  uint64_t v26;
  BRCZoneRowID *parentZoneRowID;
  uint64_t v28;
  BRCAppLibrary *appLibrary;
  uint64_t v30;
  BRCLocalItem *orig;
  objc_super v33;

  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BRCLocalItem;
  v7 = -[BRCLocalItem init](&v33, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_dbRowID = a4;
    objc_msgSend(v6, "itemID");
    v9 = objc_claimAutoreleasedReturnValue();
    itemID = v8->_itemID;
    v8->_itemID = (BRCItemID *)v9;

    objc_msgSend(v6, "ownerKey");
    v11 = objc_claimAutoreleasedReturnValue();
    ownerKey = v8->_ownerKey;
    v8->_ownerKey = (BRCUserRowID *)v11;

    objc_msgSend(v6, "sideCarInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ckInfo");
    v14 = objc_claimAutoreleasedReturnValue();
    sideCarCKInfo = v8->_sideCarCKInfo;
    v8->_sideCarCKInfo = (BRFieldCKInfo *)v14;

    v8->_sharingOptions = objc_msgSend(v6, "sharingOptions");
    v8->_serverZone = (BRCServerZone *)(id)objc_msgSend(v6, "serverZone");
    objc_msgSend(v6, "clientZone");
    v16 = objc_claimAutoreleasedReturnValue();
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v16;

    -[BRCClientZone db](v8->_clientZone, "db");
    v18 = objc_claimAutoreleasedReturnValue();
    db = v8->_db;
    v8->_db = (BRCPQLConnection *)v18;

    v8->_session = (BRCAccountSessionFPFS *)(id)objc_msgSend(v6, "session");
    v20 = [BRCLocalStatInfo alloc];
    objc_msgSend(v6, "st");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[BRCStatInfo initWithStatInfo:](v20, "initWithStatInfo:", v21);
    st = v8->_st;
    v8->_st = (BRCLocalStatInfo *)v22;

    objc_msgSend(v6, "parentItemIDOnFS");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setParentID:](v8->_st, "setParentID:", v24);

    objc_msgSend(v6, "parentZoneOnFS");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dbRowID");
    v26 = objc_claimAutoreleasedReturnValue();
    parentZoneRowID = v8->_parentZoneRowID;
    v8->_parentZoneRowID = (BRCZoneRowID *)v26;

    objc_msgSend(v6, "predictedAppLibrary");
    v28 = objc_claimAutoreleasedReturnValue();
    appLibrary = v8->_appLibrary;
    v8->_appLibrary = (BRCAppLibrary *)v28;

    -[BRCLocalItem _recomputeUserVisibleAndItemScope](v8, "_recomputeUserVisibleAndItemScope");
    v30 = -[BRCLocalItem copy](v8, "copy");
    orig = v8->_orig;
    v8->_orig = (BRCLocalItem *)v30;

  }
  return v8;
}

- (id)_initWithLocalItem:(id)a3
{
  id *v4;
  BRCLocalItem *v5;
  BRCLocalItem *v6;
  uint64_t v7;
  BRCLocalStatInfo *st;
  objc_super v10;

  v4 = (id *)a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCLocalItem;
  v5 = -[BRCLocalItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_clientZone, v4[3]);
    objc_storeStrong((id *)&v6->_db, v4[4]);
    objc_storeStrong((id *)&v6->_sideCarCKInfo, v4[20]);
    objc_storeStrong((id *)&v6->_appLibrary, v4[5]);
    v6->_serverZone = (BRCServerZone *)v4[2];
    v6->_session = (BRCAccountSessionFPFS *)v4[1];
    v6->_dbRowID = (unint64_t)v4[15];
    objc_storeStrong((id *)&v6->_itemID, v4[6]);
    objc_storeStrong((id *)&v6->_parentFileID, v4[19]);
    v7 = objc_msgSend(v4[9], "copy");
    st = v6->_st;
    v6->_st = (BRCLocalStatInfo *)v7;

    objc_storeStrong((id *)&v6->_parentZoneRowID, v4[7]);
    v6->_syncUpState = *((_DWORD *)v4 + 20);
    objc_storeStrong((id *)&v6->_ownerKey, v4[8]);
    v6->_sharingOptions = (unint64_t)v4[17];
    objc_storeStrong((id *)&v6->_orig, v4[11]);
    v6->_localDiffs = (unint64_t)v4[12];
    objc_storeStrong((id *)&v6->_parentZoneRowID, v4[7]);
    objc_storeStrong((id *)&v6->_minimumSupportedOSRowID, v4[13]);
    v6->_isUserVisible = *((_BYTE *)v4 + 112);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithLocalItem:", self);
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;

  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[BRCLocalItem initFromPQLResultSet:error:].cold.1();

  return 0;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v9;
  BRCAccountSessionFPFS *v10;
  id v11;
  BRCLocalItem *v12;
  BRCLocalItem *v13;
  void *v14;
  uint64_t v15;
  BRCClientZone *clientZone;
  uint64_t v17;
  BRCItemID *itemID;
  uint64_t v19;
  BRCUserRowID *ownerKey;
  uint64_t v21;
  BRFieldCKInfo *sideCarCKInfo;
  uint64_t v23;
  BRCZoneRowID *parentZoneRowID;
  void *v25;
  uint64_t v26;
  NSNumber *minimumSupportedOSRowID;
  BRCLocalStatInfo *v28;
  BRCLocalStatInfo *st;
  uint64_t v30;
  void *appLibrary;
  NSObject *v32;
  objc_super v34;

  v9 = a3;
  v10 = (BRCAccountSessionFPFS *)a4;
  v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)BRCLocalItem;
  v12 = -[BRCLocalItem init](&v34, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_session = v10;
    v12->_dbRowID = objc_msgSend(v9, "unsignedLongAtIndex:", 0);
    objc_msgSend(v9, "numberAtIndex:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_serverZone = (BRCServerZone *)-[BRCAccountSessionFPFS serverZoneByRowID:](v10, "serverZoneByRowID:", v14);

    -[BRCServerZone clientZone](v13->_serverZone, "clientZone");
    v15 = objc_claimAutoreleasedReturnValue();
    clientZone = v13->_clientZone;
    v13->_clientZone = (BRCClientZone *)v15;

    objc_storeStrong((id *)&v13->_db, a5);
    objc_msgSend(v9, "objectOfClass:atIndex:", objc_opt_class(), 2);
    v17 = objc_claimAutoreleasedReturnValue();
    itemID = v13->_itemID;
    v13->_itemID = (BRCItemID *)v17;

    objc_msgSend(v9, "numberAtIndex:", 3);
    v19 = objc_claimAutoreleasedReturnValue();
    ownerKey = v13->_ownerKey;
    v13->_ownerKey = (BRCUserRowID *)v19;

    v13->_sharingOptions = objc_msgSend(v9, "integerAtIndex:", 4);
    objc_msgSend(v9, "objectOfClass:atIndex:", objc_opt_class(), 5);
    v21 = objc_claimAutoreleasedReturnValue();
    sideCarCKInfo = v13->_sideCarCKInfo;
    v13->_sideCarCKInfo = (BRFieldCKInfo *)v21;

    objc_msgSend(v9, "numberAtIndex:", 6);
    v23 = objc_claimAutoreleasedReturnValue();
    parentZoneRowID = v13->_parentZoneRowID;
    v13->_parentZoneRowID = (BRCZoneRowID *)v23;

    v13->_syncUpState = objc_msgSend(v9, "unsignedIntAtIndex:", 7);
    v13->_localDiffs = objc_msgSend(v9, "unsignedLongLongAtIndex:", 8);
    v13->_notifsRank = objc_msgSend(v9, "longLongAtIndex:", 9);
    objc_msgSend(v9, "numberAtIndex:", 10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberAtIndex:", 11);
    v26 = objc_claimAutoreleasedReturnValue();
    minimumSupportedOSRowID = v13->_minimumSupportedOSRowID;
    v13->_minimumSupportedOSRowID = (NSNumber *)v26;

    v13->_isUserVisible = objc_msgSend(v9, "BOOLAtIndex:", 12);
    v28 = -[BRCLocalStatInfo initFromResultSet:pos:]([BRCLocalStatInfo alloc], "initFromResultSet:pos:", v9, 13);
    st = v13->_st;
    v13->_st = v28;

    if (v25)
    {
      -[BRCAccountSessionFPFS appLibraryByRowID:](v10, "appLibraryByRowID:", v25);
      v30 = objc_claimAutoreleasedReturnValue();
      appLibrary = v13->_appLibrary;
      v13->_appLibrary = (BRCAppLibrary *)v30;
    }
    else
    {
      brc_bread_crumbs();
      appLibrary = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem _initFromPQLResultSet:session:db:error:].cold.1();

    }
  }

  return v13;
}

- (id)initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v6 = -[BRCLocalItem _initFromPQLResultSet:session:db:error:](self, "_initFromPQLResultSet:session:db:error:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)v7[11];
    v7[11] = v8;

  }
  return v7;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  return -[BRCStatInfo check:logToFile:](self->_st, "check:logToFile:", self->_itemID, a3);
}

- (BRCItemGlobalID)itemGlobalID
{
  BRCItemGlobalID *v3;
  void *v4;
  BRCItemGlobalID *v5;

  v3 = [BRCItemGlobalID alloc];
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v3, "initWithZoneRowID:itemID:", v4, self->_itemID);

  return v5;
}

- (id)itemParentGlobalID
{
  BRCItemGlobalID *v3;
  void *v4;
  void *v5;
  void *v6;
  BRCItemGlobalID *v7;

  v3 = [BRCItemGlobalID alloc];
  -[BRCLocalItem parentClientZone](self, "parentClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo parentID](self->_st, "parentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v3, "initWithZoneRowID:itemID:", v5, v6);

  return v7;
}

- (id)sideCarInfo
{
  BRCSideCarInfo *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  if (-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    v3 = objc_alloc_init(BRCSideCarInfo);
    -[BRCSideCarInfo setLastUsedTime:](v3, "setLastUsedTime:", -[BRCStatInfo lastUsedTime](self->_st, "lastUsedTime"));
    -[BRCSideCarInfo setFavoriteRank:](v3, "setFavoriteRank:", -[BRCStatInfo favoriteRank](self->_st, "favoriteRank"));
    -[BRCStatInfo finderTags](self->_st, "finderTags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSideCarInfo setFinderTags:](v3, "setFinderTags:", v4);

    -[BRCSideCarInfo setCkInfo:](v3, "setCkInfo:", self->_sideCarCKInfo);
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem sideCarInfo].cold.1();

    v3 = 0;
  }
  return v3;
}

- (id)parentItemIDInZone
{
  void *v3;
  int v4;
  BRCItemID *v5;
  void *v6;
  id v7;
  unsigned int v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  BRCLocalItem *v14;
  void *v15;
  BRCClientZone *clientZone;
  void *v18;
  BRCClientZone *v19;
  void *v20;
  NSObject *v21;
  int v22;
  BRCLocalItem *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  BRCClientZone *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[BRCLocalItem itemID](self, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNonDesktopRoot");

  if (v4)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem parentItemIDInZone].cold.2();

  }
  if (!-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    -[BRCStatInfo parentID](self->_st, "parentID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_4;
LABEL_9:
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem parentItemIDInZone].cold.1();

    goto LABEL_18;
  }
  v5 = [BRCItemID alloc];
  -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCItemID _initAsZoneRootWithZoneRowID:](v5, "_initAsZoneRootWithZoneRowID:", v6);

  if (!v7)
    goto LABEL_9;
LABEL_4:
  if (!objc_msgSend(v7, "isNonDesktopRoot"))
  {
    v8 = -[BRCClientZone itemTypeByItemID:db:](self->_clientZone, "itemTypeByItemID:db:", v7, self->_db);
    if (v8 > 0xA || ((1 << v8) & 0x611) == 0)
    {
      if (v8 == 255)
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
          v14 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "debugItemIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          clientZone = self->_clientZone;
          v22 = 138413058;
          v23 = v14;
          v24 = 2112;
          v25 = v15;
          v26 = 2112;
          v27 = clientZone;
          v28 = 2112;
          v29 = v12;
          _os_log_fault_impl(&dword_230455000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: orphan detected %@ under parent %@ in %@%@", (uint8_t *)&v22, 0x2Au);

        }
      }
      else
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v7, "debugItemIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          BRCPrettyPrintEnumWithContext((int)v8, (uint64_t)&brc_item_type_pretty_entries, 0);
          v19 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
          v22 = 138413058;
          v23 = self;
          v24 = 2112;
          v25 = v18;
          v26 = 2112;
          v27 = v19;
          v28 = 2112;
          v29 = v12;
          _os_log_fault_impl(&dword_230455000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item parented to a document: %@ parented to %@ type %@%@", (uint8_t *)&v22, 0x2Au);

        }
      }

LABEL_18:
      v9 = 0;
      goto LABEL_19;
    }
  }
  v9 = v7;
LABEL_19:

  return v9;
}

- (id)parentItemOnFS
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  BRCLocalItem *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  BRCAccountSessionFPFS *session;
  void *v13;
  void *v14;
  BRCItemID *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  BRCLocalItem *v21;
  BRCItemID *v22;
  BRCItemID *itemID;
  int v24;
  BRCLocalItem *v25;
  __int16 v26;
  BRCItemID *v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (-[BRCLocalItem isFSRoot](self, "isFSRoot"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem parentItemOnFS].cold.1();
    v5 = 0;
  }
  else
  {
    -[BRCClientZone parentsOfCZMFaults](self->_clientZone, "parentsOfCZMFaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", self->_itemID);
    v7 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();

    if (v7 && !-[BRCPQLConnection isReadonly](self->_db, "isReadonly"))
    {
      brc_bread_crumbs();
      v10 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        itemID = self->_itemID;
        v24 = 138412802;
        v25 = v7;
        v26 = 2112;
        v27 = itemID;
        v28 = 2112;
        v29 = v10;
        _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Using parent %@ for %@ because it's in the CZM fault list%@", (uint8_t *)&v24, 0x20u);
      }

      -[BRCLocalItem itemID](v7, "itemID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      session = self->_session;
      -[BRCLocalItem zoneRowID](v7, "zoneRowID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v13);
      v4 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[BRCStatInfo parentID](self->_st, "parentID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem parentItemOnFS].cold.2((uint64_t)v8, v9);

      }
      -[BRCAccountSessionFPFS serverZoneByRowID:](self->_session, "serverZoneByRowID:", self->_parentZoneRowID);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject clientZone](v4, "clientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemByItemID:db:", v3, self->_db);
    v15 = (BRCItemID *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
        v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "debugItemIDString");
        v22 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
        v24 = 138413058;
        v25 = v21;
        v26 = 2112;
        v27 = v22;
        v28 = 2112;
        v29 = v4;
        v30 = 2112;
        v31 = v16;
        _os_log_fault_impl(&dword_230455000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: orphan detected %@ under parent %@ in %@%@", (uint8_t *)&v24, 0x2Au);

      }
    }
    if (-[BRCItemID isDocument](v15, "isDocument"))
    {
      brc_bread_crumbs();
      v18 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v24 = 138412802;
        v25 = self;
        v26 = 2112;
        v27 = v15;
        v28 = 2112;
        v29 = v18;
        _os_log_fault_impl(&dword_230455000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item parented to a document: %@ parented to %@%@", (uint8_t *)&v24, 0x20u);
      }

      v15 = 0;
    }
    -[BRCItemID asDirectory](v15, "asDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_updateAppLibraryPristineStatesAfterMarkingDead
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] remove documents folder%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateAppLibraryPristineStatesAfterCreationOrUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  if (!-[BRCLocalItem isFSRoot](self, "isFSRoot") && -[BRCLocalItem isLive](self, "isLive"))
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v10 = v3;
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dbRowID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCItemID documentsItemIDWithAppLibraryRowID:](BRCItemID, "documentsItemIDWithAppLibraryRowID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[BRCStatInfo parentID](self->_st, "parentID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v7, "isEqualToItemID:", v6);

      if ((_DWORD)v5)
      {
        objc_msgSend(v10, "didCreateDocumentScopedItem");
      }
      else if (!-[BRCItemID isEqualToItemID:](self->_itemID, "isEqualToItemID:", v6))
      {
        -[BRCStatInfo parentID](self->_st, "parentID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isNonDesktopRoot");

        if (v9)
          objc_msgSend(v10, "didCreateDataScopedItem");
      }

      v3 = v10;
    }

  }
}

- (unint64_t)metadataSyncUpMask:(BOOL)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem", a3))
    v4 = 33430122;
  else
    v4 = 33439742;
  -[BRCClientZone mangledID](self->_clientZone, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "stripBirthtimeFromSyncUpMaskOnDocuments");

  if (v7)
  {
    -[BRCLocalItem itemID](self, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDocumentsFolder");

    if (v9)
      return v4 & 0x1FE3FEE;
  }
  return v4;
}

- (unint64_t)maskForDiffsToSyncUpForZone:(id)a3 sideCarZone:(BOOL)a4 whenClearing:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL4 v12;
  unint64_t v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    v9 = objc_msgSend(v8, "isPrivateZone");
    v10 = 0xFCFF00BFF2FB0002;
    if (v5)
      v10 = 0xFCFF00BFF3FF0002;
    if (v9)
      v11 = 32765;
    else
      v11 = v10;
  }
  else
  {
    v12 = -[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem");
    v13 = 6656;
    if (!v6)
      v13 = 0xFCFF00BFF3FF65FFLL;
    if (v12)
      v11 = v13;
    else
      v11 = 0xFCFF00BFF3FF7FFFLL;
  }

  return v11;
}

- (void)createSyncUpJob
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _db.isBatchSuspended%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (id)unsaltedBookmarkData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BRCItemID itemIDString](self->_itemID, "itemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCServerZone mangledID](self->_serverZone, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_syncZoneRowIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    -[BRCLocalItem clientZone](self, "clientZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dbRowID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    -[BRCLocalItem parentClientZone](self, "parentClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dbRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = -[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem");
    -[BRCLocalItem clientZone](self, "clientZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dbRowID");
    v9 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v9;
    if (v8)
    {
      v15 = v9;
      v16 = &unk_24FEB32F0;
      v10 = (void *)MEMORY[0x24BDBCE30];
      v11 = &v15;
      v12 = 2;
    }
    else
    {
      v14 = v9;
      v10 = (void *)MEMORY[0x24BDBCE30];
      v11 = &v14;
      v12 = 1;
    }
    objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v14, v15, v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_updateSyncUpSchedulerWithDiffs:(unint64_t)a3
{
  BRCClientZone *clientZone;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  unsigned int syncUpState;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BRCLocalItem *v18;
  void *v19;
  char v20;
  BRCLocalItem *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  BRCLocalItem *v36;
  __int16 v37;
  BRCLocalItem *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x20000000000000) == 0
    && (!-[BRCLocalItem isSharedToMe](self, "isSharedToMe") || self->_syncUpState != 4))
  {
    clientZone = self->_clientZone;
    -[BRCLocalItem clientZone](self->_orig, "clientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(clientZone) = -[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v5);

    if ((clientZone & 1) != 0)
    {
      if (-[BRCLocalItem syncUpState](self->_orig, "syncUpState") == 4 && self->_syncUpState != 4)
      {
        brc_bread_crumbs();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:].cold.3();

        goto LABEL_40;
      }
      return;
    }
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:].cold.2();

  syncUpState = self->_syncUpState;
  if (!syncUpState)
  {
    -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteSyncUpJobsForItem:", self);
    goto LABEL_40;
  }
  if (syncUpState == 4)
  {
    -[BRCLocalItem createSyncUpJob](self, "createSyncUpJob");
    return;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[BRCLocalItem _syncZoneRowIDs](self, "_syncZoneRowIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (!v12)
  {
    v15 = 0;
    goto LABEL_35;
  }
  v14 = v12;
  v15 = 0;
  v16 = *(_QWORD *)v32;
  *(_QWORD *)&v13 = 138412290;
  v30 = v13;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v32 != v16)
        objc_enumerationMutation(v11);
      v18 = *(BRCLocalItem **)(*((_QWORD *)&v31 + 1) + 8 * v17);
      -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler", v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isItemInSyncUpAndInFlight:inZone:", self, v18);

      if ((v20 & 1) != 0)
      {
        brc_bread_crumbs();
        v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        v15 = 1;
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v18;
          v37 = 2112;
          v38 = v21;
          _os_log_debug_impl(&dword_230455000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Not finishing sync up because item is in-flight in %@%@", buf, 0x16u);
        }
LABEL_24:

        goto LABEL_28;
      }
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v36 = self;
        v37 = 2112;
        v38 = v18;
        v39 = 2112;
        v40 = v23;
        _os_log_debug_impl(&dword_230455000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Finishing sync up for %@ in %@%@", buf, 0x20u);
      }

      -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "finishSyncUpForItem:inZone:success:", self, v18, 1);

      if (v26)
      {
        brc_bread_crumbs();
        v21 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v30;
          v36 = v21;
          _os_log_fault_impl(&dword_230455000, v22, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: syncUpDiffs == 0%@", buf, 0xCu);
        }
        goto LABEL_24;
      }
LABEL_28:
      ++v17;
    }
    while (v14 != v17);
    v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    v14 = v27;
  }
  while (v27);
LABEL_35:

  if (self->_syncUpState == 3 && (v15 & 1) == 0)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:].cold.1();

    -[BRCAccountSessionFPFS fsUploader](self->_session, "fsUploader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rescheduleSuspendedJobsMatching:inState:", self, 31);
LABEL_40:

  }
}

- (void)_updateSharedZoneBoostingWithDiffs:(unint64_t)a3
{
  void *v5;
  void *v6;
  BRCAppLibrary *appLibrary;
  void *v8;
  BRCAppLibrary *v9;
  BRCAppLibrary *v10;
  void *v11;
  BRCAppLibrary *v12;
  id v13;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    if ((a3 & 0x40000000000000) != 0
      && -[BRCLocalItem isOnDisk](self, "isOnDisk")
      && -[BRCLocalItem isOnDisk](self->_orig, "isOnDisk"))
    {
      -[BRCLocalItem appLibrary](self->_orig, "appLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCServerZone asSharedZone](self->_serverZone, "asSharedZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_removeTargetSharedServerZoneIfNecessary:", v6);

      appLibrary = self->_appLibrary;
      -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary _addTargetSharedServerZoneForSharedItem:](appLibrary, "_addTargetSharedServerZoneForSharedItem:", v8);

    }
    if (-[BRCLocalItem isOnDisk](self, "isOnDisk")
      && (!-[BRCLocalItem isOnDisk](self->_orig, "isOnDisk") || -[BRCLocalItem needsInsert](self->_orig, "needsInsert")))
    {
      v9 = self->_appLibrary;
      -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary _addTargetSharedServerZoneForSharedItem:](v9, "_addTargetSharedServerZoneForSharedItem:", v13);
LABEL_16:

      return;
    }
    if (-[BRCLocalItem isOnDisk](self->_orig, "isOnDisk") && !-[BRCLocalItem isOnDisk](self, "isOnDisk"))
    {
      v12 = self->_appLibrary;
      -[BRCServerZone asSharedZone](self->_serverZone, "asSharedZone");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary _removeTargetSharedServerZoneIfNecessary:](v12, "_removeTargetSharedServerZoneIfNecessary:", v13);
      goto LABEL_16;
    }
  }
  else if (-[BRCLocalItem isSharedToMeTopLevelItem](self->_orig, "isSharedToMeTopLevelItem"))
  {
    v10 = self->_appLibrary;
    -[BRCLocalItem serverZone](self->_orig, "serverZone");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "asSharedZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAppLibrary _removeTargetSharedServerZoneIfNecessary:](v10, "_removeTargetSharedServerZoneIfNecessary:", v11);

    goto LABEL_16;
  }
}

- (void)wasMarkedDead
{
  BRCItemID *itemID;
  void *v4;
  void *v5;
  id v6;

  -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  itemID = self->_itemID;
  -[BRCLocalItem st](self->_orig, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didReparentOrKillItemID:parentItemID:zone:", itemID, v5, self->_serverZone);

  -[BRCLocalItem _updateAppLibraryPristineStatesAfterMarkingDead](self, "_updateAppLibraryPristineStatesAfterMarkingDead");
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  void *v7;
  NSObject *v8;

  if (!self->_appLibrary)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem _refreshAppLibraryFromParent].cold.2();

  }
  self->_dbRowID = a4;
  -[BRCLocalItem _updateAppLibraryPristineStatesAfterCreationOrUpdate](self, "_updateAppLibraryPristineStatesAfterCreationOrUpdate", a3);
  -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:](self, "_updateSyncUpSchedulerWithDiffs:", 0xFCFF00BFF3FF7FFFLL);
  -[BRCLocalItem _updateSharedZoneBoostingWithDiffs:](self, "_updateSharedZoneBoostingWithDiffs:", 0);
  return 1;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  BRCClientZone *clientZone;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  BRCItemDBRowIDAndZoneJobIdentifier *v23;
  unint64_t dbRowID;
  void *v25;
  void *v26;
  BRCItemDBRowIDAndZoneJobIdentifier *v27;
  void *v28;
  void *v29;
  BRCItemID *itemID;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  int64_t v35;
  void *v36;
  void *v37;
  int64_t v38;
  int64_t v39;
  void *v40;
  void *v41;
  void *v43;
  NSObject *v44;

  clientZone = self->_clientZone;
  -[BRCLocalItem clientZone](self->_orig, "clientZone", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(clientZone) = -[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v7);

  if ((clientZone & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem _updateInDB:diffs:].cold.3();

    -[BRCLocalItem itemID](self, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem orig](self, "orig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToItemID:", v12);

    if (v13)
    {
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem _updateInDB:diffs:].cold.2();

    }
    -[BRCStatInfo ckInfo](self->_st, "ckInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "etag");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      -[BRCLocalItem st](self->_orig, "st");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ckInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "etagBeforeCrossZoneMove");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo ckInfo](self->_st, "ckInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "etag");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", v21) & 1) != 0)
      {

      }
      else
      {
        v22 = -[BRCLocalItem isDirectory](self, "isDirectory");

        if (v22)
        {
LABEL_13:
          v23 = [BRCItemDBRowIDAndZoneJobIdentifier alloc];
          dbRowID = self->_dbRowID;
          -[BRCLocalItem clientZone](self->_orig, "clientZone");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dbRowID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:](v23, "initWithItemDBRowID:zoneRowID:", dbRowID, v26);

          -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "deleteJobsMatching:", v27);

          goto LABEL_14;
        }
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem _updateInDB:diffs:].cold.1();
      }

    }
    goto LABEL_13;
  }
LABEL_14:
  if (!-[BRCLocalItem isDead](self->_orig, "isDead") && -[BRCLocalItem isDead](self, "isDead"))
    -[BRCLocalItem wasMarkedDead](self, "wasMarkedDead");
  if ((a4 & 0x20) != 0)
  {
    -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    itemID = self->_itemID;
    -[BRCLocalItem st](self->_orig, "st");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "parentID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "didReparentOrKillItemID:parentItemID:zone:", itemID, v32, self->_serverZone);

  }
  if (!-[BRCLocalItem isRejected](self->_orig, "isRejected") && -[BRCLocalItem isRejected](self, "isRejected"))
  {
    -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "createApplyJobFromServerItem:localItem:state:kind:", 0, self, 1, 0);

  }
  if (-[BRCLocalItem isMigratingToFPFS](self->_orig, "isMigratingToFPFS"))
  {
    if (!-[BRCLocalItem isMigratingToFPFS](self, "isMigratingToFPFS"))
    {
      v34 = -[BRCClientZone serverRankByItemID:](self->_clientZone, "serverRankByItemID:", self->_itemID);
      if (v34)
      {
        v35 = v34;
        -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "rescheduleItemRank:zoneRowID:matchingState:", v35, v37, 15);

      }
    }
  }
  if (-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected"))
  {
    if (!-[BRCLocalItem isIdleOrRejected](self->_orig, "isIdleOrRejected"))
    {
      v38 = -[BRCClientZone serverRankByItemID:](self->_clientZone, "serverRankByItemID:", self->_itemID);
      if (v38)
      {
        v39 = v38;
        -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "rescheduleItemRank:zoneRowID:matchingState:", v39, v41, 22);

      }
    }
  }
  -[BRCLocalItem _updateSharedZoneBoostingWithDiffs:](self, "_updateSharedZoneBoostingWithDiffs:", a4);
  -[BRCLocalItem _updateSyncUpSchedulerWithDiffs:](self, "_updateSyncUpSchedulerWithDiffs:", a4);
  -[BRCLocalItem _updateAppLibraryPristineStatesAfterCreationOrUpdate](self, "_updateAppLibraryPristineStatesAfterCreationOrUpdate");
  return 1;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  BOOL v20;

  v5 = a3;
  v6 = v5;
  if (self->_dbRowID)
  {
    if (!objc_msgSend(v5, "execute:", CFSTR("DELETE FROM client_items WHERE rowid = %lld"), self->_dbRowID))
    {
      v20 = 0;
      goto LABEL_14;
    }
    if (!-[BRCLocalItem isDead](self->_orig, "isDead"))
      -[BRCLocalItem wasMarkedDead](self, "wasMarkedDead");
    -[BRCAccountSessionFPFS fsDownloader](self->_session, "fsDownloader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteDownloadingJobForItem:", self);

    -[BRCAccountSessionFPFS fsUploader](self->_session, "fsUploader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteUploadingJobForItem:", self);

    -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteSyncUpJobsForItem:", self);

    if (-[BRCLocalItem isMigratingToFPFS](self, "isMigratingToFPFS"))
    {
      v10 = -[BRCClientZone serverRankByItemID:](self->_clientZone, "serverRankByItemID:", self->_itemID);
      if (v10)
      {
        v11 = v10;
        -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "rescheduleItemRank:zoneRowID:matchingState:", v11, v13, 15);

      }
    }
    -[BRCAccountSessionFPFS recentsEnumerator](self->_session, "recentsEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem fileObjectID](self, "fileObjectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemWasDeletedWithFileObjectID:notifRank:", v15, -[BRCLocalItem notifsRank](self, "notifsRank"));

    if (!-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected"))
    {
      v16 = -[BRCClientZone serverRankByItemID:](self->_clientZone, "serverRankByItemID:", self->_itemID);
      if (v16)
      {
        v17 = v16;
        -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCServerZone dbRowID](self->_serverZone, "dbRowID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "rescheduleItemRank:zoneRowID:matchingState:", v17, v19, 22);

      }
    }
    -[BRCLocalItem _updateSharedZoneBoostingWithDiffs:](self, "_updateSharedZoneBoostingWithDiffs:", 0);
    self->_dbRowID = 0;
  }
  v20 = 1;
LABEL_14:

  return v20;
}

- (BOOL)_isInterestingUpdateForNotifs
{
  return 0;
}

- (BOOL)_isInterestingUpdateForNotifsWithDiffs:(unint64_t)a3
{
  _BOOL4 v3;
  BOOL v6;
  BOOL v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v33;
  void *v34;
  void *v35;
  void *v36;

  if (self->_forceNotif)
    goto LABEL_2;
  if (-[BRCLocalItem isOnDisk](self, "isOnDisk") || (v3 = -[BRCLocalItem isOnDisk](self->_orig, "isOnDisk")))
  {
    if (-[BRCLocalItem needsInsert](self, "needsInsert") && -[BRCLocalItem isDead](self, "isDead"))
    {
LABEL_17:
      LOBYTE(v3) = 0;
      return v3;
    }
    v6 = -[BRCLocalItem needsInsert](self, "needsInsert");
    LOBYTE(v3) = 1;
    if ((a3 & 0x80000000) == 0 && !v6)
    {
      if (-[BRCLocalItem isLost](self, "isLost"))
      {
        v7 = -[BRCLocalItem isOnDisk](self, "isOnDisk");
        if ((a3 & 0x80001040000060) == 0 && v7)
          goto LABEL_17;
      }
      if ((a3 & 0x100000000) == 0 && -[BRCLocalItem isDead](self, "isDead")
        || -[BRCLocalItem isDirectory](self, "isDirectory") && -[BRCLocalItem isAlmostDead](self->_orig, "isAlmostDead"))
      {
        goto LABEL_17;
      }
      if ((a3 & 0xF8001DF04A5B64) != 0)
        goto LABEL_2;
      -[BRCLocalItem orig](self, "orig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "needsOSUpgradeToSyncUp");
      v10 = -[BRCLocalItem needsOSUpgradeToSyncUp](self, "needsOSUpgradeToSyncUp");

      if (v9 != v10)
        goto LABEL_2;
      -[BRCStatInfo ckInfo](self->_st, "ckInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "etag");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        -[BRCLocalItem orig](self, "orig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "st");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ckInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "etag");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCStatInfo ckInfo](self->_st, "ckInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "etag");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v17, "isEqualToString:", v19);

        if (!v20)
          goto LABEL_2;
      }
      else
      {

      }
      if (-[BRCLocalItem isDocument](self, "isDocument"))
      {
        -[BRCLocalItem asDocument](self, "asDocument");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentVersion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "ckInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "etag");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(v21, "orig");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "asDocument");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "currentVersion");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "ckInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "etag");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "currentVersion");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "ckInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "etag");
          v34 = v22;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v28, "isEqualToString:", v31);

          if ((v33 & 1) != 0)
            goto LABEL_29;
LABEL_2:
          LOBYTE(v3) = 1;
          return v3;
        }

      }
LABEL_29:
      LOBYTE(v3) = -[BRCLocalItem _isInterestingUpdateForNotifs](self, "_isInterestingUpdateForNotifs");
    }
  }
  return v3;
}

- (void)_ascendItemHierarchyWithBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BRCPQLConnection *db;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BRCItemGlobalID *v14;
  uint64_t (**v15)(id, BRCItemGlobalID *, void *);

  v15 = (uint64_t (**)(id, BRCItemGlobalID *, void *))a3;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maxSyncPathDepth");

  db = self->_db;
  -[BRCStatInfo parentID](self->_st, "parentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR(" WITH RECURSIVE item_parents (item_id, zone_rowid, item_file_id) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_file_id FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_file_id FROM client_items AS li  INNER JOIN item_parents AS p USING (item_id, zone_rowid)      LIMIT %u) SELECT item_file_id, item_id, zone_rowid FROM item_parents"), v9, self->_parentZoneRowID, v7);

  if (objc_msgSend(v10, "next"))
  {
    while (1)
    {
      objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v13, v12);
      if ((v15[2](v15, v14, v11) & 1) == 0)
        break;

      if (!objc_msgSend(v10, "next"))
        goto LABEL_6;
    }
    objc_msgSend(v10, "close");

  }
LABEL_6:

}

- (id)setOfParentIDs
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, 0);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__BRCLocalItem_setOfParentIDs__block_invoke;
  v8[3] = &unk_24FE42BA0;
  v6 = v5;
  v9 = v6;
  -[BRCLocalItem _ascendItemHierarchyWithBlock:](self, "_ascendItemHierarchyWithBlock:", v8);

  return v6;
}

uint64_t __30__BRCLocalItem_setOfParentIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_2();

    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

  return v4 ^ 1u;
}

- (BOOL)hasValidCKInfo
{
  void *v2;
  BOOL v3;

  -[BRCStatInfo ckInfo](self->_st, "ckInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isIWorkItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[BRCLocalStatInfo filename](self->_st, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCClientZone mangledID](self->_clientZone, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iworkShareableExtensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_sendNotificationIfNeededWithDiffs:(unint64_t)a3 regather:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  BRCNotification *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountSessionFPFS notificationManager](self->_session, "notificationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BRCLocalItem isBRAlias](self, "isBRAlias")
    && !-[BRCLocalItem isZoneRoot](self, "isZoneRoot")
    && (-[BRCLocalItem isOnDisk](self, "isOnDisk") || -[BRCLocalItem isOnDisk](self->_orig, "isOnDisk")))
  {
    -[BRCLocalItem itemID](self, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDocumentsFolder");

    -[BRCLocalItem appLibrary](self, "appLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hasActiveQueries") & 1) != 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    -[BRCLocalItem orig](self, "orig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasActiveQueries"))
    {

      goto LABEL_8;
    }
    if (!-[BRCLocalItem isOnDisk](self, "isOnDisk"))
    {
      -[BRCLocalItem orig](self, "orig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 |= objc_msgSend(v16, "isOnDisk");

    }
    if ((v9 & 1) != 0)
    {
LABEL_9:
      if (v4)
      {
        +[BRCNotification notificationGatheredFromItem:](BRCNotification, "notificationGatheredFromItem:", self);
        v13 = (BRCNotification *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (-[BRCLocalItem isBRAlias](self, "isBRAlias"))
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            -[BRCLocalItem _sendNotificationIfNeededWithDiffs:regather:].cold.1();

          goto LABEL_28;
        }
        v13 = -[BRCNotification initWithLocalItem:itemDiffs:]([BRCNotification alloc], "initWithLocalItem:itemDiffs:", self, a3);
      }
      v14 = v13;
      if ((-[BRCNotification isDead](v13, "isDead") & 1) == 0)
      {
        -[BRCLocalItem appLibrary](self, "appLibrary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "hasActiveRecursiveQueries"))
        {

LABEL_24:
          -[BRCLocalItem setOfParentIDs](self, "setOfParentIDs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setParentGlobalIDs:", v21);

          goto LABEL_25;
        }
        -[BRCLocalItem orig](self, "orig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hasActiveRecursiveQueries");

        if (v20)
          goto LABEL_24;
      }
LABEL_25:
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138412802;
        v25 = v14;
        v26 = 2048;
        v27 = -[BRCLocalItem notifsRank](self, "notifsRank");
        v28 = 2112;
        v29 = v22;
        _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Queueing notification %@ for rank: %lld%@", (uint8_t *)&v24, 0x20u);
      }

      objc_msgSend(v7, "queueUpdate:", v14);
LABEL_28:

    }
  }

}

- (void)triggerNotificationIfNeeded
{
  if (!-[BRCLocalItem isDead](self, "isDead"))
    -[BRCLocalItem _sendNotificationIfNeededWithDiffs:regather:](self, "_sendNotificationIfNeededWithDiffs:regather:", 0, 1);
}

- (void)markForceNotify
{
  self->_forceNotif = 1;
}

- (NSError)syncUpError
{
  void *v2;
  void *v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (self->_syncUpState == 8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
LABEL_12:
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = *MEMORY[0x24BDD0B88];
      v15 = *MEMORY[0x24BDD0FC8];
      v16[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 3328, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v11;
      return (NSError *)v12;
    }
    goto LABEL_10;
  }
  if (-[BRCClientZone isSyncBlockedBecauseOSNeedsUpgrade](self->_clientZone, "isSyncBlockedBecauseOSNeedsUpgrade"))
  {
    -[BRCClientZone osNameRequiredToSync](self->_clientZone, "osNameRequiredToSync");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (-[BRCLocalItem needsOSUpgradeToSyncUp](self, "needsOSUpgradeToSyncUp"))
  {
    -[BRCLocalItem osNameNeededToSyncUp](self, "osNameNeededToSyncUp");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = (void *)v5;
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v6;
      _BRLocalizedStringWithFormat();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      goto LABEL_12;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  return (NSError *)0;
}

- (BOOL)fromReadOnlyDB
{
  BRCPQLConnection *db;
  BRCPQLConnection *v3;

  db = self->_db;
  -[BRCAccountSessionFPFS readOnlyDB](self->_session, "readOnlyDB");
  v3 = (BRCPQLConnection *)objc_claimAutoreleasedReturnValue();
  LOBYTE(db) = db == v3;

  return (char)db;
}

- (unsigned)uploadStatus
{
  void *v3;
  BOOL v4;
  unsigned __int16 v5;
  unint64_t localDiffs;
  void *v8;
  uint64_t v9;

  if (-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected"))
    return 3;
  -[BRCLocalItem itemID](self, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isDocumentsFolder"))
  {

    return 3;
  }
  v4 = -[BRCLocalItem isMigratingToFPFS](self, "isMigratingToFPFS");

  if (v4)
    return 3;
  if (-[BRCLocalItem syncUpState](self, "syncUpState") == 4)
  {
    v5 = 2;
    if (!-[BRCLocalItem isDeadOrMissingInServerTruth](self, "isDeadOrMissingInServerTruth"))
    {
      localDiffs = self->_localDiffs;
      -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "inFlightDiffsForItem:", self) | localDiffs;

      if ((v9 & 0xEFFFFFFFFFFFF7FFLL) != 0)
        return 2;
      else
        return 3;
    }
  }
  else if (-[BRCLocalItem isDocument](self, "isDocument"))
  {
    return 1;
  }
  else
  {
    return 2;
  }
  return v5;
}

- (BOOL)_hasFieldChangesNotDiffed
{
  unint64_t localDiffs;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t notifsRank;

  localDiffs = self->_localDiffs;
  if (localDiffs != -[BRCLocalItem localDiffs](self->_orig, "localDiffs"))
    return 1;
  v4 = -[BRCStatInfo type](self->_st, "type");
  -[BRCLocalItem st](self->_orig, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v4 != v6)
    return 1;
  -[BRCLocalStatInfo processingStamp](self->_st, "processingStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem st](self->_orig, "st");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processingStamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
    return 1;
  notifsRank = self->_notifsRank;
  return notifsRank != -[BRCLocalItem notifsRank](self->_orig, "notifsRank");
}

- (void)_learnItemID:(id)a3 serverItem:(id)a4
{
  id v7;
  NSNumber *knownByServer;
  void *v9;
  BRCUserRowID *v10;
  BRCUserRowID *ownerKey;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  knownByServer = self->_knownByServer;
  self->_knownByServer = 0;

  self->_localDiffs &= ~0x8000000000000000;
  objc_storeStrong((id *)&self->_itemID, a3);
  self->_sharingOptions = objc_msgSend(v7, "sharingOptions");
  objc_msgSend(v7, "ownerKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "ownerKey");
    v10 = (BRCUserRowID *)objc_claimAutoreleasedReturnValue();
    ownerKey = self->_ownerKey;
    self->_ownerKey = v10;

  }
  objc_msgSend(v7, "st");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "creatorRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v7, "st");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "creatorRowID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setCreatorRowID:](self->_st, "setCreatorRowID:", v15);

  }
  -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rescheduleSuspendedJobsMatching:inState:", self->_serverZone, 22);

}

- (void)_restorePreviousGlobalID:(id)a3
{
  id v4;
  BRCAccountSessionFPFS *session;
  void *v6;
  BRCClientZone *v7;
  BRCClientZone *clientZone;
  BRCClientZone *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BRCClientZone *v14;
  void *v15;
  void *v16;
  BRCZoneRowID *v17;
  void *parentZoneRowID;
  BRCZoneRowID *v19;
  BRCZoneRowID *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BRCZoneRowID *v25;
  BRCZoneRowID *v26;
  void *v27;

  v4 = a3;
  self->_dbRowID = 0;
  session = self->_session;
  objc_msgSend(v4, "zoneRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_serverZone = (BRCServerZone *)-[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v6);

  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v7 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
  clientZone = self->_clientZone;
  self->_clientZone = v7;

  v9 = self->_clientZone;
  objc_msgSend(v4, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone serverItemByItemID:](v9, "serverItemByItemID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BRCLocalItem _restorePreviousGlobalID:].cold.1();

  if (objc_msgSend(v11, "isLive")
    && (objc_msgSend(v11, "isSharedToMeTopLevelItem") & 1) == 0
    && (v14 = self->_clientZone,
        objc_msgSend(v11, "parentItemIDOnServer"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v14) = -[BRCClientZone existsByItemID:](v14, "existsByItemID:", v15),
        v15,
        (_DWORD)v14))
  {
    objc_msgSend(v11, "parentItemIDOnServer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setParentID:](self->_st, "setParentID:", v16);

    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v17 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
    parentZoneRowID = self->_parentZoneRowID;
    self->_parentZoneRowID = v17;
  }
  else
  {
    if (-[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone"))
    {
      -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
      parentZoneRowID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(parentZoneRowID, "dbRowID");
      v19 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
      v20 = self->_parentZoneRowID;
      self->_parentZoneRowID = v19;

      objc_msgSend(parentZoneRowID, "defaultAppLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rootItemID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo setParentID:](self->_st, "setParentID:", v22);

    }
    else
    {
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "defaultClientZone");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dbRowID");
      v25 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
      v26 = self->_parentZoneRowID;
      self->_parentZoneRowID = v25;

      -[BRCLocalItem appLibrary](self, "appLibrary");
      parentZoneRowID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(parentZoneRowID, "rootItemID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo setParentID:](self->_st, "setParentID:", v21);
    }

  }
  objc_msgSend(v4, "itemID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem learnItemID:serverItem:](self, "learnItemID:serverItem:", v27, v11);

}

- (void)_markAsDeadTombstoneWithPreviousGlobalID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BRCLocalItem markDead](self, "markDead");
  -[BRCLocalItem _restorePreviousGlobalID:](self, "_restorePreviousGlobalID:", v4);

  -[BRCStatInfo ckInfo](self->_st, "ckInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "revertEtagsForOldZoneTombstone");

  self->_syncUpState = 4;
}

- (void)_cheapCheckSavingItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.appLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (BOOL)saveToDBAndValidateLocalDiffs
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[BRCLocalItem orig](self, "orig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localDiffs");

  v5 = -[BRCLocalItem saveToDB](self, "saveToDB");
  if ((-[BRCLocalItem localDiffs](self, "localDiffs") | v4) != v4)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      BRCItemFieldsPrettyPrint();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      _os_log_fault_impl(&dword_230455000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item got saved before sync up and a new local diff bit was added: %@%@", (uint8_t *)&v10, 0x16u);

    }
  }
  return v5;
}

- (BOOL)saveToDB
{
  return -[BRCLocalItem saveToDBForServerEdit:keepAliases:](self, "saveToDBForServerEdit:keepAliases:", 0, 0);
}

- (BOOL)saveToDBForServerEdit:(BOOL)a3 keepAliases:(BOOL)a4
{
  _BOOL4 v5;
  BRCAccountSessionFPFS **p_session;
  void *v8;
  BRCAccountSessionFPFS *v9;
  void *v10;
  NSObject *v11;
  BRCLocalItem *orig;
  char v13;
  void *v14;
  NSObject *v15;
  char v16;
  BRCPQLConnection *db;
  unsigned int v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  BRCAccountSessionFPFS *v23;
  char v24;
  BOOL v25;
  uint64_t v26[3];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  BRCLocalItem *v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v5 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  p_session = &self->_session;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertOnQueue");

  v9 = *p_session;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem saveToDBForServerEdit:keepAliases:]", 2361, v26);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v28 = v26[0];
    v29 = 2112;
    v30 = self;
    v31 = 1024;
    v32 = v5;
    v33 = 2112;
    v34 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Saving item %@, serverUpdate = %d%@", buf, 0x26u);
  }

  orig = self->_orig;
  if (orig && !self->_syncUpState)
  {
    v19 = -[BRCLocalItem syncUpState](orig, "syncUpState");
    if (v19)
      v13 = 1;
    else
      v13 = v5;
    if (v19 && !v5)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem saveToDBForServerEdit:keepAliases:].cold.2();

      v13 = 1;
    }
  }
  else
  {
    v13 = v5;
  }
  if (self->_forceDeletedAlready)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem saveToDBForServerEdit:keepAliases:].cold.1();

    v16 = 1;
  }
  else
  {
    db = self->_db;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke;
    v22[3] = &unk_24FE42BC8;
    v22[4] = self;
    v24 = v13;
    v23 = v9;
    v25 = a4;
    v16 = -[BRCPQLConnection groupInTransaction:](db, "groupInTransaction:", v22);

  }
  __brc_leave_section(v26);

  return v16;
}

uint64_t __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  const char *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  int v62;
  uint64_t v63;
  void *v64;
  int v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD *v70;
  char *v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  _BYTE *v79;
  uint64_t v81;
  void *v82;
  int v83;
  const char *v84;
  const char *v85;
  char *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  int v100;
  uint64_t v101;
  id v102;
  void *v103;
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  const char *v111;
  __int16 v112;
  void *v113;
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 32), "diffAgainstOriginalItem");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  if (objc_msgSend(*(id *)(a1 + 32), "isDirectory"))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*v4, "asDirectory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mtime");
      objc_msgSend(*v4, "orig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "asDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v8 != objc_msgSend(v10, "mtime");

      if (v11)
        v5 |= 0x4000uLL;
    }
  }
  if ((v5 & 0x100000000) != 0
    && objc_msgSend(*((id *)*v4 + 11), "isLost")
    && (objc_msgSend(*v4, "isLost") & 1) == 0)
  {
    v12 = objc_msgSend(*v4, "isDead") ^ 1;
  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(*v4, "isDead"))
  {
    if (*(_BYTE *)(a1 + 48)
      && (objc_msgSend(*((id *)*v4 + 11), "isDead") & 1) == 0
      && objc_msgSend(*v4, "isSharedToMeTopLevelItem"))
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_13((_QWORD *)(a1 + 32));

      objc_msgSend(*v4, "asSharedToMeTopLevelItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "insertTombstoneAliasRecordInZone:", 0);

    }
    if (*((_BYTE *)*v4 + 185))
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 1;
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_12();
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(*((id *)*v4 + 9), "processingStamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_11();
      v17 = 0;
      goto LABEL_31;
    }
    if (objc_msgSend(*v4, "isIdleOrRejected"))
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 1;
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_9();
      goto LABEL_31;
    }
    if ((objc_msgSend(*v4, "isKnownByServerOrInFlight") & 1) == 0)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 1;
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_10();
      goto LABEL_31;
    }
  }
  v17 = 0;
LABEL_32:
  if (*((_QWORD *)*v4 + 13))
  {
    objc_msgSend(*v4, "orig");
    v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v21 = v20[13];

    if (v21)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_8();

      if (v12 && (objc_msgSend(*v4, "isIdleOrRejected") & 1) == 0)
      {
        brc_bread_crumbs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_7();
        goto LABEL_43;
      }
      if ((v5 & 0x3FF7FFF) != 0)
      {
        brc_bread_crumbs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_6();
LABEL_43:

        v5 |= 0x8000000000000uLL;
        v26 = (void *)*((_QWORD *)*v4 + 13);
        *((_QWORD *)*v4 + 13) = 0;

        objc_msgSend(*((id *)*v4 + 3), "scheduleSyncUp");
      }
    }
  }
  if ((objc_msgSend(*v4, "isCrossZoneMoveTombstone") & 1) != 0
    || !objc_msgSend(*v4, "_isInterestingUpdateForNotifsWithDiffs:", v5))
  {
    v28 = 0;
  }
  else
  {
    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", *(_QWORD *)(a1 + 40));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = objc_msgSend(v27, "allocateNotifRank");

    v28 = 1;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v29 = objc_msgSend(*v4, "isSharedToMeChildItem");
    if ((v5 & 0x40) != 0)
    {
      if (v29)
      {
        objc_msgSend(*((id *)*v4 + 20), "etag");
        v30 = objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v31 = (void *)v30;
          v101 = v6;
          v102 = v3;
          objc_msgSend(*((id *)*v4 + 9), "logicalName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "br_pathExtension");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)*v4 + 11), "st");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "logicalName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "br_pathExtension");
          v35 = objc_claimAutoreleasedReturnValue();
          if (v33 == (void *)v35)
          {

            v3 = v102;
          }
          else
          {
            v36 = (void *)v35;
            v99 = v28;
            objc_msgSend(*((id *)*v4 + 9), "logicalName");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "br_pathExtension");
            v98 = v32;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)*v4 + 11), "st");
            v97 = v33;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "logicalName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "br_pathExtension");
            v96 = v31;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_msgSend(v37, "isEqualToString:", v40);

            if ((v95 & 1) != 0)
            {
              v6 = v101;
              v3 = v102;
              v28 = v99;
            }
            else
            {
              brc_bread_crumbs();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v42 = objc_claimAutoreleasedReturnValue();
              v6 = v101;
              v3 = v102;
              v28 = v99;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_5();

              if (objc_msgSend(*((id *)*v4 + 9), "favoriteRank"))
              {
                v5 |= 0x1000uLL;
              }
              else if (objc_msgSend(*((id *)*v4 + 9), "lastUsedTime"))
              {
                v5 |= 0x800uLL;
              }
            }
          }
        }
      }
    }
    *((_QWORD *)*v4 + 12) |= objc_msgSend(*v4, "metadataSyncUpMask:", 1) & v5;
  }
  v43 = *v4;
  if (v17)
  {
    if ((objc_msgSend(v43, "_deleteFromDB:keepAliases:", v3, *(unsigned __int8 *)(a1 + 49)) & 1) != 0)
    {
      v44 = "Deleted from DB";
LABEL_107:
      objc_msgSend(*v4, "_cheapCheckSavingItem");
      brc_bread_crumbs();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        BRCItemFieldsPrettyPrint();
        v81 = objc_claimAutoreleasedReturnValue();
        v82 = (void *)v81;
        v83 = *(unsigned __int8 *)(a1 + 48);
        *(_DWORD *)buf = 136316162;
        v105 = v44;
        if (v28)
          v84 = "YES";
        else
          v84 = "NO";
        v106 = 2112;
        if (v83)
          v85 = "YES";
        else
          v85 = "NO";
        v107 = v81;
        v108 = 2080;
        v109 = v84;
        v110 = 2080;
        v111 = v85;
        v112 = 2112;
        v113 = v76;
        _os_log_debug_impl(&dword_230455000, v77, OS_LOG_TYPE_DEBUG, "[DEBUG] %s. changedFields:%@ sendNotif:%s serverUpdate:%s%@", buf, 0x34u);

      }
      if (v28)
        objc_msgSend(*v4, "_sendNotificationIfNeededWithDiffs:regather:", v5, 0);
      v78 = objc_msgSend(*v4, "copy");
      v73 = (void *)*((_QWORD *)*v4 + 11);
      *((_QWORD *)*v4 + 11) = v78;
      v75 = 1;
      goto LABEL_111;
    }
  }
  else if (objc_msgSend(v43, "needsInsert"))
  {
    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", *(_QWORD *)(a1 + 40));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "allocateItemRowID");

    if (objc_msgSend(*(id *)(a1 + 32), "isSharedToMeChildItem"))
    {
      objc_msgSend(*((id *)*v4 + 1), "containerScheduler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "sideCarSyncPersistedState");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "lastSyncDownDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
      {
        brc_bread_crumbs();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_3();

        objc_msgSend(*((id *)*v4 + 1), "containerScheduler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDB9190], "br_syncDownInitial");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "scheduleSyncDownForSideCarWithGroup:", v53);

      }
    }
    brc_bread_crumbs();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_2((uint64_t)v54, v46, v55);

    if ((objc_msgSend(*v4, "_insertInDB:dbRowID:", v3, v46) & 1) != 0)
    {
      v44 = "Inserted into DB";
      goto LABEL_107;
    }
  }
  else
  {
    if (!v5 && !objc_msgSend(*v4, "_hasFieldChangesNotDiffed"))
    {
      v44 = "Ignored";
      goto LABEL_107;
    }
    if (!*(_BYTE *)(a1 + 48))
    {
      if ((v5 & 0x7FFE) != 0)
        objc_msgSend(*((id *)*v4 + 9), "bumpLocalChangeCount");
      if (objc_msgSend(*v4, "isDocument"))
      {
        objc_msgSend(*((id *)*v4 + 11), "asDocument");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "currentVersion");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "contentSignature");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "brc_signatureIsPendingPlaceHolder");

        objc_msgSend(v57, "thumbnailSignature");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "brc_signatureIsPendingPlaceHolder");

        if (v59)
          v62 = 1114112;
        else
          v62 = 0x10000;
        if (v61)
          v62 |= 0x400000u;
        v63 = v5 & ~v62 & 0x3FE0000;
        objc_msgSend(*v4, "asDocument");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "hasFileIDForUpload");

        if (v63 || ((v5 & 0xC00000000) != 0 ? (v66 = v65) : (v66 = 0), v66 == 1))
        {
          objc_msgSend(*v4, "asDocument");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "currentVersion");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "bumpLocalChangeCount");

        }
      }
    }
    if (objc_msgSend(*v4, "isSharedToMeTopLevelItem") && (*((_WORD *)*v4 + 48) & 0x1A69) != 0)
    {
      objc_msgSend(*v4, "parentClientZone");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v69, "isPrivateZone") && (v70 = *v4, (*((_WORD *)*v4 + 48) & 0x1A60) == 0))
      {
        v88 = (void *)v70[1];
        objc_msgSend(*v4, "parentClientZone");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "serverZone");
        v100 = v28;
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "serverAliasItemForSharedItem:inZone:", v70, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v100;
        if (!v91)
        {
          brc_bread_crumbs();
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
            __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_4();

          *((_QWORD *)*v4 + 12) &= 0xFFFFFFFFFFFF8002;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(*v4, "_updateInDB:diffs:", v3, v5))
    {
      v44 = "Saved into DB";
      goto LABEL_107;
    }
  }
  *((_QWORD *)*v4 + 12) = v6;
  brc_bread_crumbs();
  v71 = (char *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, (os_log_type_t)0x90u))
  {
    objc_msgSend(*v4, "itemID");
    v86 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastError");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v105 = v86;
    v106 = 2112;
    v107 = (uint64_t)v87;
    v108 = 2112;
    v109 = v71;
    _os_log_error_impl(&dword_230455000, v72, (os_log_type_t)0x90u, "[ERROR] failed to save item %@ to DB: %@%@", buf, 0x20u);

  }
  brc_bread_crumbs();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
    __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_1();

  v75 = 0;
LABEL_111:

  v79 = *v4;
  if (*((_BYTE *)*v4 + 185))
  {
    v79[186] = v75;
    v79 = *v4;
  }
  v79[187] = 0;

  return v75;
}

- (BOOL)_isIndexable
{
  return 1;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4;
  void *v5;
  BRCItemID *itemID;
  void *v7;
  BRCItemID *v8;
  BRCItemID *v9;
  BRCItemID *v10;
  BOOL v11;
  uint64_t v12;
  BRCUserRowID *ownerKey;
  void *v14;
  BRCUserRowID *v15;
  BRCUserRowID *v16;
  BRCUserRowID *v17;
  int v18;
  uint64_t v19;
  unint64_t sharingOptions;
  uint64_t v21;
  BRFieldCKInfo *sideCarCKInfo;
  void *v23;
  void *v24;
  BRFieldCKInfo *v25;
  BRFieldCKInfo *v26;
  BRFieldCKInfo *v27;
  int v28;
  uint64_t v29;
  BRCLocalStatInfo *st;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (-[BRCLocalItem isDocument](self, "isDocument"))
      v32 = 4093607935;
    else
      v32 = 4026564607;
    goto LABEL_30;
  }
  itemID = self->_itemID;
  objc_msgSend(v4, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = itemID;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v9)
    {

LABEL_9:
      v12 = 0x80000000;
      goto LABEL_10;
    }
    v11 = -[BRCItemID isEqual:](v8, "isEqual:", v9);

    if (!v11)
      goto LABEL_9;
  }
  v12 = 0;
LABEL_10:
  ownerKey = self->_ownerKey;
  objc_msgSend(v5, "ownerKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = ownerKey;
  v16 = v14;
  v17 = v16;
  if (v15 == v16)
  {
    v18 = 0;
  }
  else if (v16)
  {
    v18 = -[BRCUserRowID isEqual:](v15, "isEqual:", v16) ^ 1;
  }
  else
  {
    v18 = 1;
  }

  if (v18)
    v19 = v12 | 0x20000000;
  else
    v19 = v12;
  sharingOptions = self->_sharingOptions;
  if (sharingOptions == objc_msgSend(v5, "sharingOptions"))
    v21 = v19;
  else
    v21 = v19 | 0x40000000;
  sideCarCKInfo = self->_sideCarCKInfo;
  objc_msgSend(v5, "sideCarInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ckInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = sideCarCKInfo;
  v26 = v24;
  v27 = v26;
  if (v25 == v26)
  {
    v28 = 0;
  }
  else if (v26)
  {
    v28 = !-[BRFieldCKInfo isEqual:](v25, "isEqual:", v26);
  }
  else
  {
    v28 = 1;
  }

  if (v28)
    v29 = v21 | 0x100000000000000;
  else
    v29 = v21;
  st = self->_st;
  objc_msgSend(v5, "st");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[BRCStatInfo diffAgainst:](st, "diffAgainst:", v31) | v29;

LABEL_30:
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem")
    && objc_msgSend(v5, "isSharedToMeTopLevelItem"))
  {
    v33 = v32 & 0xFFFFFFFFFFFFFFDFLL;
    -[BRCAccountSessionFPFS serverAliasItemForSharedItem:db:](self->_session, "serverAliasItemForSharedItem:db:", self, self->_db);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "diffAgainstServerAliasItem:", v34) & 0x20;

    }
    else
    {
      -[BRCLocalItem st](self, "st");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "parentID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary documentsFolderItemID](self->_appLibrary, "documentsFolderItemID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqualToItemID:", v39);

      if (v40)
        v36 = 0;
      else
        v36 = 32;
    }
    v32 = v36 | v33;

  }
  return v32;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  BRCItemID *v7;
  BRCItemID *v8;
  BRCItemID *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  BRCUserRowID *v13;
  BRCUserRowID *v14;
  BRCUserRowID *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  NSNumber *v28;
  NSNumber *v29;
  NSNumber *v30;
  char v31;
  void *v32;
  BRFieldCKInfo *v33;
  BRFieldCKInfo *v34;
  BRFieldCKInfo *v35;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v38 = 0xFF003FF3FF7FFFLL;
    goto LABEL_51;
  }
  v6 = (void *)v4[6];
  v7 = self->_itemID;
  v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v9 = v8;
  if (v8)
  {
    v10 = -[BRCItemID isEqual:](v7, "isEqual:", v8);

    if (!v10)
      goto LABEL_9;
LABEL_7:
    v11 = 0;
    goto LABEL_10;
  }

LABEL_9:
  v11 = 0x80000000;
LABEL_10:
  v12 = (void *)v5[8];
  v13 = self->_ownerKey;
  v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_17;
  }
  v15 = v14;
  if (!v14)
  {

    goto LABEL_16;
  }
  v16 = -[BRCUserRowID isEqual:](v13, "isEqual:", v14);

  if ((v16 & 1) == 0)
LABEL_16:
    v11 |= 0x20000000uLL;
LABEL_17:
  if (self->_sharingOptions == v5[17])
    v17 = v11;
  else
    v17 = v11 | 0x40000000;
  if (self->_syncUpState != *((_DWORD *)v5 + 20))
    v17 |= 0x20000000000000uLL;
  if (self->_isUserVisible == *((unsigned __int8 *)v5 + 112))
    v18 = v17;
  else
    v18 = v17 | 0x80000000000000;
  if ((v18 & 0x40000000000000) == 0)
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dbRowID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dbRowID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v20;
    v24 = v22;
    v25 = v24;
    if (v23 == v24)
      v26 = 0;
    else
      v26 = v24 ? objc_msgSend(v23, "isEqual:", v24) ^ 1 : 1;

    if (v26)
      v18 |= 0x40000000000000uLL;
  }
  if ((v18 & 0x8000000000000) == 0)
  {
    v27 = (void *)v5[13];
    v28 = self->_minimumSupportedOSRowID;
    v29 = v27;
    if (v28 == v29)
    {

      goto LABEL_41;
    }
    v30 = v29;
    if (v29)
    {
      v31 = -[NSNumber isEqual:](v28, "isEqual:", v29);

      if ((v31 & 1) != 0)
        goto LABEL_41;
    }
    else
    {

    }
    v18 |= 0x8000000000000uLL;
  }
LABEL_41:
  v32 = (void *)v5[20];
  v33 = self->_sideCarCKInfo;
  v34 = v32;
  if (v33 == v34)
  {

  }
  else
  {
    v35 = v34;
    if (v34)
    {
      v36 = -[BRFieldCKInfo isEqual:](v33, "isEqual:", v34);

      if (v36)
        goto LABEL_48;
    }
    else
    {

    }
    v18 |= 0x100000000000000uLL;
  }
LABEL_48:
  v37 = -[BRCLocalStatInfo diffAgainstLocalInfo:](self->_st, "diffAgainstLocalInfo:", v5[9]);
  v38 = v37 | v18;
  if (((v37 | v18) & 8) != 0
    && !-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    v38 &= ~8uLL;
  }
LABEL_51:

  return v38;
}

- (unint64_t)diffAgainstOriginalItem
{
  if (self->_orig)
    return -[BRCLocalItem diffAgainstLocalItem:](self, "diffAgainstLocalItem:");
  else
    return 0xFF003FF3FF7FFFLL;
}

+ (BOOL)computeUserVisibleStatusOfLiveItemWithParentVisible:(BOOL)a3 parentIsNonDesktopRoot:(BOOL)a4 parentScope:(unsigned __int8)a5 itemFilename:(id)a6 parentFilename:(id)a7 appLibrary:(id)a8
{
  int v10;
  _BOOL4 v11;
  int v12;
  id v13;
  id v14;
  id v15;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  if ((objc_msgSend(v15, "supportsSpotlightIndexing") & 1) == 0)
  {
    if (objc_msgSend(v15, "isCloudDocsAppLibrary"))
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:].cold.2();

    }
    goto LABEL_12;
  }
  if (v10 == 1 && v11 && (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE17538]) & 1) != 0)
    goto LABEL_10;
  if (v10 == 1 && v12)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:].cold.1();

  }
  if ((objc_msgSend(v13, "hasPrefix:", CFSTR(".")) & 1) != 0)
  {
LABEL_12:
    LOBYTE(v12) = 0;
    goto LABEL_13;
  }
  if (v10 == 2 && v11)
  {
LABEL_10:
    LOBYTE(v12) = 1;
    goto LABEL_13;
  }
  if (v10 == 3)
    LOBYTE(v12) = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE175A0]);
LABEL_13:

  return v12;
}

- (NSDictionary)extendedAttributes
{
  void (**v3)(_QWORD, _QWORD);
  BRCLocalStatInfo *st;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __34__BRCLocalItem_extendedAttributes__block_invoke;
  v13[3] = &unk_24FE42BF0;
  v13[4] = &v14;
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348BA0DC](v13);
  st = self->_st;
  -[BRCAccountSessionFPFS stageRegistry](self->_session, "stageRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo lazyXattrWithStageRegistry:](st, "lazyXattrWithStageRegistry:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v3)[2](v3, v6);

  if (-[BRCLocalItem isDocument](self, "isDocument"))
  {
    -[BRCLocalItem asDocument](self, "asDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS stageRegistry](self->_session, "stageRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lazyXattrWithStageRegistry:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v10);

  }
  if (objc_msgSend((id)v15[5], "count"))
    v11 = (id)v15[5];
  else
    v11 = 0;

  _Block_object_dispose(&v14, 8);
  return (NSDictionary *)v11;
}

void __34__BRCLocalItem_extendedAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BRFieldXattrBlob *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = -[BRFieldXattrBlob initWithData:]([BRFieldXattrBlob alloc], "initWithData:", v3);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[BRFieldXattrBlob xattrs](v4, "xattrs", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          objc_msgSend(v10, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

- (void)markForceNeedsSyncUp
{
  self->_localDiffs |= 0x3FFEuLL;
  -[BRCLocalItem _markNeedsSyncingUp](self, "_markNeedsSyncingUp");
}

- (void)markForceRejected
{
  self->_syncUpState = 1;
}

- (void)markRejectedItemRemotelyRevived
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _syncUpState == BRC_SUS_REJECTED%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (BOOL)forceNeedsSyncUpWithoutDiffs
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;

  v3 = -[BRCLocalItem hasShareIDAndIsOwnedByMe](self, "hasShareIDAndIsOwnedByMe");
  if (v3)
  {
    if ((-[BRCLocalItem sharingOptions](self, "sharingOptions") & 0x48) != 0)
    {
      v3 = -[BRCLocalItem isInTrashScope](self, "isInTrashScope");
      if (v3)
      {
        brc_bread_crumbs();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          -[BRCLocalItem forceNeedsSyncUpWithoutDiffs].cold.1();

        LOBYTE(v3) = 1;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_markNeedsSyncingUp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Local item is missing a share alias which it should have. Trying to create one%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markNeedsUploadOrSyncingUp
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  BRCLocalItem *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!-[BRCLocalItem isRejected](self, "isRejected"))
  {
LABEL_17:
    -[BRCLocalItem _markNeedsSyncingUp](self, "_markNeedsSyncingUp");
    return;
  }
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Not forcing sync up of share-to-me top level item %@%@", (uint8_t *)&v14, 0x16u);
    }

    self->_localDiffs = 0;
    return;
  }
  if (!-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
LABEL_13:
    v11 = self->_localDiffs | -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem");
    if ((v11 & -[BRCLocalItem metadataSyncUpMask:](self, "metadataSyncUpMask:", 0)) != 0)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = self;
        v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item %@ has meaningful local diffs.  Forcing re-sync of all fields%@", (uint8_t *)&v14, 0x16u);
      }

      self->_localDiffs = 0xFF003FF3FF7FFFLL;
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "brc_shareItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone serverItemByItemID:](self->_clientZone, "serverItemByItemID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "isDead"))
  {

    goto LABEL_13;
  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_230455000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Not forcing sync up of share-to-me child item with a dead root share %@%@", (uint8_t *)&v14, 0x16u);
  }

  self->_localDiffs = 0;
}

- (void)scheduleSyncDownForOOBModifyRecordsAck
{
  self->_localDiffs |= 0x1000000000000000uLL;
  -[BRCClientZone scheduleSyncDownForOOBModifyRecordsAck](self->_clientZone, "scheduleSyncDownForOOBModifyRecordsAck");
}

- (void)prepareForSyncUpSideCarZone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isReadAndUploaded || self.isKnownByServerOrInFlight%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)prepareForSyncUpInZone:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t localDiffs;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](self->_db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  if (!-[BRCLocalItem isReadAndUploaded](self, "isReadAndUploaded")
    && !-[BRCLocalItem isKnownByServerOrInFlight](self, "isKnownByServerOrInFlight"))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem prepareForSyncUpSideCarZone].cold.1();

  }
  v5 = -[BRCLocalItem maskForDiffsToSyncUpForZone:sideCarZone:whenClearing:](self, "maskForDiffsToSyncUpForZone:sideCarZone:whenClearing:", v4, 0, 1);
  localDiffs = self->_localDiffs;
  self->_localDiffs = localDiffs & ~v5;
  if (objc_msgSend(v4, "isPrivateZone")
    && -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    self->_localDiffs &= 0xFFFFFFFFFFFF8000;
  }
  v7 = localDiffs & v5;
  -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareItemForSyncUp:inFlightDiffs:inZone:", self, v7, v9);

}

- (void)markLatestSyncRequestFailedInZone:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int syncUpState;
  int v8;
  BRCAccountSessionFPFS *session;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](self->_db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "finishSyncUpForItem:inZone:success:", self, v4, 0);

  syncUpState = self->_syncUpState;
  if (syncUpState >= 2)
  {
    self->_localDiffs |= v6;
    if (syncUpState == 4)
    {
      -[BRCLocalItem createSyncUpJob](self, "createSyncUpJob");
      v8 = objc_msgSend(v4, "br_isEqualToNumber:", &unk_24FEB32F0);
      session = self->_session;
      if (v8)
      {
        -[BRCAccountSessionFPFS containerScheduler](session, "containerScheduler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scheduleSyncUpForSideCar");
      }
      else
      {
        -[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clientZone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scheduleSyncUp");

      }
    }
  }

}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t localDiffs;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  db = self->_db;
  v5 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishSyncUpForItem:inZone:success:", self, v5, 1);

  if (-[BRCItemID isDocumentsFolder](self->_itemID, "isDocumentsFolder"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem markLatestSyncRequestRejectedInZone:].cold.1();

    -[BRCAppLibrary clearStateBits:](self->_appLibrary, "clearStateBits:", 0x4000000);
LABEL_10:
    self->_localDiffs = 0xFF003FF3FF7FFFLL;
    -[BRCLocalItem createSyncUpJob](self, "createSyncUpJob");
    return;
  }
  localDiffs = self->_localDiffs;
  if ((-[BRCLocalItem metadataSyncUpMask:](self, "metadataSyncUpMask:", 0) & localDiffs) != 0)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem markLatestSyncRequestRejectedInZone:].cold.2();

    goto LABEL_10;
  }
  self->_syncUpState = 1;
}

- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3
{
  BRCPQLConnection *db;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  unint64_t localDiffs;
  unsigned int syncUpState;
  void *v14;
  NSObject *v15;
  void *v17;
  NSObject *v18;
  NSObject *v19;

  db = self->_db;
  v5 = a3;
  if ((-[BRCPQLConnection isBatchSuspended](db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishSyncUpForItem:inZone:success:", self, v5, 1);

  -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isItemPendingSyncUp:", self);

  if (v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:].cold.1();

    if (-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
    {
      -[BRCAccountSessionFPFS containerScheduler](self->_session, "containerScheduler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scheduleSyncUpForSideCar");
LABEL_7:

    }
  }
  else
  {
    localDiffs = self->_localDiffs;
    if (((-[BRCLocalItem metadataSyncUpMask:](self, "metadataSyncUpMask:", 0) | 0x1000000000000000) & localDiffs) == 0)
    {
      self->_syncUpState = 0;
      return v8 ^ 1;
    }
    syncUpState = self->_syncUpState;
    if (syncUpState != 4)
    {
      if (syncUpState)
        return v8 ^ 1;
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:].cold.3();

      goto LABEL_7;
    }
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:].cold.2();

    -[BRCLocalItem createSyncUpJob](self, "createSyncUpJob");
  }
  return v8 ^ 1;
}

- (void)resetWhileKeepingClientItemsAndWantsUnlink:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  self->_orig->_syncUpState = 0;
  -[BRCLocalItem markItemForgottenByServer](self, "markItemForgottenByServer");
  self->_localDiffs |= 0x400000000000000uLL;
  if (!v3
    || (-[BRCLocalItem itemID](self, "itemID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isDocumentsFolder"),
        v5,
        v6))
  {
    -[BRCLocalItem serverZone](self, "serverZone");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    self->_localDiffs |= -[BRCLocalItem maskForDiffsToSyncUpForZone:sideCarZone:whenClearing:](self, "maskForDiffsToSyncUpForZone:sideCarZone:whenClearing:", v7, 0, 0) & 0xFF003FF3FF7FFFLL;

  }
}

- (void)markItemForgottenByServer
{
  NSNumber *knownByServer;

  knownByServer = self->_knownByServer;
  self->_knownByServer = 0;

  -[BRCStatInfo setCkInfo:](self->_st, "setCkInfo:", 0);
}

- (void)handleUnknownItemError
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  unint64_t sharingOptions;
  BRCItemID *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[BRCStatInfo ckInfo](self->_st, "ckInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || !-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {

    goto LABEL_8;
  }
  -[BRCClientZone mangledID](self->_clientZone, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "changeItemIDOnUnknownItem");

  if (!v6)
  {
LABEL_8:
    -[BRCLocalItem markItemForgottenByServer](self, "markItemForgottenByServer");
    goto LABEL_9;
  }
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Unknown item must need an itemID change%@", (uint8_t *)&v11, 0xCu);
  }

  sharingOptions = self->_sharingOptions;
  v10 = objc_alloc_init(BRCItemID);
  -[BRCLocalItem learnItemID:serverItem:](self, "learnItemID:serverItem:", v10, 0);

  self->_sharingOptions = sharingOptions;
  self->_localDiffs |= 0x8000000000000000;
LABEL_9:
  -[BRCClientZone scheduleSyncDownFirst](self->_clientZone, "scheduleSyncDownFirst");
}

- (void)markDead
{
  _BOOL4 v3;
  BRCLocalStatInfo *st;
  void *v5;

  v3 = -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem");
  st = self->_st;
  if (v3)
  {
    -[BRCAppLibrary documentsFolderItemID](self->_appLibrary, "documentsFolderItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo _markDeadAsSharedTopLevelItemWithDocumentsItemID:](st, "_markDeadAsSharedTopLevelItemWithDocumentsItemID:", v5);

  }
  else
  {
    -[BRCLocalStatInfo _markDead](self->_st, "_markDead");
  }
  -[BRCLocalStatInfo _moveItemAsideWithUUIDString](self->_st, "_moveItemAsideWithUUIDString");
  self->_isUserVisible = 0;
}

- (void)markNeedsDeleteForRescheduleOfItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BRCLocalItem isDead](self, "isDead"))
    -[BRCLocalItem markDead](self, "markDead");
  self->_forceDelete = 1;
  if (v5)
    objc_msgSend(v4, "createApplyJobFromServerItem:localItem:state:kind:", v5, 0, 1, 1);

}

- (void)markNeedsDeleteWhenAlreadyDeadInServerTruth
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isDead && self.isDeadOrMissingInServerTruth%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markNeedsDeleteForItemIDTransfer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isDead%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)moveAsideLocally
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _st.state == BRC_ITEM_STATE_TOMBSTONE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markRemovedFromFilesystemForServerEdit:(BOOL)a3
{
  -[BRCLocalItem markDead](self, "markDead");
  if (!a3)
    -[BRCLocalItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
}

- (void)updateStatMetadataFromServerItem:(id)a3
{
  BRCLocalStatInfo *st;
  id v4;

  st = self->_st;
  objc_msgSend(a3, "st");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo _updateStatMeta:](st, "_updateStatMeta:", v4);

}

- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4
{
  id v6;
  void *v7;
  int sharingOptions;
  unint64_t v9;
  BRCZoneRowID *parentZoneRowID;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BRCUserRowID *v18;
  BRCUserRowID *ownerKey;

  v6 = a3;
  v7 = v6;
  if (!a4
    && (sharingOptions = self->_sharingOptions,
        ((objc_msgSend(v6, "sharingOptions") ^ sharingOptions) & 0x20) != 0))
  {
    v9 = objc_msgSend(v7, "sharingOptions") ^ 0x20;
  }
  else
  {
    v9 = objc_msgSend(v7, "sharingOptions");
  }
  self->_sharingOptions = v9;
  if ((v9 & 4) == 0)
  {
    parentZoneRowID = self->_parentZoneRowID;
    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(parentZoneRowID) = -[BRCZoneRowID br_isEqualToNumber:](parentZoneRowID, "br_isEqualToNumber:", v11);

    if ((_DWORD)parentZoneRowID)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem updateItemMetadataFromServerItem:appliedSharingPermission:].cold.1();

      -[BRCClientZone db](self->_clientZone, "db");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "parentItemIDOnFS");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "numberWithSQL:", CFSTR("SELECT item_sharing_options FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v15, v16);

      self->_sharingOptions = self->_sharingOptions & 0xFFFFFFFFFFFFFF83 | objc_msgSend(v17, "longLongValue") & 0x78;
    }
  }
  objc_msgSend(v7, "ownerKey");
  v18 = (BRCUserRowID *)objc_claimAutoreleasedReturnValue();
  ownerKey = self->_ownerKey;
  self->_ownerKey = v18;

}

- (id)computedDestinationFilenameFromServerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem st](self, "st");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logicalNameWithoutLocalBounce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", v8))
  {

    goto LABEL_5;
  }
  objc_msgSend(v4, "parentItemIDOnFS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem st](self, "st");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToItemID:", v11);

  if (!v12)
  {
LABEL_5:
    objc_msgSend(v4, "st");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "representableName");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[BRCLocalItem st](self, "st");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logicalName");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = (void *)v14;

  return v15;
}

- (void)updateStructuralCKInfoFromServerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BRFieldCKInfo *v14;
  BRFieldCKInfo *sideCarCKInfo;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "etag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v18;
    v25 = 2112;
    v26 = v4;
    v27 = 2112;
    v28 = v7;
    _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] updating st-etag:%@ from server item: %@%@", (uint8_t *)&v23, 0x20u);

  }
  if (!v4)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.3();

  }
  if ((objc_msgSend(v4, "isSharedToMeTopLevelItem") & 1) == 0 && !v6)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.2();

  }
  if (-[BRCLocalItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCStatInfo ckInfo](self->_st, "ckInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "etagBeforeCrossZoneMove");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEtagBeforeCrossZoneMove:", v10);

  }
  -[BRCLocalStatInfo _setCKInfo:](self->_st, "_setCKInfo:", v6);
  objc_msgSend(v4, "st");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "creatorRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo setCreatorRowID:](self->_st, "setCreatorRowID:", v12);

  if (-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    objc_msgSend(v4, "sideCarInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ckInfo");
    v14 = (BRFieldCKInfo *)objc_claimAutoreleasedReturnValue();
    sideCarCKInfo = self->_sideCarCKInfo;
    self->_sideCarCKInfo = v14;

    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.1();

  }
}

- (id)_updateCrossZoneParent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRCAccountSessionFPFS *session;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRCZoneRowID *v12;
  BRCZoneRowID *parentZoneRowID;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem _updateCrossZoneParent:].cold.2();

  }
  -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemGlobalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  objc_msgSend(v6, "zoneRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo setParentID:](self->_st, "setParentID:", v11);

  objc_msgSend(v6, "zoneRowID");
  v12 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
  parentZoneRowID = self->_parentZoneRowID;
  self->_parentZoneRowID = v12;

  objc_storeStrong((id *)&self->_clientZone, v10);
  self->_serverZone = (BRCServerZone *)(id)objc_msgSend(v10, "serverZone");
  self->_orig->_syncUpState = 0;
  -[BRCStatInfo ckInfo](self->_st, "ckInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "markCrossZoneMoved");

  if (-[BRCLocalItem isDirectory](self, "isDirectory")
    && (-[BRCLocalItem asDirectory](self, "asDirectory"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "handlePathMatchConflictForDirectoryCreationIfNecessary"),
        v15,
        v16))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem _updateCrossZoneParent:].cold.1();

  }
  else
  {
    v17 = (void *)objc_opt_new();
    -[BRCLocalItem learnItemID:serverItem:](self, "learnItemID:serverItem:", v17, 0);
  }

  self->_sharingOptions = objc_msgSend(v4, "sharingOptions") & 0x78;
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    BRCPrettyPrintBitmap();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = v22;
    v27 = 2112;
    v28 = v4;
    v29 = 2112;
    v30 = v19;
    _os_log_debug_impl(&dword_230455000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] learning sharing options %@ from parent %@%@", (uint8_t *)&v25, 0x20u);

  }
  return v5;
}

- (void)_insertTombstoneForCrossZoneMove:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)-[BRCLocalItem copy](self, "copy");
  objc_msgSend(v7, "_markAsDeadTombstoneWithPreviousGlobalID:", v4);

  objc_msgSend(v7, "markNeedsUploadOrSyncingUp");
  objc_msgSend(v7, "saveToDB");
  -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rescheduleSuspendedJobsMatching:inState:", v6, 17);

}

- (void)_crossZoneMoveToParent:(id)a3
{
  id v4;

  -[BRCLocalItem _updateCrossZoneParent:](self, "_updateCrossZoneParent:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem saveToDB](self, "saveToDB");
  -[BRCLocalItem _insertTombstoneForCrossZoneMove:](self, "_insertTombstoneForCrossZoneMove:", v4);

}

- (BOOL)needsReading
{
  return self->_syncUpState == 2;
}

- (BOOL)needsUpload
{
  return self->_syncUpState == 3;
}

- (BOOL)needsSyncUp
{
  return self->_syncUpState == 4;
}

- (BOOL)isReadAndUploaded
{
  unsigned int syncUpState;
  _BOOL4 v3;
  void *v4;
  NSObject *v5;

  syncUpState = self->_syncUpState;
  if (syncUpState >= 9)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem isReadAndUploaded].cold.1();

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x73u >> syncUpState) & 1;
  }
  return v3;
}

- (BOOL)isIdleOrRejected
{
  return self->_syncUpState < 2;
}

- (BOOL)isRejected
{
  return self->_syncUpState == 1;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  char *v17;
  NSObject *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  char *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33[3];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  memset(v33, 0, sizeof(v33));
  __brc_create_section(0, (uint64_t)"-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]", 3423, v33);
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v31 = v33[0];
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "logName");
    v27 = (char *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self, "itemID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    BRCPrettyPrintBitmap();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v35 = (const char *)v31;
    v36 = 2112;
    v37 = v27;
    v38 = 2112;
    v39 = v28;
    v40 = 2112;
    v41 = v29;
    v42 = 2112;
    v43 = v14;
    _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx request to download client item %@:%@ with options %@%@", buf, 0x34u);

  }
  v16 = -[BRCLocalItem isDead](self, "isDead");
  if (v16)
  {
    brc_bread_crumbs();
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[BRCLocalItem itemID](self, "itemID");
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v19;
      v36 = 2112;
      v37 = v17;
      _os_log_impl(&dword_230455000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring download request for %@ because item is dead%@", buf, 0x16u);

    }
    v20 = (void *)MEMORY[0x24BDD1540];
    -[BRCLocalItem itemID](self, "itemID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "itemIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "brc_errorItemNotFound:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
      {
        v30 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v35 = "-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:]";
        v36 = 2080;
        if (!a7)
          v30 = "(ignored by caller)";
        v37 = v30;
        v38 = 2112;
        v39 = v23;
        v40 = 2112;
        v41 = v24;
        _os_log_error_impl(&dword_230455000, v25, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a7)
      *a7 = objc_retainAutorelease(v23);

  }
  __brc_leave_section(v33);

  return !v16;
}

- (unint64_t)dbRowID
{
  return self->_dbRowID;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (BRCUserRowID)ownerKey
{
  return self->_ownerKey;
}

- (BRCLocalStatInfo)st
{
  return self->_st;
}

- (unsigned)syncUpState
{
  return self->_syncUpState;
}

- (BRCLocalItem)orig
{
  return self->_orig;
}

- (unint64_t)localDiffs
{
  return self->_localDiffs;
}

- (unint64_t)notifsRank
{
  return self->_notifsRank;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (unint64_t)sharingOptions
{
  return self->_sharingOptions;
}

- (void)setSharingOptions:(unint64_t)a3
{
  self->_sharingOptions = a3;
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (id)baseStructureRecord
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(CKConversions) baseStructureRecord].cold.1();

    v5 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDB91D8]);
    -[BRCLocalItem structureRecordID](self, "structureRecordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithRecordType:recordID:", CFSTR("structure"), v7);

  }
  return v5;
}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5 saltGetter:(id)a6 childBasehashSaltGetter:(id)a7
{
  uint64_t v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  unint64_t localDiffs;
  char v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v23;

  v9 = a5;
  v10 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(CKConversions) baseStructureRecord].cold.1();
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  -[BRCLocalItem baseStructureRecord](self, "baseStructureRecord");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  localDiffs = self->_localDiffs;
  v23 = 0;
  v18 = objc_msgSend(v15, "serializeStatInfo:diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:", self, localDiffs, v12, v10, v9, v13, v14, &v23);
  v16 = v23;
  if ((v18 & 1) == 0)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(CKConversions) structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:].cold.2();

    goto LABEL_9;
  }
  -[BRCLocalItem serializeStructuralPluginHints:](self, "serializeStructuralPluginHints:", v15);
  v15 = v15;
  v19 = v15;
LABEL_10:

  return v19;
}

- (id)sideCarRecordID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  if (-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    -[BRCLocalItem itemID](self, "itemID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem serverZone](self, "serverZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asSharedZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sideCarRecordIDWithZone:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(CKConversions) sideCarRecordID].cold.1();

    v6 = 0;
  }
  return v6;
}

- (id)baseSideCarRecord
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDB91D8]);
  -[BRCLocalItem sideCarRecordID](self, "sideCarRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordType:recordID:", CFSTR("perParticipantMetadata"), v4);

  return v5;
}

- (void)serializeStructuralPluginHints:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  BRCLocalItem *v7;
  BRCLocalItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BRCLocalItem *v24;
  __int16 v25;
  BRCLocalItem *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[BRCLocalItem isFromInitialScan](self, "isFromInitialScan");
  -[BRCLocalItem serverPathMatchItemID](self, "serverPathMatchItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[BRCClientZone itemByItemID:](self->_clientZone, "itemByItemID:", v6);
    v7 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || !-[BRCLocalItem isDead](v7, "isDead") && v5)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_20;
    }
    -[BRCLocalItem structureRecordID](v8, "structureRecordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138412802;
      v24 = self;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v12;
      _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] path match info for %@ is %@%@", (uint8_t *)&v23, 0x20u);
    }

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecordID:action:", v11, 0);
    -[BRCLocalItem st](v8, "st");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ckInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "etag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v10)
      {
LABEL_19:

LABEL_20:
        if (!v5)
          goto LABEL_21;
        goto LABEL_23;
      }
    }
    else
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412802;
        v24 = v8;
        v25 = 2112;
        v26 = self;
        v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_230455000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] we have no etag for %@\npath matching: %@%@", (uint8_t *)&v23, 0x20u);
      }

      if (v10)
        goto LABEL_19;
    }
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412802;
      v24 = v8;
      v25 = 2112;
      v26 = self;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] we have no reference for %@\npath matching: %@%@", (uint8_t *)&v23, 0x20u);
    }

    goto LABEL_19;
  }
  v9 = 0;
  v10 = 0;
  if (!v5)
  {
LABEL_21:
    if (!v10 || !v9)
      goto LABEL_32;
  }
LABEL_23:
  objc_msgSend(v4, "pluginFields");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v4, "pluginFields");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

  }
  else
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  }

  if (v5)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("br_initialItem"));
  if (v10 && v9)
  {
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, CFSTR("br_pathMatchID"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v9, CFSTR("br_pathMatchEtag"));
  }
  objc_msgSend(v4, "setPluginFields:", v22);

LABEL_32:
}

- (id)structureRecordID
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BRCServerZone *serverZone;
  void *v9;
  void *v10;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(CKConversions) structureRecordID].cold.1();

    v5 = 0;
  }
  else
  {
    -[BRCLocalItem itemID](self, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BRCStatInfo type](self->_st, "type");
    serverZone = self->_serverZone;
    if (-[BRCLocalItem isBRAlias](self, "isBRAlias"))
    {
      -[BRCLocalItem asBRAlias](self, "asBRAlias");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "targetClientZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v7, serverZone, objc_msgSend(v10, "isSharedZone"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", v7, serverZone, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (BOOL)logicalNameNeedsRename
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[BRCLocalStatInfo rawBouncedLogicalName](self->_st, "rawBouncedLogicalName");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[BRCLocalStatInfo rawBouncedLogicalName](self->_st, "rawBouncedLogicalName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->_st, "logicalNameWithoutLocalBounce");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) != 0)
    {
LABEL_3:
      LOBYTE(v3) = 0;
      return v3;
    }
    v22 = 0;
    -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->_st, "logicalNameWithoutLocalBounce");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "br_stringByDeletingPathBounceNo:", &v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCLocalStatInfo logicalName](self->_st, "logicalName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "br_stringByDeletingPathBounceNo:", &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) != 0)
    {
      -[BRCAccountSessionFPFS serverZoneByRowID:](self->_session, "serverZoneByRowID:", self->_parentZoneRowID);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clientZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[BRCStatInfo parentID](self->_st, "parentID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->_st, "logicalNameWithoutLocalBounce");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "existsByParentID:andLogicalName:excludingItemID:", v14, v15, self->_itemID);

      if ((v16 & 1) != 0)
      {

        goto LABEL_3;
      }
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[BRCLocalItem(FPFSAdditions) logicalNameNeedsRename].cold.1();

    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v24 = v9;
        v25 = 2112;
        v26 = v11;
        v27 = 2112;
        v28 = v17;
        _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Needs rename because local name %@ differs from real name %@%@", buf, 0x20u);
      }

    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isMigratingToFPFS
{
  return self->_syncUpState - 5 < 2;
}

- (BOOL)dbItemIsMigratingToFPFS
{
  id v2;
  int v3;

  v2 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT item_localsyncupstate FROM client_items WHERE rowid = %llu"), self->_dbRowID);
  v3 = objc_msgSend(v2, "intValue");

  return (v3 - 5) < 2;
}

- (void)markFromInitialScan
{
  void *v3;
  NSObject *v4;

  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCLocalItem(FPFSAdditions) markFromInitialScan].cold.1();

  self->_localDiffs |= 0x8000000000000000;
}

- (void)markDoneMigratingToFPFS
{
  unsigned int v3;

  if (-[BRCLocalItem isMigratingToFPFS](self, "isMigratingToFPFS"))
  {
    if (-[BRCLocalItem hasValidCKInfo](self, "hasValidCKInfo"))
      v3 = 0;
    else
      v3 = 4;
    self->_syncUpState = v3;
  }
}

- (void)markCannotSynchronizeForTooDeepHierarchy
{
  self->_syncUpState = 8;
}

- (void)markBouncedToNextAvailableBounceNumber:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  __int128 v31;
  uint64_t v33;
  BRCLocalItem *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  _BYTE buf[12];
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->_st, "logicalNameWithoutLocalBounce");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo rawBouncedLogicalName](self->_st, "rawBouncedLogicalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v37 = 0;
  v38 = 0;
  if (!v5)
    v5 = v4;
  objc_msgSend(v5, "br_stringByDeletingPathBounceNo:andPathExtension:", &v38, &v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v37;
  if ((unint64_t)(v38 + 1) > 2)
    v7 = v38 + 1;
  else
    v7 = 2;
  v34 = self;
  -[BRCAppLibrary mangledID](self->_appLibrary, "mangledID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ubiquitousMigrationMaxBouncingAttempts");

  if (v6)
  {
    *(_QWORD *)buf = 0;
    v12 = (id)objc_msgSend(v4, "br_stringByDeletingPathBounceNo:", buf);
    v13 = v38;
    if (*(_QWORD *)buf != v38)
      v7 = *(_QWORD *)buf;
  }
  else
  {
    v13 = v38;
  }
  if (v7 < v13 + v10)
  {
    *(_QWORD *)&v11 = 138412290;
    v31 = v11;
    v33 = v10;
    do
    {
      if (v6)
        v14 = v7 == v13;
      else
        v14 = 0;
      v15 = v14;
      if (v7 != 1 && (v15 & 1) == 0)
      {
        if (v7)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        v17 = v4;
        objc_msgSend(v16, "stringValue", v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", v18, v35, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v6, "isEqualToString:", v19))
        {
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v31;
            *(_QWORD *)&buf[4] = v25;
            _os_log_fault_impl(&dword_230455000, v26, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: ![alreadyBouncedName isEqualToString:bouncedLogicalName]%@", buf, 0xCu);
          }

        }
        -[BRCLocalItem parentClientZone](v34, "parentClientZone");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem st](v34, "st");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "parentID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem itemID](v34, "itemID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "liveItemByParentID:andCaseInsensitiveLogicalName:excludingItemID:", v22, v19, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v4 = v17;
          if (objc_msgSend(v17, "isEqualToString:", v19))
            v27 = 0;
          else
            v27 = v19;
          -[BRCLocalStatInfo setRawBouncedLogicalName:](v34->_st, "setRawBouncedLogicalName:", v27);
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v34;
            v40 = 2112;
            v41 = v28;
            _os_log_debug_impl(&dword_230455000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Locally bounced %@%@", buf, 0x16u);
          }

          break;
        }

        v4 = v17;
        v10 = v33;
      }
      ++v7;
      v13 = v38;
    }
    while (v7 < v38 + v10);
  }
  if (a3)
  {
    -[BRCAccountSessionFPFS analyticsReporter](v34->_session, "analyticsReporter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "aggregateReportForAppTelemetryIdentifier:error:", a3, 0);

  }
}

- (void)_updateAppLibraryFromParent:(id)a3
{
  BRCAppLibrary *v4;
  BRCAppLibrary *appLibrary;
  void *v6;
  NSObject *v7;

  objc_msgSend(a3, "appLibrary");
  v4 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
  appLibrary = self->_appLibrary;
  self->_appLibrary = v4;

  if (!self->_appLibrary)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem _refreshAppLibraryFromParent].cold.2();

  }
}

- (void)_updateParent:(id)a3 forceTopLevelShareMove:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  BRCLocalItem *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  BRCZoneRowID *v21;
  BRCZoneRowID *parentZoneRowID;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  BRCLocalItem *v46;
  uint8_t buf[4];
  BRCLocalItem *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  BRCLocalItem *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[BRCLocalItem clientZone](self, "clientZone");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientZone");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!a4 && -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    objc_msgSend(v6, "clientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSharedZone");

    if (!v10)
      goto LABEL_4;
LABEL_8:
    brc_bread_crumbs();
    v11 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v48 = self;
      v49 = 2112;
      v50 = v7;
      v51 = 2112;
      v52 = v8;
      v53 = 2112;
      v54 = v11;
      _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is moving across zones from %@ to %@%@", buf, 0x2Au);
    }
    goto LABEL_10;
  }
  if (v7 != v8)
    goto LABEL_8;
LABEL_4:
  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
    v11 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientZone");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject dbRowID](v12, "dbRowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem updateParentZoneRowID:](v11, "updateParentZoneRowID:", v13);

    goto LABEL_6;
  }
  if (!-[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
    goto LABEL_17;
  objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", self);
  v11 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12
    || (-[BRCLocalItem recordName](v11, "recordName"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSObject recordName](v12, "recordName"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v14, "isEqualToString:", v15),
        v15,
        v14,
        (v16 & 1) == 0))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v48 = v11;
      v49 = 2112;
      v50 = (uint64_t)v12;
      v51 = 2112;
      v52 = (uint64_t)v17;
      _os_log_impl(&dword_230455000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] This is a cross share move from %@ to %@%@", buf, 0x20u);
    }

LABEL_10:
    -[BRCLocalItem _crossZoneMoveToParent:](self, "_crossZoneMoveToParent:", v6);
    goto LABEL_18;
  }
LABEL_6:

LABEL_17:
  objc_msgSend(v6, "itemID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo setParentID:](self->_st, "setParentID:", v19);

  objc_msgSend(v6, "clientZone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dbRowID");
  v21 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
  parentZoneRowID = self->_parentZoneRowID;
  self->_parentZoneRowID = v21;

LABEL_18:
  -[BRCLocalItem _updateAppLibraryFromParent:](self, "_updateAppLibraryFromParent:", v6);
  v23 = objc_msgSend(v6, "itemScope");
  objc_msgSend(v6, "clientZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "zoneName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = self;
  v43 = (void *)v8;
  v44 = (void *)v7;
  if ((objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BE172B0]) & 1) != 0)
  {
    objc_msgSend(v6, "st");
    v26 = v23;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logicalName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BE17538]);

    if (v29)
      v26 = 2;
    v45 = v26;
  }
  else
  {
    v45 = v23;

  }
  v30 = objc_msgSend(v6, "isUserVisible");
  objc_msgSend(v6, "itemID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isNonDesktopRoot");
  -[BRCLocalStatInfo logicalName](v46->_st, "logicalName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v6, "isZoneRoot");
  if ((v34 & 1) != 0)
  {
    v35 = 0;
  }
  else
  {
    objc_msgSend(v6, "st");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "logicalName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appLibrary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46->_isUserVisible = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:](BRCLocalItem, "computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:", v30, v32, v45, v33, v35, v36);

  if ((v34 & 1) == 0)
  {

  }
  objc_msgSend(v6, "itemID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isNonDesktopRoot");
  objc_msgSend(v6, "itemID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isDocumentsFolder");
  -[BRCLocalStatInfo logicalName](v46->_st, "logicalName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo setItemScope:](v46->_st, "setItemScope:", +[BRCLocalItem computeItemScopeFromParentIsRoot:parentIsDocuments:parentScope:logicalName:](BRCLocalItem, "computeItemScopeFromParentIsRoot:parentIsDocuments:parentScope:logicalName:", v38, v40, v45, v41));

  if ((v46->_sharingOptions & 4) == 0)
    v46->_sharingOptions = objc_msgSend(v6, "sharingOptions") & 0x78;

}

- (void)updateWithLogicalName:(id)a3 newParent:(id)a4
{
  -[BRCLocalItem updateWithLogicalName:newParent:forceTopLevelShareMove:](self, "updateWithLogicalName:newParent:forceTopLevelShareMove:", a3, a4, 0);
}

- (void)updateWithLogicalName:(id)a3 newParent:(id)a4 forceTopLevelShareMove:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[BRCLocalItem itemID](self, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDocumentsFolder");

  if (v11)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BRCLocalItem(FPFSAdditions) updateWithLogicalName:newParent:forceTopLevelShareMove:].cold.1();

  }
  else
  {
    if (v8)
      -[BRCLocalStatInfo setFilename:](self->_st, "setFilename:", v8);
    if (v9)
      -[BRCLocalItem _updateParent:forceTopLevelShareMove:](self, "_updateParent:forceTopLevelShareMove:", v9, v5);
  }

}

- (void)_updatePropagatedInfoIfNeeded
{
  if ((-[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem") & 0x1000000060) != 0)
  {
    -[BRCLocalItem _refreshAppLibraryFromParent](self, "_refreshAppLibraryFromParent");
    -[BRCLocalItem _recomputeUserVisibleAndItemScope](self, "_recomputeUserVisibleAndItemScope");
  }
}

- (BOOL)updateFromServerItem:(id)a3
{
  id v4;
  void *v5;
  BRCZoneRowID *v6;
  BRCZoneRowID *parentZoneRowID;
  BRCUserRowID *v8;
  BRCUserRowID *ownerKey;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  char v22;

  v4 = a3;
  if (-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected")
    || -[BRCLocalItem isShareAcceptationFault](self, "isShareAcceptationFault"))
  {
    objc_msgSend(v4, "parentZoneOnFS");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dbRowID");
    v6 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
    parentZoneRowID = self->_parentZoneRowID;
    self->_parentZoneRowID = v6;

    if (objc_msgSend(v4, "isBRAlias"))
    {
      -[BRCLocalStatInfo _updateStatAliasMeta:](self->_st, "_updateStatAliasMeta:", v4);
    }
    else
    {
      objc_msgSend(v4, "ownerKey");
      v8 = (BRCUserRowID *)objc_claimAutoreleasedReturnValue();
      ownerKey = self->_ownerKey;
      self->_ownerKey = v8;

      self->_sharingOptions = objc_msgSend(v4, "sharingOptions");
      -[BRCLocalStatInfo _updateStatMetaFromServer:](self->_st, "_updateStatMetaFromServer:", v4);
      -[BRCLocalStatInfo rawBouncedLogicalName](self->_st, "rawBouncedLogicalName");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        -[BRCLocalItem parentClientZone](self, "parentClientZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem st](self, "st");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "parentID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem st](self, "st");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logicalNameWithoutLocalBounce");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem itemID](self, "itemID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v12, "existsByParentID:andLogicalName:excludingItemID:", v14, v16, v17);

        if ((v22 & 1) == 0)
          -[BRCLocalStatInfo clearBouncedName](self->_st, "clearBouncedName");
      }
      -[BRCLocalItem updateItemMetadataFromServerItem:appliedSharingPermission:](self, "updateItemMetadataFromServerItem:appliedSharingPermission:", v4, 0);
    }
    -[BRCLocalItem _updatePropagatedInfoIfNeeded](self, "_updatePropagatedInfoIfNeeded");
    v18 = 1;
  }
  else
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(FPFSAdditions) updateFromServerItem:].cold.1();

    v18 = 0;
  }

  return v18;
}

- (void)_moveToZoneWhenServerItemIsDead:(id)a3
{
  void *v5;
  void *v6;
  BRCLocalStatInfo *st;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)objc_opt_new();
  -[BRCLocalItem learnItemID:serverItem:](self, "learnItemID:serverItem:", v5, 0);

  -[BRCLocalItem markItemForgottenByServer](self, "markItemForgottenByServer");
  objc_storeStrong((id *)&self->_clientZone, a3);
  self->_serverZone = (BRCServerZone *)(id)objc_msgSend(v9, "serverZone");
  -[BRCLocalStatInfo rawBouncedLogicalName](self->_st, "rawBouncedLogicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->_st;
  if (v6)
  {
    -[BRCStatInfo setLogicalName:](st, "setLogicalName:", v6);
  }
  else
  {
    -[BRCLocalStatInfo logicalName](st, "logicalName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setLogicalName:](self->_st, "setLogicalName:", v8);

  }
}

- (void)updateWithFavoriteRank:(unint64_t)a3
{
  -[BRCStatInfo setFavoriteRank:](self->_st, "setFavoriteRank:", a3);
}

- (void)updateWithFinderTagNames:(id)a3
{
  id v4;
  BRFieldFinderTags *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BRCLocalStatInfo *st;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(BRFieldFinderTags);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[BRFieldFinderTags addTags:](v5, "addTags:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), (_QWORD)v13);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    st = self->_st;
    -[BRFieldFinderTags data](v5, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setFinderTags:](st, "setFinderTags:", v12);

  }
  else
  {
    -[BRCStatInfo setFinderTags:](self->_st, "setFinderTags:", 0);
  }

}

- (void)updateWithLastUsedDate:(id)a3
{
  BRCLocalStatInfo *st;
  double v4;

  st = self->_st;
  objc_msgSend(a3, "timeIntervalSince1970");
  -[BRCStatInfo setLastUsedTime:](st, "setLastUsedTime:", (unint64_t)v4);
}

- (void)updateToBeInTrashWithParent:(id)a3 trashPutBackPath:(id)a4 trashPutBackParentID:(id)a5
{
  id v8;
  BRCZoneRowID *parentZoneRowID;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  BRCLocalStatInfo *st;
  void *v17;
  BRCZoneRowID *v18;
  BRCZoneRowID *v19;

  v8 = a4;
  parentZoneRowID = self->_parentZoneRowID;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "zoneRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCZoneRowID br_isEqualToNumber:](parentZoneRowID, "br_isEqualToNumber:", v12))
  {
LABEL_6:

    goto LABEL_7;
  }
  -[BRCAccountSessionFPFS serverZoneByRowID:](self->_session, "serverZoneByRowID:", self->_parentZoneRowID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSharedZone");

  if ((v14 & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(FPFSAdditions) updateToBeInTrashWithParent:trashPutBackPath:trashPutBackParentID:].cold.1();

    goto LABEL_6;
  }
LABEL_7:
  -[BRCStatInfo setTrashPutBackPath:](self->_st, "setTrashPutBackPath:", v8);
  -[BRCStatInfo setTrashPutBackParentID:](self->_st, "setTrashPutBackParentID:", v10);

  st = self->_st;
  objc_msgSend(v11, "itemID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo setParentID:](st, "setParentID:", v17);

  objc_msgSend(v11, "zoneRowID");
  v18 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();

  v19 = self->_parentZoneRowID;
  self->_parentZoneRowID = v18;

  -[BRCLocalStatInfo setItemScope:](self->_st, "setItemScope:", 3);
  -[BRCLocalItem _recomputeUserVisibleAndItemScope](self, "_recomputeUserVisibleAndItemScope");

}

- (void)updateToBeUntrashedWithParent:(id)a3
{
  BRCZoneRowID *parentZoneRowID;
  id v5;
  void *v6;
  BRCLocalStatInfo *st;
  void *v8;
  BRCZoneRowID *v9;
  BRCZoneRowID *v10;
  void *v11;
  NSObject *v12;

  parentZoneRowID = self->_parentZoneRowID;
  v5 = a3;
  objc_msgSend(v5, "zoneRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(parentZoneRowID) = -[BRCZoneRowID br_isEqualToNumber:](parentZoneRowID, "br_isEqualToNumber:", v6);

  if ((parentZoneRowID & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(FPFSAdditions) updateToBeUntrashedWithParent:].cold.1();

  }
  -[BRCStatInfo setTrashPutBackPath:](self->_st, "setTrashPutBackPath:", 0);
  -[BRCStatInfo setTrashPutBackParentID:](self->_st, "setTrashPutBackParentID:", 0);
  st = self->_st;
  objc_msgSend(v5, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo setParentID:](st, "setParentID:", v8);

  objc_msgSend(v5, "zoneRowID");
  v9 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();

  v10 = self->_parentZoneRowID;
  self->_parentZoneRowID = v9;

  -[BRCLocalStatInfo setItemScope:](self->_st, "setItemScope:", 2);
  -[BRCLocalItem _recomputeUserVisibleAndItemScope](self, "_recomputeUserVisibleAndItemScope");
}

- (BOOL)updateWithImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v5;
  id v7;
  BRCAppLibrary *v8;
  BRCAppLibrary *appLibrary;
  void *v10;
  BRCZoneRowID *v11;
  BRCZoneRowID *parentZoneRowID;

  v5 = a4;
  v7 = a3;
  objc_msgSend(v7, "appLibrary");
  v8 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
  appLibrary = self->_appLibrary;
  self->_appLibrary = v8;

  objc_msgSend(v7, "parentItemGlobalID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zoneRowID");
  v11 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
  parentZoneRowID = self->_parentZoneRowID;
  self->_parentZoneRowID = v11;

  if (!v5)
  {
    self->_isUserVisible = objc_msgSend(v7, "isUserVisible");
    self->_sharingOptions = objc_msgSend(v7, "sharingOptions");
    -[BRCLocalStatInfo setItemScope:](self->_st, "setItemScope:", objc_msgSend(v7, "itemScope"));
  }
  -[BRCLocalStatInfo updateFromImportObject:onlyContentDependentProperties:](self->_st, "updateFromImportObject:onlyContentDependentProperties:", v7, v5);

  return 1;
}

- (void)updateWithCreationDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  -[BRCStatInfo setBirthtime:](self->_st, "setBirthtime:", (uint64_t)v4);
}

- (void)updateWithFileSystemFlags:(unint64_t)a3
{
  BRCLocalStatInfo *st;
  _BOOL8 v6;

  st = self->_st;
  v6 = -[BRCLocalItem isPackage](self, "isPackage") || -[BRCLocalItem isDirectory](self, "isDirectory");
  -[BRCLocalStatInfo updateWithFileSystemFlags:ignoreExecutable:](st, "updateWithFileSystemFlags:ignoreExecutable:", a3, v6);
  if ((a3 & 8) != 0)
  {
    self->_isUserVisible = 0;
  }
  else if (!self->_isUserVisible && !-[BRCLocalItem isInDataScope](self, "isInDataScope"))
  {
    -[BRCLocalItem _recomputeUserVisibleAndItemScope](self, "_recomputeUserVisibleAndItemScope");
  }
}

- (void)updateWithXattrs:(id)a3
{
  void *v4;
  uint64_t v5;
  BRCLocalStatInfo *st;
  NSData *xattrSignature;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id obj;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  obj = 0;
  +[BRFieldXattrBlob loadXattrsFromDictionary:structuralBlob:contentBlob:](BRFieldXattrBlob, "loadXattrsFromDictionary:structuralBlob:contentBlob:", a3, &obj, &v22);
  -[BRCAccountSessionFPFS stageRegistry](self->_session, "stageRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_st->super._lazyXattr, obj);
  objc_msgSend(obj, "brc_signature");
  v5 = objc_claimAutoreleasedReturnValue();
  st = self->_st;
  xattrSignature = st->super._xattrSignature;
  st->super._xattrSignature = (NSData *)v5;

  if (obj)
  {
    v21 = 0;
    if ((objc_msgSend(v4, "saveXattrBlob:forSignature:error:", obj, self->_st->super._xattrSignature, &v21) & 1) == 0)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        -[BRCStatInfo xattrSignature](self->_st, "xattrSignature");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v25 = v19;
        v26 = 2112;
        v27 = v21;
        v28 = 2112;
        v29 = v8;
        _os_log_fault_impl(&dword_230455000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to save xattr blob to stage for signature %@ - %@%@", buf, 0x20u);

      }
    }

  }
  if (-[BRCLocalItem isDocument](self, "isDocument"))
  {
    -[BRCLocalItem asDocument](self, "asDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentVersion");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      objc_storeStrong((id *)(v11 + 72), v22);
      objc_msgSend(v22, "brc_signature");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setXattrSignature:", v13);

      if (v22)
      {
        v21 = 0;
        -[BRCAccountSessionFPFS stageRegistry](self->_session, "stageRegistry");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v22;
        objc_msgSend(v12, "xattrSignature");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v15) = objc_msgSend(v14, "saveXattrBlob:forSignature:error:", v15, v16, &v21);

        if ((v15 & 1) == 0)
        {
          brc_bread_crumbs();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            -[BRCStatInfo xattrSignature](self->_st, "xattrSignature");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v25 = v20;
            v26 = 2112;
            v27 = v21;
            v28 = 2112;
            v29 = v17;
            _os_log_fault_impl(&dword_230455000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to save xattr blob to stage for signature %@ - %@%@", buf, 0x20u);

          }
        }

      }
    }

  }
}

- (id)_initWithImportObject:(id)a3 error:(id *)a4
{
  void *v4;
  id v7;
  BRCLocalItem *v8;
  BRCAccountSessionFPFS *v9;
  uint64_t v10;
  BRCPQLConnection *db;
  uint64_t v12;
  BRCAppLibrary *appLibrary;
  uint64_t v14;
  uint64_t v15;
  BRCClientZone *clientZone;
  BRCItemID *v17;
  BRCAccountSessionFPFS *session;
  uint64_t v19;
  BRCClientZone *v20;
  BRCItemID *itemID;
  void *v22;
  uint64_t v23;
  BRCZoneRowID *parentZoneRowID;
  BOOL v25;
  void *v26;
  BRCAccountSessionFPFS *v27;
  BRCLocalStatInfo *v28;
  BRCLocalStatInfo *st;
  objc_super v31;

  v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BRCLocalItem;
  v8 = -[BRCLocalItem init](&v31, sel_init);
  if (!v8)
    goto LABEL_12;
  v9 = (BRCAccountSessionFPFS *)(id)objc_msgSend(v7, "session");
  v8->_session = v9;
  -[BRCAccountSessionFPFS clientDB](v9, "clientDB");
  v10 = objc_claimAutoreleasedReturnValue();
  db = v8->_db;
  v8->_db = (BRCPQLConnection *)v10;

  objc_msgSend(v7, "appLibrary");
  v12 = objc_claimAutoreleasedReturnValue();
  appLibrary = v8->_appLibrary;
  v8->_appLibrary = (BRCAppLibrary *)v12;

  if (objc_msgSend(v7, "isDocumentsFolder"))
  {
    -[BRCAppLibrary defaultClientZone](v8->_appLibrary, "defaultClientZone");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = 24;
    clientZone = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v14;

    v8->_serverZone = (BRCServerZone *)-[BRCClientZone serverZone](v8->_clientZone, "serverZone");
    -[BRCAppLibrary documentsFolderItemID](v8->_appLibrary, "documentsFolderItemID");
    v17 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    session = v8->_session;
    objc_msgSend(v7, "parentItemGlobalID");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "zoneRowID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_serverZone = (BRCServerZone *)-[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v4);

    -[BRCServerZone clientZone](v8->_serverZone, "clientZone");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v8->_clientZone;
    v8->_clientZone = (BRCClientZone *)v19;

    v17 = objc_alloc_init(BRCItemID);
  }
  itemID = v8->_itemID;
  v8->_itemID = v17;

  objc_msgSend(v7, "parentItemGlobalID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "zoneRowID");
  v23 = objc_claimAutoreleasedReturnValue();
  parentZoneRowID = v8->_parentZoneRowID;
  v8->_parentZoneRowID = (BRCZoneRowID *)v23;

  v25 = -[BRCServerZone isPrivateZone](v8->_serverZone, "isPrivateZone");
  if (v25)
  {
    v26 = &unk_24FEB33E0;
  }
  else
  {
    v27 = v8->_session;
    -[BRCServerZone asSharedZone](v8->_serverZone, "asSharedZone");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "ownerName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS userKeyForOwnerName:db:](v27, "userKeyForOwnerName:db:", v4, v8->_db);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&v8->_ownerKey, v26);
  if (!v25)
  {

  }
  v28 = -[BRCLocalStatInfo initWithImportObject:error:]([BRCLocalStatInfo alloc], "initWithImportObject:error:", v7, a4);
  st = v8->_st;
  v8->_st = v28;

  if (v28)
  {
    v8->_isUserVisible = objc_msgSend(v7, "isUserVisible");
    v8->_sharingOptions = objc_msgSend(v7, "sharingOptions");
    -[BRCLocalStatInfo setItemScope:](v8->_st, "setItemScope:", objc_msgSend(v7, "itemScope"));
LABEL_12:
    v28 = v8;
  }

  return v28;
}

- (id)computeItemPathRelativeToRoot
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  BRCPQLConnection *db;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maxSyncPathDepth");

  v7 = (void *)objc_opt_new();
  if (-[BRCLocalItem isFSRoot](self, "isFSRoot"))
  {
    v8 = CFSTR("/");
  }
  else
  {
    db = self->_db;
    -[BRCStatInfo parentID](self->_st, "parentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR(" WITH RECURSIVE item_parents (item_id, zone_rowid, item_filename) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_filename FROM client_items      WHERE item_id = %@ AND zone_rowid = %@ AND NOT item_id_is_documents(item_id)  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_filename FROM client_items AS li  INNER JOIN item_parents AS p USING (item_id, zone_rowid)      WHERE NOT item_id_is_documents(li.item_id)      LIMIT %u) SELECT item_filename FROM item_parents"), v10, self->_parentZoneRowID, v6);

    if (objc_msgSend(v11, "next"))
    {
      do
      {
        objc_msgSend(v11, "stringAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "insertObject:atIndex:", v12, 0);

      }
      while ((objc_msgSend(v11, "next") & 1) != 0);
    }
    -[BRCLocalItem st](self, "st");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logicalName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v14);

    objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)markRemovedFromFilesystemRecursively:(BOOL)a3
{
  -[BRCLocalItem markDead](self, "markDead", a3);
  -[BRCLocalItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
  -[BRCLocalItem moveAsideLocally](self, "moveAsideLocally");
}

- (id)liveStageFilename
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[BRCLocalItem fileObjectID](self, "fileObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCLocalItem st](self, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "stringByAppendingPathExtension:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (void)markImportedItemAsSharedWithImportBookmark:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  BRCAccountSessionFPFS *session;
  void *v9;
  BRCClientZone *v10;
  BRCClientZone *clientZone;
  BRCItemID *v12;
  BRCItemID *itemID;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  session = self->_session;
  objc_msgSend(v6, "mangledID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_serverZone = (BRCServerZone *)-[BRCAccountSessionFPFS serverZoneByMangledID:](session, "serverZoneByMangledID:", v9);

  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v10 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
  clientZone = self->_clientZone;
  self->_clientZone = v10;

  if (!self->_clientZone)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem(FPFSAdditions) markImportedItemAsSharedWithImportBookmark:parent:].cold.1();

  }
  objc_msgSend(v6, "itemID");
  v12 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  itemID = self->_itemID;
  self->_itemID = v12;

  objc_msgSend(v7, "clientZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToClientZone:", self->_clientZone);

  if (v15)
    v16 = objc_msgSend(v7, "sharingOptions") & 0xFFFFFFFFFFFFFFFBLL;
  else
    v16 = 68;
  self->_sharingOptions = v16;

}

- (BOOL)updateFPCreationItemIdentifier:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  BOOL v8;

  v5 = a3;
  if (!v5)
  {
    -[BRCLocalStatInfo fpCreationItemIdentifier](self->_st, "fpCreationItemIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_5;
  }
  -[BRCLocalStatInfo fpCreationItemIdentifier](self->_st, "fpCreationItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v5)
  {

    if ((v7 & 1) != 0)
      goto LABEL_5;
LABEL_7:
    -[BRCLocalStatInfo setFpCreationItemIdentifier:](self->_st, "setFpCreationItemIdentifier:", v5);
    v8 = -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE client_items SET fp_creation_item_identifier = %@ WHERE rowid = %llu"), v5, self->_dbRowID);
    goto LABEL_8;
  }
  if ((v7 & 1) == 0)
    goto LABEL_7;
LABEL_5:
  v8 = 1;
LABEL_8:

  return v8;
}

- (void)_recomputeUserVisibleAndItemScope
{
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  __CFString *v6;
  uint64_t v7;
  BRCPQLConnection *db;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCZoneRowID *parentZoneRowID;
  unsigned int v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  BRCZoneRowID *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[BRCStatInfo parentID](self->_st, "parentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "isNonDesktopRoot");
  if (v17)
  {
    v4 = -[BRCAppLibrary includesDataScope](self->_appLibrary, "includesDataScope") ^ 1;
    if (-[BRCAppLibrary includesDataScope](self->_appLibrary, "includesDataScope"))
      v5 = 1;
    else
      v5 = 2;
    v6 = (__CFString *)(id)*MEMORY[0x24BE17548];
LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  if (!objc_msgSend(v3, "isDocumentsFolder"))
  {
    db = self->_db;
    -[BRCStatInfo parentID](self->_st, "parentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT item_user_visible, item_scope, item_filename FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v9, self->_parentZoneRowID);

    if (objc_msgSend(v10, "next"))
    {
      v4 = objc_msgSend(v10, "BOOLAtIndex:", 0);
      v5 = objc_msgSend(v10, "intAtIndex:", 1);
      objc_msgSend(v10, "stringAtIndex:", 2);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        -[BRCStatInfo parentID](self->_st, "parentID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        parentZoneRowID = self->_parentZoneRowID;
        *(_DWORD *)buf = 138412802;
        v19 = v15;
        v20 = 2112;
        v21 = parentZoneRowID;
        v22 = 2112;
        v23 = v11;
        _os_log_fault_impl(&dword_230455000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find parent %@(%@)%@", buf, 0x20u);

      }
      v5 = 0;
      v4 = 0;
      v6 = CFSTR("UNKNOWN");
    }

    goto LABEL_14;
  }
  v6 = (__CFString *)(id)*MEMORY[0x24BE17538];
  v5 = 2;
  v7 = 1;
  v4 = 1;
LABEL_15:
  -[BRCLocalStatInfo logicalName](self->_st, "logicalName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isUserVisible = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:](BRCLocalItem, "computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:", v4, v17, v5, v13, v6, self->_appLibrary);

  -[BRCLocalStatInfo logicalName](self->_st, "logicalName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo setItemScope:](self->_st, "setItemScope:", +[BRCLocalItem computeItemScopeFromParentIsRoot:parentIsDocuments:parentScope:logicalName:](BRCLocalItem, "computeItemScopeFromParentIsRoot:parentIsDocuments:parentScope:logicalName:", v17, v7, v5, v14));

}

+ (unsigned)computeItemScopeFromParentIsRoot:(BOOL)a3 parentIsDocuments:(BOOL)a4 parentScope:(unsigned __int8)a5 logicalName:(id)a6
{
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v13;
  NSObject *v14;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v9 = a6;
  v10 = v9;
  if (v6 == 1 && v8)
  {
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17578]) & 1) != 0)
    {
LABEL_4:
      LOBYTE(v6) = 2;
      goto LABEL_15;
    }
    v11 = 0;
  }
  else
  {
    v11 = v6 == 2;
    if ((v8 || v7) && v6 == 2)
    {
      if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE175A0]))
        LOBYTE(v6) = 3;
      else
        LOBYTE(v6) = 2;
      goto LABEL_15;
    }
  }
  if (v7)
    LOBYTE(v6) = 2;
  if (!v11 && v7)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      +[BRCLocalItem(FPFSAdditions) computeItemScopeFromParentIsRoot:parentIsDocuments:parentScope:logicalName:].cold.1();

    goto LABEL_4;
  }
LABEL_15:

  return v6;
}

- (id)jobsDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("r:%lld"), -[BRCLocalItem dbRowID](self, "dbRowID"));
}

- (id)matchingJobsWhereSQLClause
{
  return (id)objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("throttle_id = %lld"), -[BRCLocalItem dbRowID](self, "dbRowID"));
}

- (void)asBRAlias
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: -asBRAlias called on a non alias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: -asDirectory called on a non directory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asDocument
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: -asDocument called on a non document%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asShareableItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: -asShareableItem called on a non shareable item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asFSRoot
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: -asFSRoot called on a non root%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asSymlink
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: -asSymlink called on a non symlink%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asFinderBookmark
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: -asFinderBookmark called on a non symlink%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asShareAcceptationFault
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: -asShareAcceptationFault called on a non fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)fileObjectID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: unknown item type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)parentFileObjectID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't find parent file objectID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asSharedToMeTopLevelItem
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Asked to get the top-level item of a non shared top level item: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)inheritOSUpgradeNeededFromItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_minimumSupportedOSRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)inheritOSUpgradeNeededFromItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: parentItem->_minimumSupportedOSRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markNeedsOSUpgradeToSyncUpWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't add the OS NAME%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initFromPQLResultSet:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Local items must be initialized with initFromPQLResultSet:container:error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_initFromPQLResultSet:session:db:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't find app library%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)sideCarInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Asked for side car info on an item that doesn't have side cars%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)parentItemIDInZone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !self.itemID.isNonDesktopRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)parentItemOnFS
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(0, "debugItemIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, a2, v4, "[CRIT] UNREACHABLE: item without parentID under parent %@%@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Rescheduling upload for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Detected sync up state change%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateSyncUpSchedulerWithDiffs:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Didn't detect the local sync up state change for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_updateInDB:diffs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _st.ckInfo.etag == nil || [_orig.st.ckInfo.etagBeforeCrossZoneMove isEqualToString:_st.ckInfo.etag] || self.isDirectory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateInDB:diffs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![self.itemID isEqualToItemID:self.orig.itemID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateInDB:diffs:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Deleting old zone sync up job for a CZM item: %@%@");
  OUTLINED_FUNCTION_0();
}

void __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] Encountered circular parenting chain%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __30__BRCLocalItem_setOfParentIDs__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Circular parenting chain%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_sendNotificationIfNeededWithDiffs:regather:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't create a notification out of an alias item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_restorePreviousGlobalID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Existing server item %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)saveToDBForServerEdit:keepAliases:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Item is already force-deleted, skipping save%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveToDBForServerEdit:keepAliases:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] overwriting serverUpdate to YES because the item is moving to IDLE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, v3, "[CRIT] UNREACHABLE: saving items should really always work: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_1_0(&dword_230455000, a2, a3, "[DEBUG] Inserting item with rowid = %llu%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] We received our first shared to me child item, schedulding side car sync%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] we don't have a corresponding alias item, and the diffs do not require alias creation, dropping the diffs%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Forcing sync up of side car zone when item changed path extension%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] this item changed significantly%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] item went out of lost state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] item with a minimum supported OS just changed, checking if we need to reattempt upload%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Deleting tombstone because it's synced up%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Deleting tombstone because it's no known to server%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Not deleting until we send the delete to children%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Force deletion has been asked, comply%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50__BRCLocalItem_saveToDBForServerEdit_keepAliases___block_invoke_cold_13(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Inserting a tombstone for the alias of %@ if necessary%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

+ (void)computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: parentScope != BRC_ITEM_SCOPE_DATA || !parentVisible%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !appLibrary.isCloudDocsAppLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)forceNeedsSyncUpWithoutDiffs
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Forcing sync up of shared item in the trash %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)markLatestSyncRequestRejectedInZone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Rejected item %@ is documents folder.  Force syncing on all%@");
  OUTLINED_FUNCTION_0();
}

- (void)markLatestSyncRequestRejectedInZone:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Rejected item %@ has meaningful local diffs.  Forcing sync on all%@");
  OUTLINED_FUNCTION_0();
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] we are still syncing %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  v4 = *MEMORY[0x24BDAC8D0];
  BRCItemFieldsPrettyPrint();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v2, "[DEBUG] we still have diffs to send: %@%@", v3);

  OUTLINED_FUNCTION_6();
}

- (void)markLatestSyncRequestAcknowledgedInZone:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _syncUpState != BRC_SUS_IDLE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateItemMetadataFromServerItem:appliedSharingPermission:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Learning parent sharing options because there is no shareID on this item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateStructuralCKInfoFromServerItem:.cold.1()
{
  NSObject *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*v1, "etag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] Also updating side car ckinfo:%@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)updateStructuralCKInfoFromServerItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ckInfo%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateStructuralCKInfoFromServerItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: serverItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateCrossZoneParent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Skipping learning new itemID because we handled the conflict with a revival%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateCrossZoneParent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: parentItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)isReadAndUploaded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: invalid sync up state%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
