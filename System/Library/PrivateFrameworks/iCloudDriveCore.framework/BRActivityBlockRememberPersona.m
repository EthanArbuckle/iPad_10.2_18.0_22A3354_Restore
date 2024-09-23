@implementation BRActivityBlockRememberPersona

void ___BRActivityBlockRememberPersona_block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x2348B9F14]();
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (v5 = *(id *)(a1 + 32)) == 0)
  {
    if (_block_invoke_2___personaOnceToken != -1)
      dispatch_once(&_block_invoke_2___personaOnceToken, &__block_literal_global_181_0);
    v6 = (id)_block_invoke_2___personalPersona;
    v7 = 1;
  }
  else
  {
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPersona");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  objc_msgSend(v9, "userPersonaUniqueString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == v6 || (objc_msgSend(v10, "isEqualToString:", v6) & 1) != 0)
    goto LABEL_9;
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v7 && (objc_msgSend(v9, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();

    }
    else
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.2();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_25;
    }
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v12 = 0;
    goto LABEL_10;
  }
  v29 = 0;
  v13 = (void *)objc_msgSend(v9, "copyCurrentPersonaContextWithError:", &v29);
  v14 = v29;
  v15 = v30;
  v30 = v13;

  if (v14)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v14);

  }
  objc_msgSend(v9, "generateAndRestorePersonaContextWithPersonaUniqueString:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_9;
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
  {
    v28 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v32 = v28;
    v33 = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v18;
    _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    ___BRActivityBlockRememberPersona_block_invoke_cold_2();

  if (!xpc_activity_set_state(v3, 3))
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      ___BRActivityBlockRememberPersona_block_invoke_cold_1();

  }
LABEL_10:

  _BRRestorePersona();
  objc_autoreleasePoolPop(v4);

}

void ___BRActivityBlockRememberPersona_block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_2___personalPersona;
  _block_invoke_2___personalPersona = v0;

}

void ___BRActivityBlockRememberPersona_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Failed to defer the activity after persona failure.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void ___BRActivityBlockRememberPersona_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't adopt persona for xpc activity, deferring the activity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
