@implementation SSAppPurchaseHistoryDatabaseSchema

+ (BOOL)createSchemaInDatabase:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  char v16;
  uint64_t v17;
  int v18;
  id v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v61;
  uint64_t v62;
  _QWORD v63[6];
  _QWORD v64[6];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  uint64_t v70;
  _QWORD v71[6];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  _QWORD v76[2];
  _QWORD v77[2];
  _BYTE v78[40];
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "userVersion");
  if (v4 == 11201)
  {
LABEL_83:
    LOBYTE(v46) = 1;
    return v46;
  }
  v5 = v4;
  v6 = 0;
  LOBYTE(v7) = 0;
  while (1)
  {
    v8 = (void *)MEMORY[0x1A8585BF8]();
    v9 = v8;
    if (v5 <= 8001)
      break;
    if (v5 > 10199)
    {
      switch(v5)
      {
        case 10200:
          if ((objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN is_32_bit_only INTEGER DEFAULT 0;")) & 1) == 0)
            goto LABEL_50;
          v5 = 11000;
          goto LABEL_46;
        case 11000:
          if ((objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN is_preorder INTEGER DEFAULT 0;")) & 1) == 0)
            goto LABEL_50;
          v5 = 11200;
          goto LABEL_46;
        case 11200:
          if (!objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN required_capabilities TEXT;")))
            goto LABEL_50;
LABEL_9:
          v5 = 11201;
LABEL_46:
          objc_autoreleasePoolPop(v9);
LABEL_48:
          v7 = 1;
          goto LABEL_76;
      }
LABEL_47:
      objc_autoreleasePoolPop(v8);
      if ((v7 & 1) == 0)
        goto LABEL_51;
      goto LABEL_48;
    }
    if (v5 != 8002)
    {
      if (v5 == 10000)
      {
        if (!objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN is_hidden_from_springboard INTEGER DEFAULT 0;"))
          || !objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN oval_icon_token TEXT;"))
          || (objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN oval_icon_url TEXT;")) & 1) == 0)
        {
          goto LABEL_50;
        }
        v5 = 10200;
        goto LABEL_46;
      }
      goto LABEL_47;
    }
    v16 = objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN has_messages_extension INTEGER DEFAULT 0;"));
    objc_autoreleasePoolPop(v9);
    if ((v16 & 1) == 0)
    {
      v5 = 10000;
      goto LABEL_51;
    }
    v7 = 1;
    v5 = 10000;
LABEL_76:
    if (v5 == 11201)
    {
      if (v7)
        objc_msgSend(a3, "setUserVersion:", 11201);
      goto LABEL_83;
    }
  }
  if (v5 > 7999)
  {
    if (v5 == 8000)
    {
      if (!objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN is_family_shareable INTEGER DEFAULT 0;"))
        || (objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN vpp_is_licensed INTEGER DEFAULT 0;")) & 1) == 0)
      {
        goto LABEL_50;
      }
      v5 = 8001;
      goto LABEL_46;
    }
    v15 = objc_msgSend(a3, "executeSQL:", CFSTR("ALTER TABLE app_purchase_history ADD COLUMN is_first_party INTEGER DEFAULT 0;"));
    objc_autoreleasePoolPop(v9);
    if ((v15 & 1) == 0)
    {
      v5 = 8002;
      goto LABEL_51;
    }
    v7 = 1;
    v5 = 8002;
    goto LABEL_76;
  }
  if (!v5)
  {
    if (!objc_msgSend(a3, "executeSQL:", CFSTR("PRAGMA legacy_file_format = 0;"))
      || !objc_msgSend(a3, "executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS app_purchase_history (pid INTEGER, account_unique_identifier INTEGER,category TEXT, company_title TEXT, content_rating_flags INTEGER, bundle_id TEXT, date_updated INTEGER, date_purchased INTEGER, download_size INTEGER, flavors TEXT, has_messages_extension INTEGER DEFAULT 0, is_hidden_from_springboard INTEGER DEFAULT 0, icon_title TEXT, icon_token TEXT, icon_url TEXT, oval_icon_token TEXT, oval_icon_url TEXT, is_family_shareable INTEGER DEFAULT 0, is_first_party INTEGER DEFAULT 0, is_newsstand INTEGER DEFAULT 0, is_hidden INTEGER DEFAULT 0, long_title TEXT, minimum_os INTEGER, purchased_token INTEGER,store_id INTEGER, supports_ipad INTEGER DEFAULT 0, supports_iphone INTEGER DEFAULT 0, redownload_params TEXT, version_human_readable TEXT, version_itunes INTEGER, vpp_is_licensed INTEGER DEFAULT 0, is_32_bit_only INTEGER DEFAULT 0, is_preorder INTEGER DEFAULT 0, required_capabilities TEXT, PRIMARY KEY (pid));"))
      || !objc_msgSend(a3, "executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS db_properties (key TEXT PRIMARY KEY, value TEXT)"))|| !objc_msgSend(a3, "executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS app_purchase_history_accounts (account_unique_identifier INTEGER, local_revision INTEGER, PRIMARY KEY (account_unique_identifier));"))
      || !objc_msgSend(a3, "executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS app_purchase_history_store_id ON app_purchase_history (store_id);"))
      || !objc_msgSend(a3, "executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS app_purchase_history_category ON app_purchase_history (category);"))
      || !objc_msgSend(a3, "executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS app_purchase_history_bundle_id ON app_purchase_history (bundle_id);"))
      || (objc_msgSend(a3, "executeSQL:", CFSTR("CREATE INDEX IF NOT EXISTS app_purchase_history_account_unique_identifier ON app_purchase_history (account_unique_identifier);")) & 1) == 0)
    {
      goto LABEL_50;
    }
    goto LABEL_9;
  }
  if (v5 != 7000)
    goto LABEL_47;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v10 = objc_msgSend(a3, "executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS app_purchase_history_accounts (account_unique_identifier INTEGER, local_revision INTEGER, PRIMARY KEY (account_unique_identifier));"));
  *((_BYTE *)v73 + 24) = v10;
  if ((v10 & 1) == 0)
  {
    _Block_object_dispose(&v72, 8);
    v5 = 7000;
LABEL_50:
    objc_autoreleasePoolPop(v9);
    goto LABEL_51;
  }
  *(_QWORD *)v78 = 0;
  *(_QWORD *)&v78[8] = v78;
  *(_QWORD *)&v78[16] = 0x3052000000;
  *(_QWORD *)&v78[24] = __Block_byref_object_copy__70;
  *(_QWORD *)&v78[32] = __Block_byref_object_dispose__70;
  v79 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __updateAppPurchaseHistoryFrom7000to8000_block_invoke;
  v71[3] = &unk_1E47BE9D0;
  v71[4] = a3;
  v71[5] = v78;
  objc_msgSend(a3, "prepareStatementForSQL:cache:usingBlock:", CFSTR("SELECT value FROM db_properties WHERE key=\"app_purchase_history.localRevision\";"),
    0,
    v71);
  v65 = 0;
  v66 = &v65;
  v67 = 0x3052000000;
  v68 = __Block_byref_object_copy__70;
  v69 = __Block_byref_object_dispose__70;
  v70 = 0;
  v64[0] = v11;
  v64[1] = 3221225472;
  v64[2] = __updateAppPurchaseHistoryFrom7000to8000_block_invoke_2;
  v64[3] = &unk_1E47BE9D0;
  v64[4] = a3;
  v64[5] = &v65;
  objc_msgSend(a3, "prepareStatementForSQL:cache:usingBlock:", CFSTR("SELECT value FROM db_properties WHERE key=\"app_purchase_history.account_unique_identifier\";"),
    0,
    v64);
  v12 = (void *)v66[5];
  if (v12)
  {
    v13 = *(_QWORD *)(*(_QWORD *)&v78[8] + 40);
    if (v13)
    {
      v76[0] = CFSTR("account_unique_identifier");
      v76[1] = CFSTR("local_revision");
      v77[0] = v12;
      v77[1] = v13;

      v12 = (void *)v66[5];
    }
  }

  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __updateAppPurchaseHistoryFrom7000to8000_block_invoke_3;
  v63[3] = &unk_1E47BFC98;
  v63[4] = a3;
  v63[5] = &v72;
  objc_msgSend(a3, "prepareStatementForSQL:cache:usingBlock:", CFSTR("DELETE FROM db_properties WHERE key=\"app_purchase_history.localRevision\";"),
    0,
    v63);
  v14 = *((_BYTE *)v73 + 24) == 0;
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v78, 8);
  _Block_object_dispose(&v72, 8);
  objc_autoreleasePoolPop(v9);
  if (!v14)
  {
    v7 = 1;
    v5 = 8000;
    goto LABEL_76;
  }
  v5 = 8000;
LABEL_51:
  v17 = objc_msgSend(a3, "userVersion");
  v18 = v17;
  if (v17 != v5)
  {
    v32 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v32)
      v32 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v33 = objc_msgSend(v32, "shouldLog");
    if (objc_msgSend(v32, "shouldLogToDisk"))
      v34 = v33 | 2;
    else
      v34 = v33;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v32, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v35 = v34;
    else
      v35 = v34 & 2;
    if (v35)
    {
      v36 = objc_opt_class();
      *(_DWORD *)v78 = 138413058;
      *(_QWORD *)&v78[4] = v36;
      *(_WORD *)&v78[12] = 1024;
      *(_DWORD *)&v78[14] = v5;
      *(_WORD *)&v78[18] = 1024;
      *(_DWORD *)&v78[20] = 11201;
      *(_WORD *)&v78[24] = 1024;
      *(_DWORD *)&v78[26] = v18;
      LODWORD(v62) = 30;
      v61 = v78;
      v37 = _os_log_send_and_compose_impl();
      if (v37)
      {
        v38 = (void *)v37;
        v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v37, 4, v78, v62);
        free(v38);
        SSFileLog(v32, CFSTR("%@"), v40, v41, v42, v43, v44, v45, v39);
      }
    }
    v6 = 0;
    goto LABEL_75;
  }
  v19 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v19)
    v19 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v20 = objc_msgSend(v19, "shouldLog");
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v20 |= 2u;
  v21 = v6 + 1;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v19, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v20 &= 2u;
  if (v20)
  {
    v22 = objc_opt_class();
    *(_DWORD *)v78 = 138413058;
    *(_QWORD *)&v78[4] = v22;
    *(_WORD *)&v78[12] = 2048;
    *(_QWORD *)&v78[14] = v5;
    *(_WORD *)&v78[22] = 2048;
    *(_QWORD *)&v78[24] = 11201;
    *(_WORD *)&v78[32] = 1024;
    *(_DWORD *)&v78[34] = v6 + 1;
    LODWORD(v62) = 38;
    v61 = v78;
    v23 = _os_log_send_and_compose_impl();
    if (v23)
    {
      v24 = (void *)v23;
      v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, v78, v62);
      free(v24);
      SSFileLog(v19, CFSTR("%@"), v26, v27, v28, v29, v30, v31, v25);
    }
  }
  if (v6 < 5)
  {
    ++v6;
LABEL_75:
    v5 = objc_msgSend(a3, "userVersion", v61);
    v7 = 0;
    goto LABEL_76;
  }
  v47 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v47)
    v47 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v48 = objc_msgSend(v47, "shouldLog", v61);
  if (objc_msgSend(v47, "shouldLogToDisk"))
    v49 = v48 | 2;
  else
    v49 = v48;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v47, "OSLogObject"), OS_LOG_TYPE_ERROR))
    v50 = v49;
  else
    v50 = v49 & 2;
  if (v50)
  {
    v51 = objc_opt_class();
    *(_DWORD *)v78 = 138413058;
    *(_QWORD *)&v78[4] = v51;
    *(_WORD *)&v78[12] = 1024;
    *(_DWORD *)&v78[14] = v21;
    *(_WORD *)&v78[18] = 2048;
    *(_QWORD *)&v78[20] = v5;
    *(_WORD *)&v78[28] = 2048;
    *(_QWORD *)&v78[30] = 11201;
    LODWORD(v62) = 38;
    v46 = _os_log_send_and_compose_impl();
    if (!v46)
      return v46;
    v52 = (void *)v46;
    v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v46, 4, v78, v62);
    free(v52);
    SSFileLog(v47, CFSTR("%@"), v54, v55, v56, v57, v58, v59, v53);
  }
  LOBYTE(v46) = 0;
  return v46;
}

+ (id)databasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("Caches"), CFSTR("com.apple.storeservices"), CFSTR("AppPurchaseHistory.6.sqlitedb"), 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);

  return v3;
}

@end
