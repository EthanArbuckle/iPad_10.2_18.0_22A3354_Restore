@implementation BRCNotificationPipe

- (BRCNotificationPipeDelegate)delegate
{
  return (BRCNotificationPipeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _receiver == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_registerAsWatcherIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      -[BRCNotificationManager registerPipe:asWatcherForFileObjectID:](self->_manager, "registerPipe:asWatcherForFileObjectID:", self, v4);
      v4 = v5;
    }

  }
}

- (void)addNotification:(id)a3 asDead:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSMutableSet *externalAppLibraries;
  NSMutableSet *v9;
  NSMutableSet *v10;
  void *v11;
  BRCXPCClient *client;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "appLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isBRAlias")
    && v7
    && (-[NSMutableSet containsObject:](self->_externalAppLibraries, "containsObject:", v7) & 1) == 0)
  {
    externalAppLibraries = self->_externalAppLibraries;
    if (!externalAppLibraries)
    {
      v9 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
      v10 = self->_externalAppLibraries;
      self->_externalAppLibraries = v9;

      externalAppLibraries = self->_externalAppLibraries;
    }
    -[NSMutableSet addObject:](externalAppLibraries, "addObject:", v7);
    -[BRCNotificationPipe delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationPipe:willObserveAppLibrary:", self, v7);

  }
  client = self->_client;
  if (client
    && !-[BRCXPCClient isSandboxed](client, "isSandboxed")
    && !-[BRCXPCClient hasPrivateSharingInterfaceEntitlement](self->_client, "hasPrivateSharingInterfaceEntitlement"))
  {
    objc_msgSend(v6, "notificationByStrippingSharingInfoIfNeeded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe addNotification:asDead:].cold.1();

      v16 = v13;
      v6 = v16;
    }

  }
  -[BRNotificationQueue addNotification:asDead:](self->_notifs, "addNotification:asDead:", v6, v4);

}

- (void)addDequeueCallback:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[BRNotificationQueue addDequeueCallback:](self->_notifs, "addDequeueCallback:", v5);

}

- (id)_initWithManager:(id)a3 startingRank:(unint64_t)a4
{
  id v7;
  BRCNotificationPipe *v8;
  BRNotificationQueue *v9;
  BRNotificationQueue *notifs;
  uint64_t v11;
  NSHashTable *recursiveScopeListOps;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCNotificationPipe;
  v8 = -[BRCNotificationPipe init](&v14, sel_init);
  if (v8)
  {
    v9 = (BRNotificationQueue *)objc_alloc_init(MEMORY[0x24BE17648]);
    notifs = v8->_notifs;
    v8->_notifs = v9;

    objc_storeStrong((id *)&v8->_manager, a3);
    v8->_initialGatherMaxRank = a4;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    recursiveScopeListOps = v8->_recursiveScopeListOps;
    v8->_recursiveScopeListOps = (NSHashTable *)v11;

  }
  return v8;
}

- (BRCNotificationPipe)initWithXPCReceiver:(id)a3 client:(id)a4 manager:(id)a5 startingRank:(unint64_t)a6
{
  id v10;
  id v11;
  BRCNotificationPipe *v12;
  void *v13;
  BRCNotificationPipe *v14;
  uint64_t v15;
  BRItemNotificationReceiving *receiver;
  uint64_t v17;
  OS_dispatch_queue *queue;
  _QWORD v20[4];
  BRCNotificationPipe *v21;

  v10 = a3;
  v11 = a4;
  v12 = -[BRCNotificationPipe _initWithManager:startingRank:](self, "_initWithManager:startingRank:", a5, a6);
  if (v12)
  {
    objc_msgSend(v11, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __71__BRCNotificationPipe_initWithXPCReceiver_client_manager_startingRank___block_invoke;
    v20[3] = &unk_24FE3F6A0;
    v14 = v12;
    v21 = v14;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v20);
    v15 = objc_claimAutoreleasedReturnValue();
    receiver = v14->_receiver;
    v14->_receiver = (BRItemNotificationReceiving *)v15;

    objc_msgSend(v13, "_queue");
    v17 = objc_claimAutoreleasedReturnValue();
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v14->_client, a4);
  }

  return v12;
}

void __71__BRCNotificationPipe_initWithXPCReceiver_client_manager_startingRank___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7[3];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe initWithXPCReceiver:client:manager:startingRank:]_block_invoke", 483, v7);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v7[0];
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@ got error %@%@", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  __brc_leave_section(v7);

}

- (BRCNotificationPipe)initWithReceiver:(id)a3 manager:(id)a4 startingRank:(unint64_t)a5
{
  id v9;
  id *v10;
  BRCNotificationPipe *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;

  v9 = a3;
  v10 = -[BRCNotificationPipe _initWithManager:startingRank:](self, "_initWithManager:startingRank:", a4, a5);
  v11 = (BRCNotificationPipe *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.brc.pipe", v13);

    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

  }
  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int watchKind;
  int v8;
  const __CFString *v9;
  int v10;
  unsigned __int16 watchItemOptions;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 64);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  if (self->_client)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" "));
    -[BRCXPCClient description](self->_client, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v4);

  }
  if (self->_gatherer)
    objc_msgSend(v3, "appendString:", CFSTR(" gathering"));
  if (-[NSSet count](self->_watchedAppLibraryIDs, "count"))
  {
    -[NSSet allObjects](self->_watchedAppLibraryIDs, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" {%@}"), v6);

  }
  watchKind = self->_watchKind;
  if ((watchKind & 1) != 0)
  {
    watchItemOptions = self->_watchItemOptions;
    v12 = CFSTR(" {children of ");
    if ((watchItemOptions & 2) == 0)
      v12 = CFSTR(" {item at ");
    if ((watchItemOptions & 4) != 0)
      v13 = CFSTR(" {descendants of ");
    else
      v13 = v12;
    objc_msgSend(v3, "appendString:", v13);
    -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v16);

      -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("[fid:%@ n:%@]"), v17, v19);

        goto LABEL_32;
      }
    }

    if (!v17)
    {
LABEL_33:
      BRCPrettyPrintBitmap();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if ((self->_watchKind & 0x20) != 0)
        v22 = CFSTR("|withAliases");
      else
        v22 = &stru_24FE4A790;
      objc_msgSend(v3, "appendFormat:", CFSTR(" (%@%@)}"), v20, v22);

      goto LABEL_37;
    }
    -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("[fid:%@]"), v17);
LABEL_32:

    goto LABEL_33;
  }
  if ((watchKind & 0x26) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" {NSMDQ"));
    v8 = self->_watchKind;
    if ((v8 & 4) != 0)
    {
      objc_msgSend(v3, "appendString:", CFSTR(" data"));
      v8 = self->_watchKind;
      if ((v8 & 2) == 0)
      {
LABEL_11:
        if ((v8 & 8) == 0)
          goto LABEL_16;
LABEL_12:
        if ((v8 & 0x80) != 0)
          v9 = CFSTR(" dirs-only");
        else
          v9 = CFSTR(" dirs");
        objc_msgSend(v3, "appendString:", v9);
LABEL_16:
        v10 = self->_watchKind;
        if ((v10 & 0x10) != 0)
        {
          objc_msgSend(v3, "appendString:", CFSTR(" faults"));
          v10 = self->_watchKind;
          if ((v10 & 0x20) == 0)
          {
LABEL_18:
            if ((v10 & 0x40) == 0)
            {
LABEL_20:
              objc_msgSend(v3, "appendString:", CFSTR("}"));
              goto LABEL_37;
            }
LABEL_19:
            objc_msgSend(v3, "appendString:", CFSTR(" trash"));
            goto LABEL_20;
          }
        }
        else if ((v10 & 0x20) == 0)
        {
          goto LABEL_18;
        }
        objc_msgSend(v3, "appendString:", CFSTR(" ext"));
        if ((self->_watchKind & 0x40) == 0)
          goto LABEL_20;
        goto LABEL_19;
      }
    }
    else if ((v8 & 2) == 0)
    {
      goto LABEL_11;
    }
    objc_msgSend(v3, "appendString:", CFSTR(" docs"));
    v8 = self->_watchKind;
    if ((v8 & 8) == 0)
      goto LABEL_16;
    goto LABEL_12;
  }
LABEL_37:
  objc_msgSend(v3, "appendFormat:", CFSTR(" queued:%ld>"), -[BRNotificationQueue count](self->_notifs, "count"));
  return (NSString *)v3;
}

- (int)_isInterestingUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int watchKind;
  void *v42;
  int v43;
  int v44;
  NSObject *v45;
  int v46;
  int v47;
  void *v48;
  int v49;
  NSSet *watchedAppLibraryIDs;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  NSSet *v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v72;
  NSObject *v73;
  int v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "parentFileObjectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToFileObjectID:", v8);

    }
    else
    {
      v9 = 0;
    }
    -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9
      || (objc_msgSend(v4, "logicalName"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "br_isEqualToStringForHFS:isCaseSensitive:", v10, 1),
          v11,
          !v12))
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.23();
      v29 = 0;
      goto LABEL_111;
    }
    -[BRCNotificationPipe setWatchedAncestorFilenameToItem:](self, "setWatchedAncestorFilenameToItem:", 0);
    objc_msgSend(v4, "fileObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", v13);

    -[BRCNotificationPipe _registerAsWatcherIfNeeded](self, "_registerAsWatcherIfNeeded");
  }
  -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_17;
  v15 = (void *)v14;
  objc_msgSend(v4, "fileObjectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToFileObjectID:", v17);

  if (v18)
  {
    -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemGlobalID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToItemGlobalID:", v20);

    if ((v21 & 1) == 0)
    {
      -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe setOldWatchedAncestorItemGlobalID:](self, "setOldWatchedAncestorItemGlobalID:", v22);

      objc_msgSend(v4, "itemGlobalID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe setWatchedAncestorItemGlobalID:](self, "setWatchedAncestorItemGlobalID:", v23);

      -[BRCNotificationPipe _registerAsWatcherIfNeeded](self, "_registerAsWatcherIfNeeded");
      -[BRCNotificationPipe oldWatchedAncestorItemGlobalID](self, "oldWatchedAncestorItemGlobalID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.22(self, (uint64_t)v25, v26);
      }
      else
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.21(self, (uint64_t)v25, v26);
      }

    }
  }
  else
  {
LABEL_17:
    -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (void *)v30;
      objc_msgSend(v4, "itemGlobalID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqualToItemGlobalID:", v33);

      if (v34)
      {
        -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fileObjectID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqualToFileObjectID:", v36);

        if ((v37 & 1) == 0)
        {
          brc_bread_crumbs();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "fileObjectID");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = 138413058;
            v75 = v63;
            v76 = 2112;
            v77 = v64;
            v78 = 2112;
            v79 = v65;
            v80 = 2112;
            v81 = v38;
            _os_log_debug_impl(&dword_230455000, v39, OS_LOG_TYPE_DEBUG, "[NOTIF] Learning new fileObjectID for %@: %@ (was %@)%@", (uint8_t *)&v74, 0x2Au);

          }
          objc_msgSend(v4, "fileObjectID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", v40);

          -[BRCNotificationPipe _registerAsWatcherIfNeeded](self, "_registerAsWatcherIfNeeded");
        }
      }
    }
  }
  -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCNotificationPipe watchedAncestorFileObjectID](self, "watchedAncestorFileObjectID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  watchKind = self->_watchKind;
  if ((watchKind & 6) != 0)
  {
    objc_msgSend(v4, "appLibrary");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "includesDataScope");

    v44 = self->_watchKind;
    if (objc_msgSend(v4, "isDirectory") && (self->_watchKind & 8) == 0)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
LABEL_63:
        v29 = 0;
LABEL_110:

LABEL_111:
        goto LABEL_112;
      }
LABEL_30:
      -[BRCNotificationPipe _isInterestingUpdate:].cold.2();
      goto LABEL_63;
    }
    if ((v44 & 6) == 6)
      v46 = 0;
    else
      v46 = v43;
    if (v46 != 1)
    {
      if (objc_msgSend(v4, "isInTrashScope") && (self->_watchKind & 0x40) == 0)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.18();
        goto LABEL_109;
      }
      watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
      objc_msgSend(v4, "appLibraryID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(watchedAppLibraryIDs) = -[NSSet containsObject:](watchedAppLibraryIDs, "containsObject:", v51);

      if ((watchedAppLibraryIDs & 1) != 0)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v45 = objc_claimAutoreleasedReturnValue();
        v29 = 2;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.19();
        goto LABEL_110;
      }
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        goto LABEL_109;
LABEL_80:
      -[BRCNotificationPipe _isInterestingUpdate:].cold.12();
LABEL_109:
      v29 = 1;
      goto LABEL_110;
    }
    watchKind = self->_watchKind;
  }
  if ((watchKind & 1) != 0)
  {
    if ((self->_watchItemOptions & 1) != 0)
    {
      if (v27)
      {
        objc_msgSend(v4, "fileObjectID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "isEqualToFileObjectID:", v27);

        if (v49)
        {
          brc_bread_crumbs();
          v28 = objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v45 = objc_claimAutoreleasedReturnValue();
          v29 = 2;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            -[BRCNotificationPipe _isInterestingUpdate:].cold.16();
          goto LABEL_110;
        }
      }
      if (v10)
      {
        objc_msgSend(v4, "itemGlobalID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "isEqualToItemGlobalID:", v10);

        if (v53)
        {
          brc_bread_crumbs();
          v28 = objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v45 = objc_claimAutoreleasedReturnValue();
          v29 = 2;
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            goto LABEL_110;
          goto LABEL_102;
        }
      }
    }
    if ((self->_watchItemOptions & 2) != 0 && v27)
    {
      objc_msgSend(v4, "parentFileObjectID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "isEqualToFileObjectID:", v27);

      if (v55)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v45 = objc_claimAutoreleasedReturnValue();
        v29 = 2;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.13();
        goto LABEL_110;
      }
      objc_msgSend(v4, "oldParentFileObjectID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "isEqualToFileObjectID:", v27);

      if (v60)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          -[BRCNotificationPipe _isInterestingUpdate:].cold.14();
        goto LABEL_109;
      }
    }
  }
  v47 = objc_msgSend(v4, "isDocumentsFolder");
  if ((self->_watchKind & 0x46) == 0 && (self->_watchItemOptions & 4) == 0)
    goto LABEL_39;
  if (v47)
  {
    brc_bread_crumbs();
    v28 = objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      -[BRCNotificationPipe _isInterestingUpdate:].cold.1();
    goto LABEL_63;
  }
  if (objc_msgSend(v4, "isDirectory") && (self->_watchKind & 8) == 0)
  {
    brc_bread_crumbs();
    v28 = objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      goto LABEL_63;
    goto LABEL_30;
  }
  if (objc_msgSend(v4, "br_downloadStatus") == 1 && (self->_watchKind & 0x10) == 0)
  {
    brc_bread_crumbs();
    v28 = objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      -[BRCNotificationPipe _isInterestingUpdate:].cold.3();
    goto LABEL_63;
  }
  v56 = self->_watchedAppLibraryIDs;
  objc_msgSend(v4, "appLibraryID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v56) = -[NSSet containsObject:](v56, "containsObject:", v57);

  if ((v56 & 1) == 0)
  {
    brc_bread_crumbs();
    v28 = objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      goto LABEL_109;
    goto LABEL_80;
  }
  v58 = self->_watchKind;
  if ((v58 & 0x46) == 0)
  {
    if (!v10)
      goto LABEL_103;
    if ((v58 & 1) == 0)
    {
      brc_bread_crumbs();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.8();

    }
    objc_msgSend(v4, "parentGlobalIDs");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "containsObject:", v10);

    if (v62)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v45 = objc_claimAutoreleasedReturnValue();
      v29 = 2;
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        goto LABEL_110;
    }
    else
    {
      -[BRCNotificationPipe oldWatchedAncestorItemGlobalID](self, "oldWatchedAncestorItemGlobalID");
      v66 = objc_claimAutoreleasedReturnValue();
      if (!v66)
        goto LABEL_103;
      v67 = (void *)v66;
      objc_msgSend(v4, "parentGlobalIDs");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCNotificationPipe oldWatchedAncestorItemGlobalID](self, "oldWatchedAncestorItemGlobalID");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v68, "containsObject:", v69);

      if (!v70)
        goto LABEL_103;
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v45 = objc_claimAutoreleasedReturnValue();
      v29 = 2;
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        goto LABEL_110;
    }
LABEL_102:
    -[BRCNotificationPipe _isInterestingUpdate:].cold.6();
    goto LABEL_110;
  }
  if (objc_msgSend(v4, "isInDocumentScope"))
  {
    if ((self->_watchKind & 2) != 0)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v45 = objc_claimAutoreleasedReturnValue();
      v29 = 2;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.9();
      goto LABEL_110;
    }
  }
  else if (objc_msgSend(v4, "isInDataScope"))
  {
    if ((self->_watchKind & 4) != 0)
    {
      brc_bread_crumbs();
      v28 = objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v45 = objc_claimAutoreleasedReturnValue();
      v29 = 2;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[BRCNotificationPipe _isInterestingUpdate:].cold.10();
      goto LABEL_110;
    }
  }
  else if (objc_msgSend(v4, "isInTrashScope") && (self->_watchKind & 0x40) != 0)
  {
    brc_bread_crumbs();
    v28 = objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v45 = objc_claimAutoreleasedReturnValue();
    v29 = 2;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      -[BRCNotificationPipe _isInterestingUpdate:].cold.11();
    goto LABEL_110;
  }
LABEL_103:
  if ((objc_msgSend(v4, "diffs") & 0xC010) != 0)
  {
    brc_bread_crumbs();
    v28 = objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      -[BRCNotificationPipe _isInterestingUpdate:].cold.5();
    goto LABEL_109;
  }
  if (objc_msgSend(v4, "isDead"))
  {
    brc_bread_crumbs();
    v28 = objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      -[BRCNotificationPipe _isInterestingUpdate:].cold.4();
    goto LABEL_109;
  }
LABEL_39:
  v29 = 0;
LABEL_112:

  return v29;
}

- (void)_addIntraContainerUpdatesFromInterContainerUpdate:(id)a3 toArray:(id)a4
{
  id v6;
  NSSet *watchedAppLibraryIDs;
  void *v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSSet *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (objc_msgSend(v15, "isBRAlias"))
  {
    if ((self->_watchKind & 0x20) == 0)
      goto LABEL_9;
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    objc_msgSend(v15, "aliasSourceAppLibraryID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(watchedAppLibraryIDs) = -[NSSet containsObject:](watchedAppLibraryIDs, "containsObject:", v8);

    if ((watchedAppLibraryIDs & 1) == 0)
      goto LABEL_9;
LABEL_8:
    objc_msgSend(v6, "addObject:", v15);
    goto LABEL_9;
  }
  v9 = self->_watchedAppLibraryIDs;
  objc_msgSend(v15, "appLibraryID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = -[NSSet containsObject:](v9, "containsObject:", v10);

  if ((v9 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v15, "oldAppLibraryID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = self->_watchedAppLibraryIDs;
    objc_msgSend(v15, "oldAppLibraryID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = -[NSSet containsObject:](v13, "containsObject:", v14);

    if ((_DWORD)v13)
      goto LABEL_8;
  }
LABEL_9:

}

- (void)_prepareForSecondGatherWithRank:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  BRCDataOrDocsScopeGatherer *v7;
  void *v8;
  unint64_t initialGatherMaxRank;
  BRCDataOrDocsScopeGatherer *v10;
  BRCDataOrDocsScopeGatherer *gatherer;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_receiver)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCNotificationPipe _prepareForSecondGatherWithRank:].cold.2();

    dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
    if (self->_gatherer)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCNotificationPipe _prepareForSecondGatherWithRank:].cold.1();

    }
    v7 = [BRCDataOrDocsScopeGatherer alloc];
    -[NSSet allObjects](self->_watchedAppLibraries, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    initialGatherMaxRank = self->_initialGatherMaxRank;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke;
    v14[3] = &unk_24FE3F6A0;
    v14[4] = self;
    v10 = -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:](v7, "initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:", self, v8, initialGatherMaxRank, a3 + 1, 1, v14);
    gatherer = self->_gatherer;
    self->_gatherer = v10;

    self->_initialGatherMaxRank = 0;
  }
}

void __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)processUpdates:(id)a3 withRank:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *queue;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  unint64_t initialGatherMaxRank;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  BRCNotificationPipe *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[7];
  uint64_t v33[3];
  uint8_t v34[128];
  _BYTE buf[24];
  id v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_receiver)
  {
    if (self->_watchKind)
    {
      memset(v33, 0, sizeof(v33));
      __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe processUpdates:withRank:]", 872, v33);
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v33[0];
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2112;
        v36 = v6;
        v37 = 2048;
        v38 = a4;
        v39 = 2112;
        v40 = v7;
        _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@: processing updates %@ [rank:%lld]%@", buf, 0x34u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v36) = 0;
      queue = self->_queue;
      v10 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__BRCNotificationPipe_processUpdates_withRank___block_invoke;
      block[3] = &unk_24FE41DE8;
      block[5] = buf;
      block[6] = a4;
      block[4] = self;
      dispatch_sync(queue, block);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v29;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15);
            v17 = (void *)MEMORY[0x2348B9F14]();
            -[BRCNotificationPipe _addIntraContainerUpdatesFromInterContainerUpdate:toArray:](self, "_addIntraContainerUpdatesFromInterContainerUpdate:toArray:", v16, v11);
            objc_autoreleasePoolPop(v17);
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v13);
      }

      v18 = objc_msgSend(v12, "count");
      v19 = objc_msgSend(v11, "count");
      v20 = v18 - v19;
      if (v18 != v19)
      {
        if (objc_msgSend(v11, "count"))
        {
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[BRCNotificationPipe processUpdates:withRank:].cold.2((uint64_t)v21, v20, v22);
        }
        else
        {
          brc_bread_crumbs();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[BRCNotificationPipe processUpdates:withRank:].cold.1();
        }

      }
      if (objc_msgSend(v11, "count") || *(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        v24 = self->_queue;
        v25[0] = v10;
        v25[1] = 3221225472;
        v25[2] = __47__BRCNotificationPipe_processUpdates_withRank___block_invoke_115;
        v25[3] = &unk_24FE3FA40;
        v26 = v11;
        v27 = self;
        dispatch_sync(v24, v25);

      }
      _Block_object_dispose(buf, 8);
      __brc_leave_section(v33);
    }
    else
    {
      initialGatherMaxRank = self->_initialGatherMaxRank;
      if (initialGatherMaxRank && initialGatherMaxRank < a4 && !self->_secondaryGatherMaxRank)
        self->_secondaryGatherMaxRank = a4;
    }
  }

}

_QWORD *__47__BRCNotificationPipe_processUpdates_withRank___block_invoke(_QWORD *a1)
{
  _QWORD *result;
  unint64_t v3;
  unint64_t v4;

  result = (_QWORD *)a1[4];
  v3 = result[12];
  if (v3 && (v4 = a1[6], v3 < v4) && !result[13])
  {
    if (result[9])
    {
      result[13] = v4;
    }
    else
    {
      result = (_QWORD *)objc_msgSend(result, "_prepareForSecondGatherWithRank:");
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }
  }
  else if (!result[9] && !result[13])
  {
    result[12] = 0;
  }
  return result;
}

uint64_t __47__BRCNotificationPipe_processUpdates_withRank___block_invoke_115(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x2348B9F14](v3);
        v9 = objc_msgSend(*(id *)(a1 + 40), "_isInterestingUpdate:", v7, (_QWORD)v11);
        if (v9)
          objc_msgSend(*(id *)(a1 + 40), "addNotification:asDead:", v7, v9 == 1);
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = v3;
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_gatherIfNeededAndFlushAsync");
}

- (void)__flush
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BRNotificationQueue *notifs;
  _QWORD v7[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "notifBatchSize");
  if (!self->_hasUpdatesInFlight)
  {
    v5 = v4;
    if (-[BRNotificationQueue count](self->_notifs, "count"))
    {
      notifs = self->_notifs;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __30__BRCNotificationPipe___flush__block_invoke;
      v7[3] = &unk_24FE41E10;
      v7[4] = self;
      -[BRNotificationQueue dequeue:block:](notifs, "dequeue:block:", v5, v7);
    }
  }

}

void __30__BRCNotificationPipe___flush__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  __int128 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_opt_new();
  v33 = a1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v29 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v46 = v29;
      v47 = 2048;
      v48 = objc_msgSend(v3, "count");
      v49 = 2112;
      v50 = v18;
      _os_log_debug_impl(&dword_230455000, v19, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: sending %ld notifications:%@", buf, 0x20u);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = v3;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v21)
    {
      v23 = v21;
      v24 = *(_QWORD *)v40;
      *(_QWORD *)&v22 = 138412546;
      v30 = v22;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v20);
          v26 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          brc_bread_crumbs();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            v46 = v26;
            v47 = 2112;
            v48 = (uint64_t)v27;
            _os_log_debug_impl(&dword_230455000, v28, OS_LOG_TYPE_DEBUG, "[NOTIF]   %@%@", buf, 0x16u);
          }

        }
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v23);
    }

    a1 = v33;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count", v30));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v7; ++j)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v10, "fileObjectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isAppLibraryRoot") && (objc_msgSend(v11, "isCloudDocsRoot") & 1) == 0)
        {
          objc_msgSend(v10, "appLibrary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "containerMetadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRQueryItem containerItemForContainer:withRepresentativeItem:](BRCNotification, "containerItemForContainer:withRepresentativeItem:", v14, v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v15);

        }
        else
        {
          objc_msgSend(v10, "asFileProviderItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v4, "addObject:", v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v7);
  }

  v16 = *(_QWORD *)(v33 + 32);
  v17 = *(void **)(v16 + 8);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __30__BRCNotificationPipe___flush__block_invoke_118;
  v34[3] = &unk_24FE3FA18;
  v34[4] = v16;
  objc_msgSend(v17, "receiveUpdates:logicalExtensions:physicalExtensions:reply:", v4, v32, v31, v34);

}

void __30__BRCNotificationPipe___flush__block_invoke_118(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  const char *label;
  _QWORD v17[5];
  uint64_t v18[3];
  __int128 v19;
  uint64_t v20;
  _BYTE block[24];
  void *v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe __flush]_block_invoke", 981, v18);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v18[0];
    *(_WORD *)&block[12] = 2112;
    *(_QWORD *)&block[14] = v14;
    *(_WORD *)&block[22] = 2112;
    v22 = v2;
    _os_log_debug_impl(&dword_230455000, v3, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@: received notification acknowledgement%@", block, 0x20u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x24BDAC760];
  v6 = *(void **)(v4 + 120);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __30__BRCNotificationPipe___flush__block_invoke_119;
  v17[3] = &unk_24FE3FA18;
  v17[4] = v4;
  v7 = v6;
  v8 = v17;
  v9 = (void *)MEMORY[0x2348B9F14]();
  v19 = 0uLL;
  v20 = 0;
  __brc_create_section(0, (uint64_t)"brc_dispatch_async_autorelease_with_logs", 276, &v19);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = v19;
    label = dispatch_queue_get_label(v7);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v15;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v22 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[NOTIF] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v25 = v19;
  v26 = v20;
  *(_QWORD *)block = v5;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __brc_dispatch_async_autorelease_with_logs_block_invoke_0;
  v22 = &unk_24FE3FB28;
  v12 = v7;
  v23 = v12;
  v13 = v8;
  v24 = v13;
  dispatch_async(v12, block);

  objc_autoreleasePoolPop(v9);
  __brc_leave_section(v18);
}

uint64_t __30__BRCNotificationPipe___flush__block_invoke_119(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "processDequeueCallbacks");
  return objc_msgSend(*(id *)(a1 + 32), "_gatherIfNeededAndFlushAsync");
}

- (void)_gatherIfNeededAndFlushAsync
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] %@: client is really backlogged, invalidating%@");
  OUTLINED_FUNCTION_0();
}

void __51__BRCNotificationPipe__gatherIfNeededAndFlushAsync__block_invoke(uint64_t a1, char a2, void *a3)
{
  _QWORD *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 120));
  v5 = *(_QWORD **)(a1 + 32);
  if ((a2 & 1) != 0)
    goto LABEL_6;
  if ((id)v5[9] == v6)
  {
    v5[9] = 0;

    v5 = *(_QWORD **)(a1 + 32);
  }
  if (!v5[13] || v5[9])
  {
LABEL_6:
    objc_msgSend(v5, "__flush");
  }
  else
  {
    objc_msgSend(v5, "_prepareForSecondGatherWithRank:");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_gatherIfNeededAndFlushAsync");
  }

}

- (void)_stopWatchingItems
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *watchedAppLibraries;
  BRCDataOrDocsScopeGatherer *gatherer;
  id WeakRetained;
  void *v15;
  BRCNotificationPipe *v16;
  NSHashTable *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**boostReply)(void);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_watchedAppLibrariesFlags)
  {
    -[BRCNotificationManager unregisterAppLibraries:forFlags:](self->_manager, "unregisterAppLibraries:forFlags:", self->_watchedAppLibraries);
    self->_watchedAppLibrariesFlags = 0;
  }
  -[BRCNotificationManager unregisterPipeAsWatcher:](self->_manager, "unregisterPipeAsWatcher:", self);
  -[BRCNotificationPipe delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = self->_watchedAppLibraries;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "notificationPipe:didObserveAppLibrary:", self, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v5);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = self->_externalAppLibraries;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(v3, "notificationPipe:didObserveAppLibrary:", self, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v9);
  }

  watchedAppLibraries = self->_watchedAppLibraries;
  self->_watchedAppLibraries = 0;

  -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", 0);
  -[BRCNotificationPipe setWatchedAncestorItemGlobalID:](self, "setWatchedAncestorItemGlobalID:", 0);
  -[BRCNotificationPipe setWatchedAncestorFilenameToItem:](self, "setWatchedAncestorFilenameToItem:", 0);
  -[BRCDataOrDocsScopeGatherer invalidate](self->_gatherer, "invalidate");
  gatherer = self->_gatherer;
  self->_gatherer = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listOp);
  v15 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "endObservingChangesWithDelegate:", self);
    objc_storeWeak((id *)&self->_listOp, 0);
  }
  v16 = self;
  objc_sync_enter(v16);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v16->_recursiveScopeListOps;
  v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20++), "endObservingChanges", (_QWORD)v23);
      }
      while (v18 != v20);
      v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v18);
  }

  -[NSHashTable removeAllObjects](v16->_recursiveScopeListOps, "removeAllObjects");
  objc_sync_exit(v16);

  boostReply = (void (**)(void))v16->_boostReply;
  if (boostReply)
  {
    boostReply[2]();
    v22 = v16->_boostReply;
    v16->_boostReply = 0;

  }
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  BRCListDirectoryContentsOperation **p_listOp;
  id v7;
  id WeakRetained;
  id obj;

  obj = a4;
  p_listOp = &self->_listOp;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_listOp);

  if (WeakRetained == v7)
    objc_storeWeak((id *)p_listOp, obj);

}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__BRCNotificationPipe_close__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __28__BRCNotificationPipe_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)__performBlockafterDBAndNotifFlush:(id)a3 session:(id)a4 description:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  BRCNotificationPipe *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  BRCNotificationPipe *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v12;
    v29 = 2112;
    v30 = self;
    v31 = 2112;
    v32 = v14;
    _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting for db flush for %@ in %@%@", buf, 0x20u);
  }

  objc_msgSend(v11, "clientTruthWorkloop");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke;
  block[3] = &unk_24FE41EB0;
  v22 = v11;
  v23 = v12;
  v25 = v13;
  v26 = v10;
  v24 = self;
  v17 = v13;
  v18 = v10;
  v19 = v12;
  v20 = v11;
  dispatch_async(v16, block);

}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2;
  v11[3] = &unk_24FE40140;
  v12 = *(id *)(a1 + 32);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3;
  v6[3] = &unk_24FE41E88;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  v10 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performWithFlags:action:whenFlushed:", 0, v11, v6);

}

uint64_t __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "forceBatchStart");

  return 1;
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3_cold_1(a1, (uint64_t)v2, v3);

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 120);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_123;
  v7[3] = &unk_24FE40D48;
  v7[4] = v4;
  v8 = v5;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  dispatch_async(v6, v7);

}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_123(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, a1[4]);
  v2 = a1[4];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2_124;
  v3[3] = &unk_24FE41E60;
  objc_copyWeak(&v7, &location);
  v4 = a1[5];
  v6 = a1[7];
  v5 = a1[6];
  objc_msgSend(v2, "addDequeueCallback:", v3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_2_124(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412802;
    v7 = v5;
    v8 = 2112;
    v9 = WeakRetained;
    v10 = 2112;
    v11 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[NOTIF] Finished gather group for %@ in %@%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_performBlock:(id)a3 whenNotifsAreFullyFlushedInClientZone:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  BRCNotificationPipe *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v9;
    v23 = 2112;
    v24 = self;
    v25 = 2112;
    v26 = v12;
    _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting for faulting for %@ in %@%@", buf, 0x20u);
  }

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInClientZone_description___block_invoke;
  v17[3] = &unk_24FE41ED8;
  v17[4] = self;
  v18 = v11;
  v19 = v9;
  v20 = v8;
  v14 = v9;
  v15 = v11;
  v16 = v8;
  objc_msgSend(v10, "notifyClient:whenFaultingIsDone:", CFSTR("nsmdq"), v17);

}

void __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInClientZone_description___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInClientZone_description___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "__performBlockafterDBAndNotifFlush:session:description:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

}

- (void)_performBlock:(id)a3 whenNotifsAreFullyFlushedInAppLibrary:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  BRCNotificationPipe *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = self;
    v26 = 2112;
    v27 = v12;
    _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting for faulting for %@ in %@%@", buf, 0x20u);
  }

  objc_msgSend(v10, "defaultClientZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke;
  v18[3] = &unk_24FE41ED8;
  v18[4] = self;
  v19 = v11;
  v20 = v9;
  v21 = v8;
  v15 = v9;
  v16 = v11;
  v17 = v8;
  objc_msgSend(v14, "notifyClient:whenFaultingIsDone:", CFSTR("extension"), v18);

}

void __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInAppLibrary_description___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInClientZone_description___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "__performBlockafterDBAndNotifFlush:session:description:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

}

- (void)watchScopes:(unsigned __int16)a3 trustedAppLibraryIDs:(id)a4 gatherReply:(id)a5
{
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  OS_dispatch_group *v20;
  OS_dispatch_group *gatherGroup;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  BRCDataOrDocsScopeGatherer *v36;
  void *v37;
  unint64_t initialGatherMaxRank;
  BRCDataOrDocsScopeGatherer *v39;
  BRCDataOrDocsScopeGatherer *gatherer;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  int watchKind;
  id v49;
  void (**v50)(id, void *);
  NSSet *v51;
  id v52;
  id obj;
  void *v54;
  unsigned int v55;
  _QWORD v56[4];
  void (**v57)(id, void *);
  _BYTE *v58;
  id v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[5];
  id v63;
  BRCNotificationPipe *v64;
  _BYTE *v65;
  id v66;
  _QWORD block[5];
  id v68;
  BRCNotificationPipe *v69;
  _BYTE *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id location;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81[3];
  _BYTE v82[128];
  uint8_t v83[128];
  _BYTE buf[40];
  id v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  id v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v55 = a3;
  v93 = *MEMORY[0x24BDAC8D0];
  v49 = a4;
  v50 = (void (**)(id, void *))a5;
  memset(v81, 0, sizeof(v81));
  __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:]", 1187, v81);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134220290;
    *(_QWORD *)&buf[4] = v81[0];
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v55 & 1;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = (v55 >> 1) & 1;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = (v55 >> 2) & 1;
    LOWORD(v85) = 1024;
    *(_DWORD *)((char *)&v85 + 2) = (v55 >> 3) & 1;
    HIWORD(v85) = 1024;
    v86 = (v55 >> 4) & 1;
    v87 = 1024;
    v88 = 0;
    v89 = 2112;
    v90 = v49;
    v91 = 2112;
    v92 = v7;
    _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx %@: starting watching ubiquitous scope (docs:%d data:%d ext:%d dirs:%d faults:%d trash:%d) for %@%@", buf, 0x4Eu);
  }

  if (self->_watchKind)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      watchKind = self->_watchKind;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = watchKind;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v9;
      _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, "[ERROR] %@: EALREADY: watch already set up to kind %d%@", buf, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 37);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2](v50, v11);
  }
  else if ((2 * v55) & 6 | (32 * ((v55 >> 2) & 1)))
  {
    -[BRCNotificationManager session](self->_manager, "session");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v49);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v49, "count"));
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v12 = v49;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v78 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v54, "appLibraryByID:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(obj, "addObject:", v17);
          }
          else
          {
            brc_bread_crumbs();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v16;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v18;
              _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] %@: unable to find container %@%@", buf, 0x20u);
            }

            objc_msgSend(v52, "removeObject:", v16);
          }

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
      }
      while (v13);
    }

    if (objc_msgSend(obj, "count"))
    {
      objc_storeStrong((id *)&self->_watchedAppLibraries, obj);
      objc_storeStrong((id *)&self->_watchedAppLibraryIDs, v52);
      self->_watchedAppLibrariesFlags = 3;
      v20 = (OS_dispatch_group *)dispatch_group_create();
      gatherGroup = self->_gatherGroup;
      self->_gatherGroup = v20;

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__10;
      *(_QWORD *)&buf[32] = __Block_byref_object_dispose__10;
      v85 = 0;
      objc_initWeak(&location, self);
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v51 = self->_watchedAppLibraries;
      v22 = -[NSSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v73;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v73 != v23)
              objc_enumerationMutation(v51);
            v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
            -[BRCNotificationPipe delegate](self, "delegate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "notificationPipe:willObserveAppLibrary:", self, v25);

            if ((v55 & 1) != 0)
            {
              objc_msgSend(v25, "dbRowID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[BRCItemID documentsItemIDWithAppLibraryRowID:](BRCItemID, "documentsItemIDWithAppLibraryRowID:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
              objc_msgSend(v25, "db");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "serialQueue");
              v30 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke;
              block[3] = &unk_24FE41F28;
              block[4] = v25;
              v68 = v28;
              v69 = self;
              v31 = v28;
              objc_copyWeak(&v71, &location);
              v70 = buf;
              dispatch_async(v30, block);

              objc_destroyWeak(&v71);
            }
            if ((v55 & 2) != 0)
            {
              objc_msgSend(v25, "rootItemID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
              objc_msgSend(v25, "db");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "serialQueue");
              v34 = objc_claimAutoreleasedReturnValue();
              v62[0] = MEMORY[0x24BDAC760];
              v62[1] = 3221225472;
              v62[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3;
              v62[3] = &unk_24FE41F28;
              v62[4] = v25;
              v63 = v32;
              v64 = self;
              v35 = v32;
              objc_copyWeak(&v66, &location);
              v65 = buf;
              dispatch_async(v34, v62);

              objc_destroyWeak(&v66);
            }
          }
          v22 = -[NSSet countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
        }
        while (v22);
      }

      -[BRCNotificationManager registerAppLibraries:forFlags:](self->_manager, "registerAppLibraries:forFlags:", self->_watchedAppLibraries, self->_watchedAppLibrariesFlags);
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      v36 = [BRCDataOrDocsScopeGatherer alloc];
      objc_msgSend(obj, "allObjects");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      initialGatherMaxRank = self->_initialGatherMaxRank;
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_134;
      v60[3] = &unk_24FE41F50;
      objc_copyWeak(&v61, &location);
      v60[4] = buf;
      v39 = -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:](v36, "initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:", self, v37, 1, initialGatherMaxRank, 0, v60);
      gatherer = self->_gatherer;
      self->_gatherer = v39;

      self->_watchKind = (2 * (_BYTE)v55) & 0x80 | v55 & 0x18 | (2 * v55) & 6 | (32 * ((v55 >> 2) & 1));
      v41 = self->_gatherGroup;
      -[BRCNotificationPipe queue](self, "queue");
      v42 = objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x24BDAC760];
      v56[1] = 3221225472;
      v56[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_135;
      v56[3] = &unk_24FE41F78;
      objc_copyWeak(&v59, &location);
      v57 = v50;
      v58 = buf;
      dispatch_group_notify(v41, v42, v56);

      -[BRCNotificationPipe _gatherIfNeededAndFlushAsync](self, "_gatherIfNeededAndFlushAsync");
      objc_destroyWeak(&v59);
      objc_destroyWeak(&v61);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      brc_bread_crumbs();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, (os_log_type_t)0x90u))
        -[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:].cold.1();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2](v50, v47);

    }
    v11 = v54;
  }
  else
  {
    brc_bread_crumbs();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v43;
      _os_log_impl(&dword_230455000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] %@: client didn't specify Document or Data Scope%@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2](v50, v11);
  }

  __brc_leave_section(v81);
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[6];
  id v11;
  id v12;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", *(_QWORD *)(a1 + 40), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_2();

    objc_msgSend(v3, "beginObservingChanges");
    v6 = *(id *)(a1 + 48);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 176), "addObject:", v3);
    objc_sync_exit(v6);

    objc_initWeak(&location, v3);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_131;
    v10[3] = &unk_24FE41F00;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    objc_copyWeak(&v12, &location);
    v7 = *(_QWORD *)(a1 + 56);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v7;
    objc_msgSend(v3, "addRecursiveDirectoryListCompletionBlock:", v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_1();

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 80));
  }

}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    objc_msgSend(v6[22], "removeObject:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v3;
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2;
    v15[3] = &unk_24FE41790;
    v13 = a1 + 32;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "description", MEMORY[0x24BDAC760], 3221225472, __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2, &unk_24FE41790, v6, *(_QWORD *)(v13 + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_performBlock:whenNotifsAreFullyFlushedInAppLibrary:description:", v15, v12, v14);

  }
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[6];
  id v11;
  id v12;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "defaultClientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", *(_QWORD *)(a1 + 40), 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_2();

    objc_msgSend(v3, "beginObservingChanges");
    v6 = *(id *)(a1 + 48);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 176), "addObject:", v3);
    objc_sync_exit(v6);

    objc_initWeak(&location, v3);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_132;
    v10[3] = &unk_24FE41F00;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    objc_copyWeak(&v12, &location);
    v7 = *(_QWORD *)(a1 + 56);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v7;
    objc_msgSend(v3, "addRecursiveDirectoryListCompletionBlock:", v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_1();

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 80));
  }

}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_132(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    objc_msgSend(v6[22], "removeObject:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v3;
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2_133;
    v15[3] = &unk_24FE41790;
    v13 = a1 + 32;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "description", MEMORY[0x24BDAC760], 3221225472, __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2_133, &unk_24FE41790, v6, *(_QWORD *)(v13 + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_performBlock:whenNotifsAreFullyFlushedInAppLibrary:description:", v15, v12, v14);

  }
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_2_133(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_134(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  dispatch_group_t *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (dispatch_group_t *)WeakRetained;
    objc_sync_enter(v6);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v3;
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_134_cold_1();

    dispatch_group_leave(v6[10]);
  }

}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_135(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_135_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "brc_wrappedError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

- (void)_watchItem:(id)a3 options:(unsigned __int16)a4 gatherReply:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSSet *v18;
  NSSet *watchedAppLibraries;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSSet *v24;
  NSSet *watchedAppLibraryIDs;
  void *v26;
  OS_dispatch_group *v27;
  OS_dispatch_group *gatherGroup;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id WeakRetained;
  BOOL v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  BRCNotificationPipe *v43;
  uint64_t v44;
  BRCDataOrDocsScopeGatherer *v45;
  void *v46;
  unint64_t initialGatherMaxRank;
  BRCDataOrDocsScopeGatherer *v48;
  BRCDataOrDocsScopeGatherer *gatherer;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  OS_dispatch_queue *queue;
  uint64_t v54;
  _QWORD *v55;
  NSObject *v56;
  int watchKind;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  _QWORD v62[5];
  id v63;
  _BYTE *v64;
  uint64_t v65;
  _QWORD block[4];
  void (**v67)(id, void *);
  _BYTE *v68;
  id v69;
  _QWORD v70[5];
  id v71;
  _QWORD v72[5];
  id v73;
  _BYTE *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _BYTE *v78;
  id v79;
  id v80;
  id location;
  _BYTE buf[32];
  void (*v83)(uint64_t);
  id v84;
  void *v85;
  void *v86;
  _BYTE from[24];
  void *v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (self->_watchKind)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      watchKind = self->_watchKind;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = watchKind;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v10;
      _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] %@: EALREADY: watch already set up to kind %d%@", buf, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12);

    goto LABEL_35;
  }
  if (v8)
  {
    -[BRCNotificationPipe setWatchedAncestorFilenameToItem:](self, "setWatchedAncestorFilenameToItem:", 0);
    objc_msgSend(v8, "fileObjectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCNotificationPipe setWatchedAncestorFileObjectID:](self, "setWatchedAncestorFileObjectID:", v13);

    objc_msgSend(v8, "itemGlobalID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCNotificationPipe setWatchedAncestorItemGlobalID:](self, "setWatchedAncestorItemGlobalID:", v14);

    v15 = objc_alloc(MEMORY[0x24BDBCF20]);
    objc_msgSend(v8, "appLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (NSSet *)objc_msgSend(v15, "initWithArray:", v17);
    watchedAppLibraries = self->_watchedAppLibraries;
    self->_watchedAppLibraries = v18;

    v20 = objc_alloc(MEMORY[0x24BDBCF20]);
    objc_msgSend(v8, "appLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appLibraryID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (NSSet *)objc_msgSend(v20, "initWithArray:", v23);
    watchedAppLibraryIDs = self->_watchedAppLibraryIDs;
    self->_watchedAppLibraryIDs = v24;

LABEL_8:
    -[BRCNotificationPipe _registerAsWatcherIfNeeded](self, "_registerAsWatcherIfNeeded");
    self->_watchItemOptions = a4;
    v27 = (OS_dispatch_group *)dispatch_group_create();
    gatherGroup = self->_gatherGroup;
    self->_gatherGroup = v27;

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__10;
    v83 = __Block_byref_object_dispose__10;
    v84 = 0;
    objc_initWeak(&location, self);
    if (!self->_watchedAncestorFileObjectID || !objc_msgSend(v8, "isDirectory"))
    {
LABEL_28:
      if ((a4 & 4) != 0)
        v44 = 3;
      else
        v44 = 1;
      dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      if (self->_gatherer)
      {
        brc_bread_crumbs();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
          -[BRCNotificationPipe _prepareForSecondGatherWithRank:].cold.1();

      }
      v45 = [BRCDataOrDocsScopeGatherer alloc];
      -[NSSet allObjects](self->_watchedAppLibraries, "allObjects");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      initialGatherMaxRank = self->_initialGatherMaxRank;
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_141;
      v70[3] = &unk_24FE41F50;
      objc_copyWeak(&v71, &location);
      v70[4] = buf;
      v48 = -[BRCDataOrDocsScopeGatherer initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:](v45, "initWithNotificationPipe:appLibraries:startingRank:maxRank:withDeadItems:gatherReply:", self, v46, 1, initialGatherMaxRank, 0, v70);
      gatherer = self->_gatherer;
      self->_gatherer = v48;

      self->_watchKind = 1;
      v50 = self->_gatherGroup;
      -[BRCNotificationPipe queue](self, "queue");
      v51 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_142;
      block[3] = &unk_24FE41F78;
      objc_copyWeak(&v69, &location);
      v67 = v9;
      v68 = buf;
      dispatch_group_notify(v50, v51, block);

      if ((a4 & 8) != 0)
      {
        -[BRCNotificationPipe watchedAncestorItemGlobalID](self, "watchedAncestorItemGlobalID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCDataOrDocsScopeGatherer setGatheredChildrenItemGlobalID:](self->_gatherer, "setGatheredChildrenItemGlobalID:", v52);

      }
      queue = self->_queue;
      v54 = MEMORY[0x24BDAC760];
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_143;
      v62[3] = &unk_24FE41FC8;
      v62[4] = self;
      v64 = buf;
      v65 = v44;
      v63 = v8;
      v55 = v62;
      *(_QWORD *)from = v54;
      *(_QWORD *)&from[8] = 3221225472;
      *(_QWORD *)&from[16] = __brc_dispatch_async_autorelease_block_invoke;
      v88 = &unk_24FE41D98;
      v89 = v55;
      v56 = queue;
      dispatch_async(v56, from);

      objc_destroyWeak(&v69);
      objc_destroyWeak(&v71);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_35;
    }
    objc_msgSend(v8, "clientZone");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 4) != 0)
    {
      objc_msgSend(v8, "itemID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", v40, 1, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        brc_bread_crumbs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)from = 138412802;
          *(_QWORD *)&from[4] = v32;
          *(_WORD *)&from[12] = 2112;
          *(_QWORD *)&from[14] = self;
          *(_WORD *)&from[22] = 2112;
          v88 = v41;
          _os_log_debug_impl(&dword_230455000, v42, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting on gather group for %@ in %@%@", from, 0x20u);
        }

        dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      }
      objc_msgSend(v32, "beginObservingChanges");
      v43 = self;
      objc_sync_enter(v43);
      -[NSHashTable addObject:](v43->_recursiveScopeListOps, "addObject:", v32);
      objc_sync_exit(v43);

      objc_initWeak((id *)from, v32);
      v76[0] = MEMORY[0x24BDAC760];
      v76[1] = 3221225472;
      v76[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke;
      v76[3] = &unk_24FE41F00;
      objc_copyWeak(&v79, &location);
      objc_copyWeak(&v80, (id *)from);
      v78 = buf;
      v77 = v29;
      objc_msgSend(v32, "addRecursiveDirectoryListCompletionBlock:", v76);

      objc_destroyWeak(&v80);
      objc_destroyWeak(&v79);
      objc_destroyWeak((id *)from);
    }
    else
    {
      if ((a4 & 2) == 0)
      {
LABEL_27:

        goto LABEL_28;
      }
      -[BRCItemGlobalID itemID](self->_watchedAncestorItemGlobalID, "itemID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v31, 1, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "beginObservingChangesWithDelegate:", self);
      if (v32)
      {
        brc_bread_crumbs();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        brc_notifications_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)from = 138412802;
          *(_QWORD *)&from[4] = v32;
          *(_WORD *)&from[12] = 2112;
          *(_QWORD *)&from[14] = self;
          *(_WORD *)&from[22] = 2112;
          v88 = v33;
          _os_log_debug_impl(&dword_230455000, v34, OS_LOG_TYPE_DEBUG, "[NOTIF] Waiting on gather group for %@ in %@%@", from, 0x20u);
        }

        dispatch_group_enter((dispatch_group_t)self->_gatherGroup);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_listOp);
      v36 = WeakRetained == 0;

      if (!v36)
      {
        brc_bread_crumbs();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          -[BRCNotificationPipe _watchItem:options:gatherReply:].cold.3();

      }
      objc_storeWeak((id *)&self->_listOp, v32);
      v72[0] = MEMORY[0x24BDAC760];
      v72[1] = 3221225472;
      v72[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_139;
      v72[3] = &unk_24FE41FA0;
      objc_copyWeak(&v75, &location);
      v72[4] = self;
      v74 = buf;
      v73 = v29;
      objc_msgSend(v32, "addDirectoryListCompletionBlock:", v72);

      objc_destroyWeak(&v75);
    }

    goto LABEL_27;
  }
  -[BRCNotificationPipe watchedAncestorFilenameToItem](self, "watchedAncestorFilenameToItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    goto LABEL_8;
  brc_bread_crumbs();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    -[BRCNotificationPipe _watchItem:options:gatherReply:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Invalid notification pipe setup"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v39);

LABEL_35:
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    objc_msgSend(v6[22], "removeObject:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v3;
    objc_storeStrong(v8, v11);
    objc_sync_exit(v6);

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_2;
    v15[3] = &unk_24FE41790;
    v13 = a1 + 32;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "description", MEMORY[0x24BDAC760], 3221225472, __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_2, &unk_24FE41790, v6, *(_QWORD *)(v13 + 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_performBlock:whenNotifsAreFullyFlushedInClientZone:description:", v15, v12, v14);

  }
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id *v7;
  id v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v20 = v17;
    v21 = 2112;
    v22 = v3;
    v23 = 2112;
    v24 = WeakRetained;
    v25 = 2112;
    v26 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[NOTIF] %@ - Calling the list completion block with %@, sself = %@%@", buf, 0x2Au);
  }

  if (WeakRetained)
  {
    v7 = (id *)WeakRetained;
    objc_sync_enter(v7);
    v8 = objc_loadWeakRetained(v7 + 16);
    objc_storeWeak(v7 + 16, 0);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
      v13 = v11;
    else
      v13 = v3;
    objc_storeStrong(v10, v13);
    objc_sync_exit(v7);

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_140;
    v18[3] = &unk_24FE41790;
    v15 = a1 + 40;
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "description", MEMORY[0x24BDAC760], 3221225472, __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_140, &unk_24FE41790, v7, *(_QWORD *)(v15 + 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_performBlock:whenNotifsAreFullyFlushedInClientZone:description:", v18, v14, v16);

  }
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_140(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 80));
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  dispatch_group_t *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (dispatch_group_t *)WeakRetained;
    objc_sync_enter(v6);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_134_cold_1();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
      v13 = v11;
    else
      v13 = v3;
    objc_storeStrong(v10, v13);
    dispatch_group_leave(v6[10]);
    objc_sync_exit(v6);

  }
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_142(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_142_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "brc_wrappedError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_143(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v3 = *(id *)(v2 + 168);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v28 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "notificationPipe:willObserveAppLibrary:", *(_QWORD *)(a1 + 32), v7);

        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v4);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "registerAppLibraries:forFlags:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), *(_QWORD *)(a1 + 56));
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(void **)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v19, "watchedAncestorFileObjectID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "watchedAncestorItemGlobalID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "watchedAncestorFilenameToItem");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = &stru_24FE4A790;
      *(_DWORD *)buf = 138413570;
      if (v23)
        v25 = (const __CFString *)v23;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v21;
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v25;
      v41 = 2112;
      v42 = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: started watching children of %@ (fsid:%@ id:%@ filename:%@)%@", buf, 0x3Eu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_gatherIfNeededAndFlushAsync");
  }
  else
  {
    obj = (id)v2;
    objc_sync_enter(obj);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    if (v12)
    {
      v13 = v12;
      v14 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 4);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 72);
    *(_QWORD *)(v17 + 72) = 0;

    objc_sync_exit(obj);
  }
}

- (void)invalidateIfWatchingAppLibraryIDs:(id)a3
{
  if (-[NSSet intersectsSet:](self->_watchedAppLibraryIDs, "intersectsSet:", a3))
    -[BRCNotificationPipe close](self, "close");
}

- (void)invalidateReceiverIfWatchingAppLibraryIDs:(id)a3
{
  if (-[NSSet intersectsSet:](self->_watchedAppLibraryIDs, "intersectsSet:", a3))
    -[BRItemNotificationReceiving invalidate](self->_receiver, "invalidate");
}

- (BOOL)isWatchingGlobalItemID:(id)a3
{
  return -[BRCItemGlobalID isEqualToItemGlobalID:](self->_watchedAncestorItemGlobalID, "isEqualToItemGlobalID:", a3);
}

- (BRCNotificationManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BRCItemGlobalID)oldWatchedAncestorItemGlobalID
{
  return (BRCItemGlobalID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOldWatchedAncestorItemGlobalID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BRCItemGlobalID)watchedAncestorItemGlobalID
{
  return (BRCItemGlobalID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWatchedAncestorItemGlobalID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BRFileObjectID)watchedAncestorFileObjectID
{
  return (BRFileObjectID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWatchedAncestorFileObjectID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)watchedAncestorFilenameToItem
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWatchedAncestorFilenameToItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_watchedAppLibraryIDs, 0);
  objc_storeStrong((id *)&self->_recursiveScopeListOps, 0);
  objc_storeStrong((id *)&self->_watchedAppLibraries, 0);
  objc_storeStrong((id *)&self->_externalAppLibraries, 0);
  objc_storeStrong((id *)&self->_watchForBundleID, 0);
  objc_storeStrong((id *)&self->_watchNamePrefix, 0);
  objc_destroyWeak((id *)&self->_listOp);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_gatherGroup, 0);
  objc_storeStrong((id *)&self->_gatherer, 0);
  objc_storeStrong((id *)&self->_watchedAncestorFilenameToItem, 0);
  objc_storeStrong((id *)&self->_watchedAncestorFileObjectID, 0);
  objc_storeStrong((id *)&self->_watchedAncestorItemGlobalID, 0);
  objc_storeStrong((id *)&self->_oldWatchedAncestorItemGlobalID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_boostReply, 0);
  objc_storeStrong((id *)&self->_notifs, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

- (void)watchItemsNamesPrefixedBy:(id)a3 inScopes:(unsigned __int16)a4 appLibraryIDs:(id)a5 gatherReply:(id)a6
{
  uint64_t v8;
  id v9;
  BRCNotificationPipe *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  BRCNotificationPipe *v18;
  uint64_t v19;
  uint64_t v20;
  qos_class_t v21;
  void *v22;
  BRCXPCClient *client;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30[3];
  uint8_t buf[4];
  BRCNotificationPipe *v32;
  __int16 v33;
  BRCNotificationPipe *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v8 = a4;
  v9 = a3;
  v41 = *MEMORY[0x24BDAC8D0];
  v11 = (BRCNotificationPipe *)a3;
  v12 = a5;
  v13 = a6;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) watchItemsNamesPrefixedBy:inScopes:appLibraryIDs:gatherReply:]", 1564, v30);
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v27 = v13;
    v16 = v9;
    v17 = v12;
    v18 = v11;
    v19 = v8;
    v20 = v30[0];
    v21 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v21, (uint64_t)&brc_qos_entries, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v32 = (BRCNotificationPipe *)v20;
    v33 = 2112;
    v34 = self;
    v35 = 2112;
    v36 = v22;
    v37 = 2080;
    v38 = "-[BRCNotificationPipe(IPCs) watchItemsNamesPrefixedBy:inScopes:appLibraryIDs:gatherReply:]";
    v39 = 2112;
    v40 = v14;
    _os_log_impl(&dword_230455000, v15, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

    v8 = v19;
    v11 = v18;
    v12 = v17;
    v9 = v16;
    v13 = v27;
  }

  client = self->_client;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __90__BRCNotificationPipe_IPCs__watchItemsNamesPrefixedBy_inScopes_appLibraryIDs_gatherReply___block_invoke;
  v28[3] = &unk_24FE41D48;
  v28[4] = self;
  v24 = v13;
  v29 = v24;
  LODWORD(client) = _brc_ipc_check_logged_status(client, 1, v28);

  if ((_DWORD)client)
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v32 = self;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v25;
      _os_log_debug_impl(&dword_230455000, v26, OS_LOG_TYPE_DEBUG, "[NOTIF] %@: watching items prefixed by \"%@\"%@", buf, 0x20u);
    }

    objc_storeStrong((id *)&self->_watchNamePrefix, v9);
    -[BRCNotificationPipe watchScopes:appLibraryIDs:gatherReply:](self, "watchScopes:appLibraryIDs:gatherReply:", v8, v12, v24);
  }
  __brc_leave_section(v30);

}

void __90__BRCNotificationPipe_IPCs__watchItemsNamesPrefixedBy_inScopes_appLibraryIDs_gatherReply___block_invoke(uint64_t a1, void *a2)
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

- (void)watchScopes:(unsigned __int16)a3 appLibraryIDs:(id)a4 gatherReply:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  qos_class_t v13;
  void *v14;
  BRCXPCClient *client;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD *, void *);
  void *v21;
  BRCNotificationPipe *v22;
  id v23;
  id v24;
  uint64_t v25[3];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  BRCNotificationPipe *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v6 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  memset(v25, 0, sizeof(v25));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) watchScopes:appLibraryIDs:gatherReply:]", 1579, v25);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v25[0];
    v13 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v13, (uint64_t)&brc_qos_entries, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v27 = v12;
    v28 = 2112;
    v29 = self;
    v30 = 2112;
    v31 = v14;
    v32 = 2080;
    v33 = "-[BRCNotificationPipe(IPCs) watchScopes:appLibraryIDs:gatherReply:]";
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  client = self->_client;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __67__BRCNotificationPipe_IPCs__watchScopes_appLibraryIDs_gatherReply___block_invoke;
  v21 = &unk_24FE41FF0;
  v22 = self;
  v16 = v8;
  v23 = v16;
  v17 = v9;
  v24 = v17;
  LODWORD(client) = _brc_ipc_check_applibrary_proxy(client, 1, &v18);

  if ((_DWORD)client)
    -[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:](self, "watchScopes:trustedAppLibraryIDs:gatherReply:", v6, v16, v17, v18, v19, v20, v21, v22);
  __brc_leave_section(v25);

}

void __67__BRCNotificationPipe_IPCs__watchScopes_appLibraryIDs_gatherReply___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    v9 = (void *)a1[5];
    v10 = *(_QWORD *)(a1[4] + 32);
    v11 = 138413058;
    v12 = v10;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] %@: can't watch %@: %@%@", (uint8_t *)&v11, 0x2Au);
  }

  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = a1[4];
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)watchScopes:(unsigned __int16)a3 gatherReply:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  qos_class_t v10;
  void *v11;
  BRCXPCClient *client;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  BRCNotificationPipe *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) watchScopes:gatherReply:]", 1589, v18);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v18[0];
    v10 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v10, (uint64_t)&brc_qos_entries, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v20 = v9;
    v21 = 2112;
    v22 = self;
    v23 = 2112;
    v24 = v11;
    v25 = 2080;
    v26 = "-[BRCNotificationPipe(IPCs) watchScopes:gatherReply:]";
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  client = self->_client;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__BRCNotificationPipe_IPCs__watchScopes_gatherReply___block_invoke;
  v16[3] = &unk_24FE41D48;
  v16[4] = self;
  v13 = v6;
  v17 = v13;
  LODWORD(client) = _brc_ipc_check_applibraries_access(client, 1, v16);

  if ((_DWORD)client)
  {
    -[BRCXPCClient entitledAppLibraryIDs](self->_client, "entitledAppLibraryIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCNotificationPipe watchScopes:trustedAppLibraryIDs:gatherReply:](self, "watchScopes:trustedAppLibraryIDs:gatherReply:", v4, v15, v13);
  }
  __brc_leave_section(v18);

}

void __53__BRCNotificationPipe_IPCs__watchScopes_gatherReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] %@: can't watch app containers: %@%@", (uint8_t *)&v10, 0x20u);
  }

  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)boostPriority:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  qos_class_t v8;
  void *v9;
  void (**boostReply)(void);
  void *v11;
  id v12;
  uint64_t v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  BRCNotificationPipe *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v13, 0, sizeof(v13));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) boostPriority:]", 1596, v13);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v13[0];
    v8 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v15 = v7;
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v9;
    v20 = 2080;
    v21 = "-[BRCNotificationPipe(IPCs) boostPriority:]";
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  boostReply = (void (**)(void))self->_boostReply;
  if (boostReply)
    boostReply[2]();
  v11 = (void *)MEMORY[0x2348BA0DC](v4);
  v12 = self->_boostReply;
  self->_boostReply = v11;

  __brc_leave_section(v13);
}

- (void)watchItemWithFileObjectID:(id)a3 options:(unsigned __int16)a4 request:(id)a5 gatherReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD *v28;
  const char *label;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  BRCNotificationPipe *v35;
  id v36;
  unsigned __int16 v37;
  __int128 v38;
  uint64_t v39;
  _BYTE block[24];
  void *v41;
  NSObject *v42;
  id v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[BRCNotificationManager session](self->_manager, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BRCNotificationPipe(IPCs) watchItemWithFileObjectID:options:request:gatherReply:].cold.1();

  objc_msgSend(v13, "clientTruthWorkloop");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke;
  v31[3] = &unk_24FE42018;
  v18 = v10;
  v32 = v18;
  v19 = v12;
  v36 = v19;
  v20 = v13;
  v33 = v20;
  v21 = v11;
  v34 = v21;
  v35 = self;
  v37 = a4;
  v22 = v16;
  v23 = v31;
  v24 = (void *)MEMORY[0x2348B9F14]();
  v38 = 0uLL;
  v39 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v38);
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v30 = v38;
    label = dispatch_queue_get_label(v22);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v30;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v41 = v25;
    _os_log_debug_impl(&dword_230455000, v26, OS_LOG_TYPE_DEBUG, "[NOTIF] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v44 = v38;
  v45 = v39;
  *(_QWORD *)block = v17;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke_4;
  v41 = &unk_24FE3FB28;
  v27 = v22;
  v42 = v27;
  v28 = v23;
  v43 = v28;
  dispatch_async(v27, block);

  objc_autoreleasePoolPop(v24);
}

void __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isRootContainerItem"))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "itemByFileObjectID:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "appLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appLibraryID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = objc_msgSend(*(id *)(a1 + 48), "isSystemRequest");
        if (v4 && v6 && (objc_msgSend(v4, "isAppInstalled") & 1) == 0)
        {
          brc_bread_crumbs();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke_cold_1();

          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        }
        else
        {
          if (objc_msgSend(v3, "isZoneRoot"))
          {
            objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorFilenameToItem:", 0);
            objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorFileObjectID:", *(_QWORD *)(a1 + 32));
          }
          else
          {
            objc_msgSend(v3, "st");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "logicalName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorFilenameToItem:", v17);

            objc_msgSend(v3, "parentFileObjectID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorFileObjectID:", v18);

          }
          objc_msgSend(*(id *)(a1 + 56), "setWatchedAncestorItemGlobalID:", 0);
          v19 = objc_alloc(MEMORY[0x24BDBCF20]);
          v32 = v4;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "initWithArray:", v20);
          v22 = *(_QWORD *)(a1 + 56);
          v23 = *(void **)(v22 + 168);
          *(_QWORD *)(v22 + 168) = v21;

          v24 = objc_alloc(MEMORY[0x24BDBCF20]);
          v31 = v5;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "initWithArray:", v25);
          v27 = *(_QWORD *)(a1 + 56);
          v28 = *(void **)(v27 + 184);
          *(_QWORD *)(v27 + 184) = v26;

          objc_msgSend(*(id *)(a1 + 56), "_watchItem:options:gatherReply:", v3, *(unsigned __int16 *)(a1 + 72), *(_QWORD *)(a1 + 64));
        }
      }
      else
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          v34 = v13;
          v35 = 2112;
          v36 = 0;
          v37 = 2112;
          v38 = v11;
          _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Path %@ is not an existing app library: %@%@", buf, 0x20u);
        }

        v14 = *(_QWORD *)(a1 + 64);
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

      }
    }
    else
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v34 = v9;
        v35 = 2112;
        v36 = 0;
        v37 = 2112;
        v38 = v7;
        _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Path %@ is not an existing container: %@%@", buf, 0x20u);
      }

      v10 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 22);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v4);
    }

  }
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  qos_class_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BRCXPCClient *client;
  BRItemNotificationReceiving *receiver;
  uint64_t v12[3];
  uint64_t v13[3];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  BRCNotificationPipe *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(1, (uint64_t)"-[BRCNotificationPipe(IPCs) invalidate]", 1688, v13);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v13[0];
    v6 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v6, (uint64_t)&brc_qos_entries, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v15 = v5;
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    v20 = 2080;
    v21 = "-[BRCNotificationPipe(IPCs) invalidate]";
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  if (self->_receiver)
  {
    memset(v12, 0, sizeof(v12));
    __brc_create_section(0, (uint64_t)"-[BRCNotificationPipe(IPCs) invalidate]", 1695, v12);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v15 = v12[0];
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = v8;
      _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx invalidating %@%@", buf, 0x20u);
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    -[BRCNotificationPipe _stopWatchingItems](self, "_stopWatchingItems");
    client = self->_client;
    self->_client = 0;

    -[BRItemNotificationReceiving invalidate](self->_receiver, "invalidate");
    -[BRNotificationQueue removeAllObjects](self->_notifs, "removeAllObjects");
    receiver = self->_receiver;
    self->_receiver = 0;

    self->_hasUpdatesInFlight = 0;
    __brc_leave_section(v12);
  }
  __brc_leave_section(v13);
}

- (void)addNotification:asDead:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[NOTIF] stripped sharing info for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Update is \"Documents\", discarding: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Update is a directory, discarding %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Update is a fault, discarding %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing OUTSIDE (dead item) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing OUTSIDE (reparented) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing INSIDE (itemID match) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _watchKind & WATCH_ITEM%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.9()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing INSIDE (below a Documents/ folder) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.10()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing INSIDE (not below a Documents/ folder) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.11()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing INSIDE (below a .Trash/ folder) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing OUTSIDE (moved out library scope) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.13()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing INSIDE (parentObjectID match) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.14()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing OUTSIDE (oldParentFileObjectID match) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.16()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing INSIDE (fileObjectID match) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.18()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Update is in the trash, discarding %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:.cold.19()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Queueing INSIDE (in the scope) notification: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isInterestingUpdate:(NSObject *)a3 .cold.21(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "watchedAncestorItemGlobalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[NOTIF] Learning itemID for our ancestor: %@%@", (uint8_t *)&v6, 0x16u);

}

- (void)_isInterestingUpdate:(NSObject *)a3 .cold.22(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "watchedAncestorItemGlobalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "oldWatchedAncestorItemGlobalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = a2;
  OUTLINED_FUNCTION_8_1(&dword_230455000, a3, v8, "[NOTIF] Learning path-match for %@ (was %@)%@", (uint8_t *)&v9);

}

- (void)_isInterestingUpdate:.cold.23()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Ancestor isn't resolved yet, discarding %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_prepareForSecondGatherWithRank:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_gatherer%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_prepareForSecondGatherWithRank:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[NOTIF] doing the second phase gathering%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCNotificationPipe__prepareForSecondGatherWithRank___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[NOTIF] Finished second phase gathering%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)processUpdates:withRank:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[NOTIF] dropping all updates%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)processUpdates:(NSObject *)a3 withRank:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_1_0(&dword_230455000, a2, a3, "[NOTIF] dropping %ld updates%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_0();
}

void __84__BRCNotificationPipe___performBlockafterDBAndNotifFlush_session_description_error___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_8_1(&dword_230455000, a3, (uint64_t)a3, "[NOTIF] Waiting for notification flush for %@ in %@%@", (uint8_t *)&v5);
}

void __87__BRCNotificationPipe__performBlock_whenNotifsAreFullyFlushedInClientZone_description___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Failed to wait for faulting to complete - %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)watchScopes:trustedAppLibraryIDs:gatherReply:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] %@: Unable to resolve scopes%@");
  OUTLINED_FUNCTION_0();
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[NOTIF] Could not create RecursiveListDirectoryContentsOperation for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Waiting for group for list op %@%@");
  OUTLINED_FUNCTION_0();
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_3_134_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Finished normal gather phase for %@%@");
  OUTLINED_FUNCTION_0();
}

void __68__BRCNotificationPipe_watchScopes_trustedAppLibraryIDs_gatherReply___block_invoke_135_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Calling gather reply callback for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_watchItem:options:gatherReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Invalid notification pipe setup%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_watchItem:options:gatherReply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_listOp%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __54__BRCNotificationPipe__watchItem_options_gatherReply___block_invoke_142_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] Finished waiting on gather group for %@%@");
  OUTLINED_FUNCTION_0();
}

void __83__BRCNotificationPipe_IPCs__watchItemWithFileObjectID_options_request_gatherReply___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[NOTIF] App library %@ not installed, not waiting for gathering to finish%@");
  OUTLINED_FUNCTION_0();
}

@end
