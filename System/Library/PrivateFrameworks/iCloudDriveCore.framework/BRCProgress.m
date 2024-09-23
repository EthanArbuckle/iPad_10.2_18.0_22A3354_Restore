@implementation BRCProgress

- (void)setCompletedUnitCount:(int64_t)a3
{
  BRCProgress *v5;
  NSMutableDictionary *progressByAliasContainerID;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRCProgress;
  -[BRCProgress setCompletedUnitCount:](&v8, sel_setCompletedUnitCount_);
  v5 = self;
  objc_sync_enter(v5);
  progressByAliasContainerID = v5->_progressByAliasContainerID;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__BRCProgress_setCompletedUnitCount___block_invoke;
  v7[3] = &__block_descriptor_40_e27_v32__0_8__NSProgress_16_B24l;
  v7[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](progressByAliasContainerID, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_sync_exit(v5);

}

uint64_t __37__BRCProgress_setCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setCompletedUnitCount:", *(_QWORD *)(a1 + 32));
}

- (void)brc_publish
{
  BRCProgress *v3;
  objc_super v4;

  if (!self->_ignorePublish)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCProgress;
    -[NSProgress brc_publish](&v4, sel_brc_publish);
    v3 = self;
    objc_sync_enter(v3);
    v3->_published = 1;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3->_progressByAliasContainerID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);
    objc_sync_exit(v3);

  }
}

uint64_t __26__BRCProgress_brc_publish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "brc_publish");
}

- (void)brc_unpublish
{
  BRCProgress *v3;
  objc_super v4;

  if (!self->_ignorePublish)
  {
    v4.receiver = self;
    v4.super_class = (Class)BRCProgress;
    -[NSProgress brc_unpublish](&v4, sel_brc_unpublish);
    v3 = self;
    objc_sync_enter(v3);
    v3->_published = 0;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3->_progressByAliasContainerID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_28_0);
    objc_sync_exit(v3);

  }
}

uint64_t __28__BRCProgress_brc_unpublish__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "brc_unpublish");
}

- (void)updateToBeDownloadProgressForDocument:(id)a3 sizeInfo:(id)a4
{
  -[BRCProgress _updateToBeProgressForDocument:group:sizeinfo:](self, "_updateToBeProgressForDocument:group:sizeinfo:", a3, 2, a4);
}

+ (id)uploadProgressForDocument:(id)a3 sizeInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a1, "_progressForDocument:group:sizeInfo:", v6, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "globalProgress");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject addProgress:forDocument:inGroup:](v9, "addProgress:forDocument:inGroup:", v7, v6, 1);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] failed getting upload progress for %@%@", (uint8_t *)&v11, 0x16u);
    }
  }

  return v7;
}

- (BRCProgress)initWithGroup:(char)a3 session:(id)a4
{
  id v6;
  BRCProgress *v7;
  BRCProgress *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BRCProgress;
  v7 = -[BRCProgress initWithParent:userInfo:](&v10, sel_initWithParent_userInfo_, 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_session, v6);
    v8->_group = a3;
  }

  return v8;
}

- (BRCProgress)initWithIgnorePublish:(BOOL)a3
{
  BRCProgress *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCProgress;
  result = -[BRCProgress init](&v5, sel_init);
  if (result)
    result->_ignorePublish = a3;
  return result;
}

- (void)setSession:(id)a3 group:(char)a4
{
  objc_storeWeak((id *)&self->_session, a3);
  self->_group = a4;
}

- (void)_setupProgressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5
{
  int v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46[2];
  uint8_t buf[4];
  BRCProgress *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v6 = a4;
  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v6 == 1)
  {
    objc_msgSend(v8, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logicalName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BRCSizeInfoTotalUnitCountKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v13, *MEMORY[0x24BDD1170]);

    objc_msgSend(v8, "fileObjectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "asString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v15, CFSTR("ICDProgressObjectID"));

  }
  else
  {
    v40 = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BRCSizeInfoCompletedUnitCountKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", objc_msgSend(v16, "longLongValue"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BRCSizeInfoTotalUnitCountKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCProgress setTotalUnitCount:](self, "setTotalUnitCount:", objc_msgSend(v17, "longLongValue"));

  if (-[BRCProgress completedUnitCount](self, "completedUnitCount") < 0
    || -[BRCProgress totalUnitCount](self, "totalUnitCount") < 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v48 = (BRCProgress *)-[BRCProgress totalUnitCount](self, "totalUnitCount");
      v49 = 2048;
      v50 = -[BRCProgress completedUnitCount](self, "completedUnitCount");
      v51 = 2112;
      v52 = v18;
      _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress initialized with negative values. total [%lld] completed [%lld]%@", buf, 0x20u);
    }

  }
  -[BRCProgress setKind:](self, "setKind:", *MEMORY[0x24BDD11B0]);
  -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE174D0]);
  -[BRCProgress setCancellable:](self, "setCancellable:", 0);
  v20 = (id *)MEMORY[0x24BDD1188];
  if (v40)
  {
    -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:");
    if (v6 == 1)
      v21 = (id)*MEMORY[0x24BDD1198];
    else
      v21 = *v20;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCProgress setLocalizedDescription:](self, "setLocalizedDescription:", v23, v40);

  }
  else
  {
    if (v6 == 1)
      v24 = (void *)*MEMORY[0x24BDD1198];
    else
      v24 = (void *)*MEMORY[0x24BDD1188];
    v21 = v24;
  }
  -[BRCProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v21, *MEMORY[0x24BDD1190]);
  if (objc_msgSend(v21, "isEqualToString:", *v20))
  {
    -[BRCProgress setCancellable:](self, "setCancellable:", 1);
    objc_msgSend(v8, "clientZone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v8, "dbRowID");
    objc_initWeak((id *)buf, self);
    objc_msgSend(v8, "st");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "filename");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "clientZone");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "taskTracker");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "db");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "serialQueue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke;
    v41[3] = &unk_24FE3FD80;
    v33 = v28;
    v42 = v33;
    v34 = v30;
    v43 = v34;
    v35 = v32;
    v44 = v35;
    v36 = v25;
    v45 = v36;
    v46[1] = v26;
    objc_copyWeak(v46, (id *)buf);
    -[BRCProgress setCancellationHandler:](self, "setCancellationHandler:", v41);
    objc_destroyWeak(v46);

    objc_destroyWeak((id *)buf);
  }
  brc_bread_crumbs();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "fileObjectID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v48 = self;
    v49 = 2112;
    v50 = (uint64_t)v39;
    v51 = 2112;
    v52 = v37;
    _os_log_debug_impl(&dword_230455000, v38, OS_LOG_TYPE_DEBUG, "[NOTIF] Added progress %@ for %@%@", buf, 0x20u);

  }
}

void __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17[2];
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2348B9F14]();
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCProgress _setupProgressForDocument:group:sizeInfo:]_block_invoke", 290, v18);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v20 = v18[0];
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx User requested to cancel download for %@%@", buf, 0x20u);
  }

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke_44;
  v15 = &unk_24FE3FD58;
  v7 = *(id *)(a1 + 56);
  v8 = *(void **)(a1 + 72);
  v16 = v7;
  v17[1] = v8;
  v9 = (id *)(a1 + 64);
  objc_copyWeak(v17, v9);
  brc_task_tracker_async_with_logs(v5, v6, &v12, 0);
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "brc_unpublish", v12, v13, v14, v15);

  objc_destroyWeak(v17);
  __brc_leave_section(v18);
  objc_autoreleasePoolPop(v2);
}

void __56__BRCProgress__setupProgressForDocument_group_sizeInfo___block_invoke_44(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "itemByRowID:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asDocument");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BRProgressEtagIfLoserKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BRProgressDownloadKindKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "longLongValue");

    objc_msgSend(v9, "cancelDownloadWithEtag:downloadKind:", v5, v8);
  }

}

- (void)_updateToBeProgressForDocument:(id)a3 group:(char)a4 sizeinfo:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  if (objc_msgSend(v10, "isOnDisk"))
  {
    objc_msgSend(v10, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCProgress setSession:group:](self, "setSession:group:", v9, v6);

    -[BRCProgress _setupProgressForDocument:group:sizeInfo:](self, "_setupProgressForDocument:group:sizeInfo:", v10, v6, v8);
  }

}

+ (id)_progressForDocument:(id)a3 group:(char)a4 sizeInfo:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  BRCProgress *v9;
  void *v10;
  BRCProgress *v11;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "isOnDisk"))
  {
    v9 = [BRCProgress alloc];
    objc_msgSend(v7, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BRCProgress initWithGroup:session:](v9, "initWithGroup:session:", v6, v10);

    if (v11)
      -[BRCProgress _setupProgressForDocument:group:sizeInfo:](v11, "_setupProgressForDocument:group:sizeInfo:", v7, v6, v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addAliasItem:(id)a3
{
  BRCProgress *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *progressByAliasContainerID;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v11, "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aliasTargetContainerString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  progressByAliasContainerID = v4->_progressByAliasContainerID;
  if (!progressByAliasContainerID)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = v4->_progressByAliasContainerID;
    v4->_progressByAliasContainerID = v9;

    progressByAliasContainerID = v4->_progressByAliasContainerID;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](progressByAliasContainerID, "objectForKeyedSubscript:", v7);

  objc_sync_exit(v4);
}

- (BOOL)isPublished
{
  return self->_published;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_progressByAliasContainerID, 0);
}

@end
