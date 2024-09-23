@implementation BRCXPCTokenClient

- (void)currentAccountCopyTokenWithBundleID:(id)a3 version:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  size_t v21;
  const char *v22;
  size_t v23;
  uint64_t v24;
  const char *v25;
  size_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  id v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  _BYTE buf[12];
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  _BYTE macOut[20];
  CCHmacContext ctx;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v64 = a3;
  v8 = a4;
  v9 = a5;
  -[BRCXPCClient session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = 0;
    goto LABEL_3;
  }
  +[BRCAccountHandler currentiCloudAccount](BRCAccountHandler, "currentiCloudAccount");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v30, "br_isEnabledForCloudDocs") & 1) != 0)
  {
    objc_msgSend(v30, "br_personaIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    {

    }
    else
    {
      objc_msgSend(v30, "br_personaIdentifier");
      v36 = (id)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        v37 = 0;
        goto LABEL_32;
      }
    }
    if (currentAccountCopyTokenWithBundleID_version_reply____personaOnceToken != -1)
      dispatch_once(&currentAccountCopyTokenWithBundleID_version_reply____personaOnceToken, &__block_literal_global_251);
    v36 = (id)currentAccountCopyTokenWithBundleID_version_reply____personalPersona;
    v37 = 1;
LABEL_32:
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "currentPersona");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    objc_msgSend(v63, "userPersonaUniqueString");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v61 = v39;
    if (v39 == v36 || (objc_msgSend(v39, "isEqualToString:", v36, v39) & 1) != 0)
    {
      v40 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        v65 = 0;
        v48 = objc_msgSend(v63, "copyCurrentPersonaContextWithError:", &v65);
        v49 = v65;
        v50 = *(void **)buf;
        *(_QWORD *)buf = v48;

        if (v49)
        {
          brc_bread_crumbs();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
            -[_BRCOperation completedWithResult:error:].cold.1();

        }
        objc_msgSend(v63, "generateAndRestorePersonaContextWithPersonaUniqueString:", v36);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
          goto LABEL_35;
        brc_bread_crumbs();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, (os_log_type_t)0x90u))
        {
          objc_msgSend(v30, "br_personaIdentifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          ctx.ctx[0] = 138412802;
          *(_QWORD *)&ctx.ctx[1] = v55;
          LOWORD(ctx.ctx[3]) = 2112;
          *(_QWORD *)((char *)&ctx.ctx[3] + 2) = v40;
          HIWORD(ctx.ctx[5]) = 2112;
          *(_QWORD *)&ctx.ctx[6] = v53;
          _os_log_error_impl(&dword_230455000, v54, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", (uint8_t *)&ctx, 0x20u);

        }
      }
      else
      {
        if (!v37 || (objc_msgSend(v63, "isDataSeparatedPersona") & 1) != 0)
        {
          brc_bread_crumbs();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            -[_BRCOperation completedWithResult:error:].cold.2();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        brc_bread_crumbs();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          -[_BRCOperation completedWithResult:error:].cold.3();
        v40 = 0;
      }

    }
LABEL_35:
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager", v61);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "getOrCreateAccountHandlerForACAccount:", v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "br_dsid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "finishedLoading"))
    {
      objc_msgSend(v11, "session");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42 == 0;

      if (v43)
      {
        brc_bread_crumbs();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          ctx.ctx[0] = 138413058;
          *(_QWORD *)&ctx.ctx[1] = self;
          LOWORD(ctx.ctx[3]) = 2112;
          *(_QWORD *)((char *)&ctx.ctx[3] + 2) = 0;
          HIWORD(ctx.ctx[5]) = 2112;
          *(_QWORD *)&ctx.ctx[6] = 0;
          LOWORD(ctx.ctx[8]) = 2112;
          *(_QWORD *)((char *)&ctx.ctx[8] + 2) = v57;
          _os_log_impl(&dword_230455000, v58, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&ctx, 0x2Au);
        }

        (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
        _BRRestorePersona();

        goto LABEL_22;
      }
    }

    _BRRestorePersona();
LABEL_3:
    v13 = -[BRCClientPrivilegesDescriptor cloudEnabledStatusWithHasSession:](self->super._clientPriviledgesDescriptor, "cloudEnabledStatusWithHasSession:", 1);
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_cloud_enabled_status_entries, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      ctx.ctx[0] = 138412802;
      *(_QWORD *)&ctx.ctx[1] = self;
      LOWORD(ctx.ctx[3]) = 2112;
      *(_QWORD *)((char *)&ctx.ctx[3] + 2) = v56;
      HIWORD(ctx.ctx[5]) = 2112;
      *(_QWORD *)&ctx.ctx[6] = v14;
      _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: %@%@", (uint8_t *)&ctx, 0x20u);

    }
    if (v13 == 1 || v13 == 253)
    {
      objc_msgSend(v11, "ubiquityTokenSalt");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCXPCClient bundleID](self, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (objc_msgSend(v11, "session"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v18, "accountDSID"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v18,
            v12))
      {
        memset(&ctx, 0, sizeof(ctx));
        v19 = objc_retainAutorelease(v12);
        v20 = (const char *)objc_msgSend(v19, "UTF8String");
        v21 = strlen(v20);
        CCHmacInit(&ctx, 0, v20, v21);
        v22 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
        v23 = strlen(v22);
        CCHmacUpdate(&ctx, v22, v23);
        CCHmacUpdate(&ctx, ":", 1uLL);
        v24 = objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
        if (v24)
          v25 = (const char *)v24;
        else
          v25 = "(null)";
        v26 = strlen(v25);
        CCHmacUpdate(&ctx, v25, v26);
        CCHmacFinal(&ctx, macOut);
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", macOut, 20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = self;
          v67 = 2112;
          v68 = v27;
          v69 = 2112;
          v70 = 0;
          v71 = 2112;
          v72 = v28;
          _os_log_impl(&dword_230455000, v29, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
        }

        (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v27, 0);
      }
      else
      {
        brc_bread_crumbs();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          -[BRCXPCTokenClient currentAccountCopyTokenWithBundleID:version:reply:].cold.1();

        brc_bread_crumbs();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          ctx.ctx[0] = 138413058;
          *(_QWORD *)&ctx.ctx[1] = self;
          LOWORD(ctx.ctx[3]) = 2112;
          *(_QWORD *)((char *)&ctx.ctx[3] + 2) = 0;
          HIWORD(ctx.ctx[5]) = 2112;
          *(_QWORD *)&ctx.ctx[6] = 0;
          LOWORD(ctx.ctx[8]) = 2112;
          *(_QWORD *)((char *)&ctx.ctx[8] + 2) = v46;
          _os_log_impl(&dword_230455000, v47, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&ctx, 0x2Au);
        }

        (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
      }

    }
    else
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        ctx.ctx[0] = 138413058;
        *(_QWORD *)&ctx.ctx[1] = self;
        LOWORD(ctx.ctx[3]) = 2112;
        *(_QWORD *)((char *)&ctx.ctx[3] + 2) = 0;
        HIWORD(ctx.ctx[5]) = 2112;
        *(_QWORD *)&ctx.ctx[6] = 0;
        LOWORD(ctx.ctx[8]) = 2112;
        *(_QWORD *)((char *)&ctx.ctx[8] + 2) = v32;
        _os_log_impl(&dword_230455000, v33, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&ctx, 0x2Au);
      }

      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    }
LABEL_22:
    v30 = v11;
    goto LABEL_23;
  }
  brc_bread_crumbs();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    ctx.ctx[0] = 138413058;
    *(_QWORD *)&ctx.ctx[1] = self;
    LOWORD(ctx.ctx[3]) = 2112;
    *(_QWORD *)((char *)&ctx.ctx[3] + 2) = 0;
    HIWORD(ctx.ctx[5]) = 2112;
    *(_QWORD *)&ctx.ctx[6] = 0;
    LOWORD(ctx.ctx[8]) = 2112;
    *(_QWORD *)((char *)&ctx.ctx[8] + 2) = v34;
    _os_log_impl(&dword_230455000, v35, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&ctx, 0x2Au);
  }

  (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
LABEL_23:

}

- (NSString)description
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCXPCTokenClient;
  -[BRCXPCClient description](&v5, sel_description);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("<token-getter>"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)prepareFileProvidersWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  qos_class_t v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16[3];
  uint8_t buf[4];
  BRCXPCTokenClient *v18;
  __int16 v19;
  BRCXPCTokenClient *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v16, 0, sizeof(v16));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient prepareFileProvidersWithReply:]", 1410, v16);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v16[0];
    v8 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v18 = (BRCXPCTokenClient *)v7;
    v19 = 2112;
    v20 = self;
    v21 = 2112;
    v22 = v9;
    v23 = 2080;
    v24 = "-[BRCXPCTokenClient prepareFileProvidersWithReply:]";
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__BRCXPCTokenClient_prepareFileProvidersWithReply___block_invoke;
  v14[3] = &unk_24FE41D48;
  v14[4] = self;
  v10 = v4;
  v15 = v10;
  v11 = _brc_ipc_check_logged_status(self, 0, v14);

  if (v11)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v18 = self;
      v19 = 2112;
      v20 = 0;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", buf, 0x20u);
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }
  __brc_leave_section(v16);

}

void __51__BRCXPCTokenClient_prepareFileProvidersWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__BRCXPCTokenClient_currentAccountCopyTokenWithBundleID_version_reply___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)currentAccountCopyTokenWithBundleID_version_reply____personalPersona;
  currentAccountCopyTokenWithBundleID_version_reply____personalPersona = v0;

}

- (void)getPrimaryiCloudAccountStatus:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  qos_class_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BRCXPCTokenClient *v34;
  char *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v44[5];
  id v45;
  uint64_t v46[3];
  _QWORD v47[8];
  _QWORD v48[8];
  uint8_t buf[4];
  BRCXPCTokenClient *v50;
  __int16 v51;
  BRCXPCTokenClient *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  memset(v46, 0, sizeof(v46));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient getPrimaryiCloudAccountStatus:]", 1494, v46);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v46[0];
    v7 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v7, (uint64_t)&brc_qos_entries, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v50 = (BRCXPCTokenClient *)v6;
    v51 = 2112;
    v52 = self;
    v53 = 2112;
    v54 = v8;
    v55 = 2080;
    v56 = "-[BRCXPCTokenClient getPrimaryiCloudAccountStatus:]";
    v57 = 2112;
    v58 = v4;
    _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __51__BRCXPCTokenClient_getPrimaryiCloudAccountStatus___block_invoke;
  v44[3] = &unk_24FE41D48;
  v44[4] = self;
  v42 = v3;
  v45 = v42;
  v9 = _brc_ipc_check_logged_status(self, 0, v44);

  if (v9)
  {
    +[BRCAccountHandler currentiCloudAccount](BRCAccountHandler, "currentiCloudAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEnabledForDataclass:", *MEMORY[0x24BDB4668]);
    v12 = objc_msgSend(v10, "br_isCloudDocsMigrationComplete");
    objc_msgSend(v10, "br_dsid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountHandlerForACAccountID:", v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCXPCTokenClient getPrimaryiCloudAccountStatus:].cold.2();

    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCXPCTokenClient getPrimaryiCloudAccountStatus:].cold.1();

    v19 = BRGetMigrationStatusForDSID();
    objc_msgSend(v41, "loggedOutError");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "br_isCloudDocsErrorCode:", 22);
    v37 = v20;
    objc_msgSend(v41, "session");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "clientState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kBRCFPFSMigrationStateKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      v24 = objc_msgSend(v38, "intValue") != 3;
    else
      v24 = 0;
    v47[0] = *MEMORY[0x24BE17278];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", v19);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v39;
    v47[1] = *MEMORY[0x24BE17258];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v25;
    v47[2] = *MEMORY[0x24BE17240];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v26;
    v47[3] = *MEMORY[0x24BE17248];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v27;
    v47[4] = *MEMORY[0x24BE17268];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "br_isEnabledForDesktopSync"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48[4] = v28;
    v47[5] = *MEMORY[0x24BE17270];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "br_isEnabledForDesktopSync"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v48[5] = v29;
    v47[6] = *MEMORY[0x24BE17260];
    v30 = (void *)MEMORY[0x24BDD16E0];
    -[BRCXPCClient session](self, "session");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithInt:", v31 != 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48[6] = v32;
    v47[7] = *MEMORY[0x24BE17250];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v48[7] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 8);
    v34 = (BRCXPCTokenClient *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v35 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v50 = self;
      v51 = 2112;
      v52 = v34;
      v53 = 2112;
      v54 = 0;
      v55 = 2112;
      v56 = v35;
      _os_log_impl(&dword_230455000, v36, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*((void (**)(id, BRCXPCTokenClient *, _QWORD))v42 + 2))(v42, v34, 0);
  }
  __brc_leave_section(v46);

}

void __51__BRCXPCTokenClient_getPrimaryiCloudAccountStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138413058;
    v8 = v6;
    v9 = 2112;
    v10 = 0;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchContainerPathForCurrentPersonaWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  qos_class_t v8;
  void *v9;
  id v10;
  int v11;
  char *v12;
  NSObject *v13;
  BRCXPCTokenClient *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18[3];
  uint8_t buf[4];
  BRCXPCTokenClient *v20;
  __int16 v21;
  BRCXPCTokenClient *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient fetchContainerPathForCurrentPersonaWithReply:]", 1563, v18);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v18[0];
    v8 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v20 = (BRCXPCTokenClient *)v7;
    v21 = 2112;
    v22 = self;
    v23 = 2112;
    v24 = v9;
    v25 = 2080;
    v26 = "-[BRCXPCTokenClient fetchContainerPathForCurrentPersonaWithReply:]";
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__BRCXPCTokenClient_fetchContainerPathForCurrentPersonaWithReply___block_invoke;
  v16[3] = &unk_24FE41D48;
  v16[4] = self;
  v10 = v4;
  v17 = v10;
  v11 = _brc_ipc_check_logged_status(self, 0, v16);

  if (v11)
  {
    brc_bread_crumbs();
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "br_currentHomeDir");
      v14 = (BRCXPCTokenClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v20 = self;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = 0;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "br_currentHomeDir");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v15, 0);

  }
  __brc_leave_section(v18);

}

void __66__BRCXPCTokenClient_fetchContainerPathForCurrentPersonaWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138413058;
    v8 = v6;
    v9 = 2112;
    v10 = 0;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchGroupContainerPathForCurrentPersonaWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  qos_class_t v8;
  void *v9;
  id v10;
  int v11;
  char *v12;
  NSObject *v13;
  BRCXPCTokenClient *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18[3];
  uint8_t buf[4];
  BRCXPCTokenClient *v20;
  __int16 v21;
  BRCXPCTokenClient *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient fetchGroupContainerPathForCurrentPersonaWithReply:]", 1572, v18);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v18[0];
    v8 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v20 = (BRCXPCTokenClient *)v7;
    v21 = 2112;
    v22 = self;
    v23 = 2112;
    v24 = v9;
    v25 = 2080;
    v26 = "-[BRCXPCTokenClient fetchGroupContainerPathForCurrentPersonaWithReply:]";
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__BRCXPCTokenClient_fetchGroupContainerPathForCurrentPersonaWithReply___block_invoke;
  v16[3] = &unk_24FE41D48;
  v16[4] = self;
  v10 = v4;
  v17 = v10;
  v11 = _brc_ipc_check_logged_status(self, 0, v16);

  if (v11)
  {
    brc_bread_crumbs();
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "br_personaGroupDir");
      v14 = (BRCXPCTokenClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v20 = self;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = 0;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "br_personaGroupDir");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v15, 0);

  }
  __brc_leave_section(v18);

}

void __71__BRCXPCTokenClient_fetchGroupContainerPathForCurrentPersonaWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138413058;
    v8 = v6;
    v9 = 2112;
    v10 = 0;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchGroupContainerPathForCurrentPersonaForFPFS:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  qos_class_t v10;
  void *v11;
  id v12;
  int v13;
  char *v14;
  NSObject *v15;
  BRCXPCTokenClient *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20[3];
  uint8_t buf[4];
  BRCXPCTokenClient *v22;
  __int16 v23;
  BRCXPCTokenClient *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(1, (uint64_t)"-[BRCXPCTokenClient fetchGroupContainerPathForCurrentPersonaForFPFS:withReply:]", 1581, v20);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v20[0];
    v10 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v22 = (BRCXPCTokenClient *)v9;
    v23 = 2112;
    v24 = self;
    v25 = 2112;
    v26 = v11;
    v27 = 2080;
    v28 = "-[BRCXPCTokenClient fetchGroupContainerPathForCurrentPersonaForFPFS:withReply:]";
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __79__BRCXPCTokenClient_fetchGroupContainerPathForCurrentPersonaForFPFS_withReply___block_invoke;
  v18[3] = &unk_24FE41D48;
  v18[4] = self;
  v12 = v6;
  v19 = v12;
  v13 = _brc_ipc_check_logged_status(self, 0, v18);

  if (v13)
  {
    brc_bread_crumbs();
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "br_personaGroupDirForFPFS:", v4);
      v16 = (BRCXPCTokenClient *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v22 = self;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = 0;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_230455000, v15, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "br_personaGroupDirForFPFS:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v17, 0);

  }
  __brc_leave_section(v20);

}

void __79__BRCXPCTokenClient_fetchGroupContainerPathForCurrentPersonaForFPFS_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138413058;
    v8 = v6;
    v9 = 2112;
    v10 = 0;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@)%@", (uint8_t *)&v7, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)currentAccountCopyTokenWithBundleID:version:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: should have an account dsid%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)getPrimaryiCloudAccountStatus:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] checking status for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)getPrimaryiCloudAccountStatus:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] account: %@%@");
  OUTLINED_FUNCTION_0();
}

@end
