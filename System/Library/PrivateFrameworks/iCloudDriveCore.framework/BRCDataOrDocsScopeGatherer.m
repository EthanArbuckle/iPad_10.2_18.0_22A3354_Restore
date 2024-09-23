@implementation BRCDataOrDocsScopeGatherer

- (BRCDataOrDocsScopeGatherer)initWithNotificationPipe:(id)a3 appLibraries:(id)a4 startingRank:(unint64_t)a5 maxRank:(unint64_t)a6 withDeadItems:(BOOL)a7 gatherReply:(id)a8
{
  id *v14;
  id v15;
  id v16;
  BRCDataOrDocsScopeGatherer *v17;
  BRCDataOrDocsScopeGatherer *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id gatherReply;
  void *v23;
  uint64_t v24;
  BRCAccountSessionFPFS *session;
  uint64_t v26;
  NSMutableArray *gatheringAppLibraries;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  id *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v14 = (id *)a3;
  v15 = a4;
  v16 = a8;
  v39.receiver = self;
  v39.super_class = (Class)BRCDataOrDocsScopeGatherer;
  v17 = -[BRCDataOrDocsScopeGatherer init](&v39, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_pipe, v14);
    objc_msgSend(v14, "queue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = MEMORY[0x24BDAC760];
    v34 = 3221225472;
    v35 = __115__BRCDataOrDocsScopeGatherer_initWithNotificationPipe_appLibraries_startingRank_maxRank_withDeadItems_gatherReply___block_invoke;
    v36 = &unk_24FE41D48;
    v20 = v19;
    v37 = v20;
    v38 = v16;
    v21 = MEMORY[0x2348BA0DC](&v33);
    gatherReply = v18->_gatherReply;
    v18->_gatherReply = (id)v21;

    objc_msgSend(v14, "manager", v33, v34, v35, v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "session");
    v24 = objc_claimAutoreleasedReturnValue();
    session = v18->_session;
    v18->_session = (BRCAccountSessionFPFS *)v24;

    v18->_gatheringRankMin = a5;
    v18->_gatheringRankMax = a6;
    v26 = objc_msgSend(v15, "mutableCopy");
    gatheringAppLibraries = v18->_gatheringAppLibraries;
    v18->_gatheringAppLibraries = (NSMutableArray *)v26;

    objc_storeStrong((id *)&v18->_gatheringNamePrefix, v14[18]);
    v18->_includesDeadItems = a7;
    v18->_invalidated = 0;
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v41 = v14;
      v42 = 2048;
      v43 = a5;
      v44 = 2048;
      v45 = a6;
      v46 = 2112;
      v47 = v28;
      _os_log_debug_impl(&dword_230455000, v29, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: gathering from %lld to %lld%@", buf, 0x2Au);
    }

    if (v18->_gatheringNamePrefix)
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:].cold.1();

    }
  }

  return v18;
}

void __115__BRCDataOrDocsScopeGatherer_initWithNotificationPipe_appLibraries_startingRank_maxRank_withDeadItems_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_assert_queue_V2(v3);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "brc_wrappedError");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

- (void)gatherWithBatchSize:(int64_t)a3 completion:(id)a4
{
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  id v30;
  id v31[2];
  _QWORD block[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v25 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipe);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v24 = (void *)a3;
    objc_msgSend(WeakRetained, "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "readOnlyDB");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke;
    v34[3] = &unk_24FE41D70;
    objc_copyWeak(&v36, &location);
    v10 = v25;
    v35 = v10;
    v11 = (void *)MEMORY[0x2348BA0DC](v34);
    -[NSObject serialQueue](v9, "serialQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v26, "personaIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v26, "personaIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "br_currentPersonaID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "isEqualToString:", v16);

        if ((v17 & 1) == 0)
          goto LABEL_5;
      }
      else
      {

      }
      -[NSObject serialQueue](v9, "serialQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2;
      v27[3] = &unk_24FE41DC0;
      objc_copyWeak(v31, &location);
      v31[1] = v24;
      v29 = v11;
      v28 = v9;
      v30 = v10;
      v23 = v11;
      dispatch_async(v22, v27);

      objc_destroyWeak(v31);
LABEL_12:

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
      goto LABEL_13;
    }
LABEL_5:
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v18;
      _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't gather anymore because the personaID is incorrect or db has no serial queue%@", buf, 0xCu);
    }

    objc_msgSend(v7, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_14;
    block[3] = &unk_24FE41D98;
    v33 = v11;
    v21 = v11;
    dispatch_async(v20, block);

    goto LABEL_12;
  }
  brc_bread_crumbs();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v26;
    _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Notification pipe got deallocated. Nothing to do%@", buf, 0xCu);
  }
LABEL_13:

}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_cold_1();

  }
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  char *v3;
  id v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  unsigned int v17;
  _BOOL8 v18;
  uint64_t v19;
  id v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  uint32_t v34;
  uint64_t v35;
  char v36;
  char v37;
  NSObject *v38;
  _QWORD *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  int v53;
  const char *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  int v60;
  void *v61;
  void *v62;
  unint64_t v63;
  uint64_t v65;
  void *v66;
  _QWORD v67[5];
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  _QWORD v75[4];
  id v76;
  uint64_t v77[3];
  _QWORD block[5];
  id v79;
  _BYTE v80[128];
  uint64_t v81;
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  unint64_t v85;
  __int16 v86;
  NSObject *v87;
  __int16 v88;
  unint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v65 = (uint64_t)objc_loadWeakRetained(WeakRetained + 1);
    if (v65)
    {
      v63 = *(_QWORD *)(a1 + 64);
      if ((v63 & 0x8000000000000000) != 0)
      {
        brc_bread_crumbs();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
          __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_6();

      }
      if (objc_msgSend(v2[3], "count"))
      {
        v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v63);
        objc_msgSend(v2[3], "lastObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v62)
        {
          brc_bread_crumbs();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
            __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_5();

        }
        v3 = (char *)v2[6];
        if (v3 + 1 > v2[4])
          v4 = v3 + 1;
        else
          v4 = v2[4];
        memset(v77, 0, sizeof(v77));
        __brc_create_section(0, (uint64_t)"-[BRCDataOrDocsScopeGatherer gatherWithBatchSize:completion:]_block_invoke", 200, v77);
        brc_bread_crumbs();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          v47 = v77[0];
          objc_msgSend(v62, "logName");
          v48 = objc_claimAutoreleasedReturnValue();
          BRCPrettyPrintBitmap();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219266;
          v83 = v47;
          v84 = 2048;
          v85 = (unint64_t)v4;
          v86 = 2112;
          v87 = v48;
          v88 = 2048;
          v89 = v63;
          v90 = 2112;
          v91 = v49;
          v92 = 2112;
          v93 = v5;
          _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx Looking for item with ranks >= %lld in %@ (%ld kind %@)%@", buf, 0x3Eu);

        }
        v7 = *(_DWORD *)(v65 + 136);
        if ((v7 & 1) != 0)
        {
          v8 = v2[10];
          if (!v8)
          {
            v11 = 0;
            v61 = 0;
            v21 = 1;
            goto LABEL_35;
          }
          if ((*(_WORD *)(v65 + 140) & 2) != 0)
          {
            objc_msgSend(v62, "itemsEnumeratorChildOf:withDeadItems:rankMin:rankMax:count:db:", v2[10], *((unsigned __int8 *)v2 + 72), v4, v2[5], v63, *(_QWORD *)(a1 + 32));
            v46 = (id)objc_claimAutoreleasedReturnValue();
            if (!v46)
            {
              brc_bread_crumbs();
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
                __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_3();

              objc_msgSend((id)v65, "queue");
              v52 = objc_claimAutoreleasedReturnValue();
              v75[0] = MEMORY[0x24BDAC760];
              v75[1] = 3221225472;
              v75[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_18;
              v75[3] = &unk_24FE41D98;
              v76 = *(id *)(a1 + 40);
              dispatch_async(v52, v75);

              v22 = 0;
              v61 = 0;
              goto LABEL_74;
            }
            v11 = v46;
            v60 = 0;
            v61 = v46;
LABEL_36:

            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v22 = v11;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v71;
              do
              {
                v25 = 0;
                do
                {
                  if (*(_QWORD *)v71 != v24)
                    objc_enumerationMutation(v22);
                  v26 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v25);
                  v27 = (void *)MEMORY[0x2348B9F14]();
                  v2[6] = (id)objc_msgSend(v26, "notifsRank");
                  if (!objc_msgSend(v26, "isZoneRoot"))
                  {
                    +[BRCNotification notificationGatheredFromItem:](BRCNotification, "notificationGatheredFromItem:", v26);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = v30;
                    if (*((_BYTE *)v2 + 72) || !objc_msgSend(v30, "isDead"))
                    {
                      objc_msgSend(v66, "addObject:", v28);
                      brc_bread_crumbs();
                      v29 = objc_claimAutoreleasedReturnValue();
                      brc_notifications_log();
                      v31 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412802;
                        v83 = (uint64_t)v2;
                        v84 = 2112;
                        v85 = (unint64_t)v28;
                        v86 = 2112;
                        v87 = v29;
                        v32 = v31;
                        v33 = "[NOTIF] %@: queued gathered notification %@%@";
                        v34 = 32;
LABEL_53:
                        _os_log_debug_impl(&dword_230455000, v32, OS_LOG_TYPE_DEBUG, v33, buf, v34);
                      }
                    }
                    else
                    {
                      brc_bread_crumbs();
                      v29 = objc_claimAutoreleasedReturnValue();
                      brc_notifications_log();
                      v31 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        v83 = (uint64_t)v28;
                        v84 = 2112;
                        v85 = (unint64_t)v29;
                        v32 = v31;
                        v33 = "[NOTIF] Ignoring dead update %@%@";
                        v34 = 22;
                        goto LABEL_53;
                      }
                    }

                    goto LABEL_50;
                  }
                  brc_bread_crumbs();
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_notifications_log();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v83 = (uint64_t)v26;
                    v84 = 2112;
                    v85 = (unint64_t)v28;
                    _os_log_debug_impl(&dword_230455000, v29, OS_LOG_TYPE_DEBUG, "[NOTIF] Ignoring zone root item %@%@", buf, 0x16u);
                  }
LABEL_50:

                  objc_autoreleasePoolPop(v27);
                  ++v25;
                }
                while (v23 != v25);
                v35 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
                v23 = v35;
              }
              while (v35);
            }

            if (v61)
              v36 = v60;
            else
              v36 = 1;
            if ((v36 & 1) != 0)
            {
              if (v60)
              {
LABEL_60:
                objc_msgSend(v2[3], "removeLastObject");
                v2[6] = 0;
                v37 = 1;
LABEL_63:
                if (!objc_msgSend(v66, "count"))
                {
                  if ((v37 & 1) == 0)
                  {
                    brc_bread_crumbs();
                    v40 = objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v41 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                    {
                      v42 = objc_msgSend(v61, "rowNumber");
                      *(_DWORD *)buf = 134218498;
                      v83 = v42;
                      v84 = 2048;
                      v85 = v63;
                      v86 = 2112;
                      v87 = v40;
                      _os_log_impl(&dword_230455000, v41, OS_LOG_TYPE_DEFAULT, "[WARNING] Strange... No updates received and phase isn't done %lu vs %ld%@", buf, 0x20u);
                    }

                  }
                  objc_msgSend(v2, "gatherWithBatchSize:completion:", v63, *(_QWORD *)(a1 + 48));
                  goto LABEL_75;
                }
                objc_msgSend((id)v65, "queue");
                v38 = objc_claimAutoreleasedReturnValue();
                v67[0] = MEMORY[0x24BDAC760];
                v67[1] = 3221225472;
                v67[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_24;
                v67[3] = &unk_24FE40A80;
                v39 = v67;
                v67[4] = v66;
                v68 = (id)v65;
                v69 = *(id *)(a1 + 40);
                dispatch_async(v38, v67);

                goto LABEL_73;
              }
            }
            else if (objc_msgSend(v61, "rowNumber") < v63)
            {
              goto LABEL_60;
            }
            v37 = 0;
            goto LABEL_63;
          }
          objc_msgSend(v2[8], "itemByItemGlobalID:db:", v8, *(_QWORD *)(a1 + 32));
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            v81 = v9;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v81, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = 0;
          }
          else
          {
            v61 = 0;
            v11 = (void *)MEMORY[0x24BDBD1A8];
          }
        }
        else
        {
          v17 = (v7 >> 7) & 1;
          if ((v7 & 8) == 0)
            v17 = 0;
          v18 = (v7 & 6) == 0 || (*(_DWORD *)(v65 + 136) & 8) != 0;
          if ((v7 & 6) != 0)
            v19 = v17;
          else
            v19 = 0;
          BYTE3(v59) = (*(_DWORD *)(v65 + 136) & 0x40) != 0;
          BYTE2(v59) = (*(_DWORD *)(v65 + 136) & 0x20) != 0;
          BYTE1(v59) = (*(_DWORD *)(v65 + 136) & 4) != 0;
          LOBYTE(v59) = (*(_DWORD *)(v65 + 136) & 2) != 0;
          objc_msgSend(v62, "itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:", v4, v2[5], v2[7], *((unsigned __int8 *)v2 + 72), v18, v19, v59, v63, *(_QWORD *)(a1 + 32));
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            brc_bread_crumbs();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
              __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_3();

            objc_msgSend((id)v65, "queue");
            v45 = objc_claimAutoreleasedReturnValue();
            v74[0] = MEMORY[0x24BDAC760];
            v74[1] = 3221225472;
            v74[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_20;
            v74[3] = &unk_24FE41D98;
            v39 = v74;
            v74[4] = *(id *)(a1 + 40);
            dispatch_async(v45, v74);

            v22 = 0;
            v61 = 0;
LABEL_73:
            v8 = v39[4];
LABEL_74:

LABEL_75:
            __brc_leave_section(v77);

            v13 = v66;
            goto LABEL_76;
          }
          v11 = v20;
          brc_bread_crumbs();
          v8 = objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            v53 = *((unsigned __int8 *)v2 + 72);
            *(_DWORD *)buf = 134218498;
            if (v53)
              v54 = "yes";
            else
              v54 = "no";
            v83 = (uint64_t)v11;
            v84 = 2080;
            v85 = (unint64_t)v54;
            v86 = 2112;
            v87 = v8;
            _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[NOTIF] Creating enumertor %p including dead items: %s%@", buf, 0x20u);
          }
          v61 = v11;
        }

        v21 = v7 & 1;
LABEL_35:
        v60 = v21;
        goto LABEL_36;
      }
      objc_msgSend((id)v65, "queue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_16;
      block[3] = &unk_24FE40478;
      v16 = *(id *)(a1 + 40);
      block[4] = v2;
      v79 = v16;
      dispatch_async(v15, block);

      v13 = v79;
    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_2();

    }
  }
  else
  {
    brc_bread_crumbs();
    v65 = objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_cold_1();
      v13 = v12;
    }
  }
LABEL_76:

}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_16(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "done");
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_24(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x2348B9F14](v3);
        objc_msgSend(*(id *)(a1 + 40), "addNotification:asDead:", v7, 0, (_QWORD)v10);
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)_popGatherReply
{
  BRCDataOrDocsScopeGatherer *v2;
  void *v3;
  id gatherReply;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x2348BA0DC](v2->_gatherReply);
  gatherReply = v2->_gatherReply;
  v2->_gatherReply = 0;

  v5 = (void *)MEMORY[0x2348BA0DC](v3);
  objc_sync_exit(v2);

  return v5;
}

- (void)done
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] %@: gather phase ends%@");
  OUTLINED_FUNCTION_0();
}

void __34__BRCDataOrDocsScopeGatherer_done__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __34__BRCDataOrDocsScopeGatherer_done__block_invoke_2;
  v2[3] = &unk_24FE41D98;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "addDequeueCallback:", v2);

}

uint64_t __34__BRCDataOrDocsScopeGatherer_done__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] %@: EINTR: client gather phase was invalidated%@");
  OUTLINED_FUNCTION_0();
}

void __40__BRCDataOrDocsScopeGatherer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)dealloc
{
  objc_super v3;

  -[BRCDataOrDocsScopeGatherer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BRCDataOrDocsScopeGatherer;
  -[BRCDataOrDocsScopeGatherer dealloc](&v3, sel_dealloc);
}

- (BRCItemGlobalID)gatheredChildrenItemGlobalID
{
  return self->_gatheredChildrenItemGlobalID;
}

- (void)setGatheredChildrenItemGlobalID:(id)a3
{
  objc_storeStrong((id *)&self->_gatheredChildrenItemGlobalID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatheredChildrenItemGlobalID, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_gatheringNamePrefix, 0);
  objc_storeStrong((id *)&self->_gatheringAppLibraries, 0);
  objc_storeStrong(&self->_gatherReply, 0);
  objc_destroyWeak((id *)&self->_pipe);
}

- (void)initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[NOTIF] matching prefix: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[NOTIF] Self got deallocated. Nothing to do%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[NOTIF] Notification pipe got deallocated. Nothing to do%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: No gathered items enumerator - bailing out%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: appLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __61__BRCDataOrDocsScopeGatherer_gatherWithBatchSize_completion___block_invoke_2_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: count >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
