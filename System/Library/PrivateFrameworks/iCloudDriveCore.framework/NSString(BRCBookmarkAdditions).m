@implementation NSString(BRCBookmarkAdditions)

+ (id)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneMangledID:saltAccountDSID:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "brc_SHA1WithSalt:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      +[NSString(BRCBookmarkAdditions) bookmarkDataWithItemResolutionString:serverZoneMangledID:saltAccountDSID:].cold.1((uint64_t)v13, v14);

    v12 = v10;
  }

  return v12;
}

+ (id)unsaltedBookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneMangledID:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(a4, "aliasTargetContainerString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZone:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "mangledID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "accountDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bookmarkDataWithItemResolutionString:serverZoneMangledID:saltAccountDSID:", v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)itemResolutionStringWithDocumentID:()BRCBookmarkAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("docID:"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bookmarkDataWithDocumentID:()BRCBookmarkAdditions serverZone:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "itemResolutionStringWithDocumentID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bookmarkDataWithItemResolutionString:serverZone:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)parseUnsaltedBookmarkDataWithItemID:()BRCBookmarkAdditions mangledID:error:
{
  void *v9;
  id v10;
  void *v11;
  BRCItemID *v12;
  BRCItemID *v13;
  void *v14;
  BRCItemID *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  BRCItemID *v21;
  void *v22;
  NSObject *v23;
  const char *v25;
  const char *v26;
  const char *v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  BRCItemID *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 2)
  {
    v10 = objc_alloc(MEMORY[0x24BE17640]);
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (BRCItemID *)objc_msgSend(v10, "initWithAliasTargetContainerString:", v11);

    if (v12)
    {
      v13 = [BRCItemID alloc];
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[BRCItemID initWithUUIDString:](v13, "initWithUUIDString:", v14);

      if (v15)
      {
        if (a4)
          objc_storeStrong(a4, v12);
        if (a3)
          objc_storeStrong(a3, v15);
        v16 = 1;
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("unsaltedBookmarkData"), a1);
      v21 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        {
          v27 = "(passed to caller)";
          v28 = 136315906;
          v29 = "-[NSString(BRCBookmarkAdditions) parseUnsaltedBookmarkDataWithItemID:mangledID:error:]";
          v30 = 2080;
          if (!a5)
            v27 = "(ignored by caller)";
          v31 = v27;
          v32 = 2112;
          v33 = v21;
          v34 = 2112;
          v35 = v22;
          _os_log_error_impl(&dword_230455000, v23, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v28, 0x2Au);
        }

      }
      if (a5)
        *a5 = objc_retainAutorelease(v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("unsaltedBookmarkData"), a1);
      v15 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          v26 = "(passed to caller)";
          v28 = 136315906;
          v29 = "-[NSString(BRCBookmarkAdditions) parseUnsaltedBookmarkDataWithItemID:mangledID:error:]";
          v30 = 2080;
          if (!a5)
            v26 = "(ignored by caller)";
          v31 = v26;
          v32 = 2112;
          v33 = v15;
          v34 = 2112;
          v35 = v19;
          _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v28, 0x2Au);
        }

      }
      if (a5)
      {
        v15 = objc_retainAutorelease(v15);
        v16 = 0;
        *a5 = v15;
LABEL_27:

        goto LABEL_28;
      }
    }
    v16 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("unsaltedBookmarkData"), a1);
  v12 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      v25 = "(passed to caller)";
      v28 = 136315906;
      v29 = "-[NSString(BRCBookmarkAdditions) parseUnsaltedBookmarkDataWithItemID:mangledID:error:]";
      v30 = 2080;
      if (!a5)
        v25 = "(ignored by caller)";
      v31 = v25;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = v17;
      _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v28, 0x2Au);
    }

  }
  if (a5)
  {
    v12 = objc_retainAutorelease(v12);
    v16 = 0;
    *a5 = v12;
  }
  else
  {
    v16 = 0;
  }
LABEL_28:

  return v16;
}

- (uint64_t)parseBookmarkDataWithAccountSession:()BRCBookmarkAdditions docID:itemID:mangledID:unsaltedBookmarkData:error:
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  BRCItemID *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  const char *v47;
  id v48;
  _QWORD *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  void *v55;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("/"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") == 3)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithAliasTargetContainerString:", v15);
    objc_msgSend(v13, "accountDSID");
    v53 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "brc_SHA1WithSalt:");
    v55 = v17;
    v52 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:") & 1) == 0
      && (objc_msgSend(v17, "isEqualToString:", CFSTR("BRGetFileNameFromServerInfoBlob")) & 1) == 0)
    {
      v29 = v16;
      v30 = a8;
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v52;
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138413058;
        v58 = (const char *)v17;
        v59 = 2112;
        v60 = v52;
        v61 = 2112;
        v62 = a1;
        v63 = 2112;
        v64 = v31;
        _os_log_error_impl(&dword_230455000, v32, (os_log_type_t)0x90u, "[ERROR] checksum from bookmark %@ is not equal to expected checksum %@ for %@%@", buf, 0x2Au);
      }

      v18 = obj;
      if (v30)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAccountMismatch");
        v27 = 0;
        *v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
      }
      v37 = (void *)v53;
      goto LABEL_41;
    }
    v18 = obj;
    if (!((unint64_t)a4 | (unint64_t)a5))
      goto LABEL_34;
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(":"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = a8;
    v51 = v16;
    if (objc_msgSend(v50, "count") == 2 && objc_msgSend(v16, "hasPrefix:", CFSTR("docID:")))
    {
      if (a5)
      {
        v19 = *a5;
        *a5 = 0;

      }
      if (!a4)
        goto LABEL_29;
      v20 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v50, "objectAtIndexedSubscript:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *a4;
      *a4 = (void *)v22;
    }
    else
    {
      v48 = v13;
      if (objc_msgSend(obj, "isShared"))
      {
        objc_msgSend(v13, "sharedClientZoneByMangledID:", obj);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "dbRowID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
      }
      else
      {
        objc_msgSend(v13, "appLibraryByMangledID:", obj);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "dbRowID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
      }

      if (a5)
      {
        v34 = -[BRCItemID initWithString:libraryRowID:sharedZoneRowID:]([BRCItemID alloc], "initWithString:libraryRowID:sharedZoneRowID:", v51, v21, v23);
        v35 = *a5;
        *a5 = v34;

      }
      v13 = v48;
      if (a4)
      {
        v36 = *a4;
        *a4 = 0;

      }
    }

    a8 = v49;
    v16 = v51;
LABEL_29:
    if (a5 && a4 && !*a5 && !*a4)
    {
      v41 = v16;
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("bookmarkData"), a1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        v43 = a8;
        brc_bread_crumbs();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, (os_log_type_t)0x90u))
        {
          v47 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v58 = "-[NSString(BRCBookmarkAdditions) parseBookmarkDataWithAccountSession:docID:itemID:mangledID:unsaltedBook"
                "markData:error:]";
          v59 = 2080;
          if (!v43)
            v47 = "(ignored by caller)";
          v60 = (uint64_t)v47;
          v61 = 2112;
          v62 = v42;
          v63 = 2112;
          v64 = v44;
          _os_log_error_impl(&dword_230455000, v45, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

        a8 = v43;
        v18 = obj;
      }
      if (a8)
        *a8 = objc_retainAutorelease(v42);

      v27 = 0;
      v29 = v41;
      v33 = (void *)v52;
      v37 = (void *)v53;
      goto LABEL_41;
    }

LABEL_34:
    if (a6)
      objc_storeStrong(a6, obj);
    v33 = (void *)v52;
    v37 = (void *)v53;
    if (a7)
    {
      objc_msgSend(v15, "stringByAppendingPathComponent:", v16);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = *a7;
      *a7 = (void *)v38;

    }
    v29 = v16;
    v27 = 1;
LABEL_41:

    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("bookmarkData"), a1);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v24 = a8;
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    {
      v46 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v58 = "-[NSString(BRCBookmarkAdditions) parseBookmarkDataWithAccountSession:docID:itemID:mangledID:unsaltedBookmarkData:error:]";
      v59 = 2080;
      if (!v24)
        v46 = "(ignored by caller)";
      v60 = (uint64_t)v46;
      v61 = 2112;
      v62 = v15;
      v63 = 2112;
      v64 = v25;
      _os_log_error_impl(&dword_230455000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    a8 = v24;
  }
  if (a8)
  {
    v15 = objc_retainAutorelease(v15);
    v27 = 0;
    *a8 = v15;
  }
  else
  {
    v27 = 0;
  }
LABEL_42:

  return v27;
}

+ (id)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneName:ownerName:accountDSID:salted:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v13)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@/%@"), v12, v13, v11);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v12, v11, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((a7 & 1) != 0)
  {
    objc_msgSend(v11, "brc_SHA1WithSalt:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v15;
  }

  return v18;
}

+ (void)bookmarkDataWithItemResolutionString:()BRCBookmarkAdditions serverZoneMangledID:saltAccountDSID:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: should have an accountID to salt with%@", (uint8_t *)&v2, 0xCu);
}

@end
