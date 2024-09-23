@implementation WBSCloudBookmarksMigrationCoordinator

- (void)setKeyActionsLogger:(id)a3
{
  objc_storeStrong((id *)&self->_keyActionsLogger, a3);
}

uint64_t __61__WBSCloudBookmarksMigrationCoordinator_setMigrationEnabled___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 40))
  {
    *(_BYTE *)(v2 + 40) = v1;
    result = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(result + 40))
    {
      if (*(_QWORD *)(result + 32) == 2)
        return objc_msgSend((id)result, "startCoordinatingMigration");
    }
  }
  return result;
}

void __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[6];

  v6 = a4;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_cold_1(v7, v6);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 16);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_10;
    v10[3] = &unk_1E4B2A910;
    v10[4] = v8;
    v10[5] = a2;
    dispatch_async(v9, v10);
  }

}

void __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v3, v5, "Error fetching remote migration state: %{public}@", (uint8_t *)&v6);

}

- (void)_determineCourseOfActionFromSyncAgentMigrationState
{
  NSObject *v3;
  id WeakRetained;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Requesting local migration state from data provider", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_localDataProvider);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromSyncAgentMigrationState__block_invoke;
  v5[3] = &unk_1E4B2A938;
  v5[4] = self;
  objc_msgSend(WeakRetained, "getLocalMigrationStateForMigrationCoordinator:completionHandler:", self, v5);

}

- (void)startCoordinatingMigration
{
  NSObject *v3;
  NSObject *v4;
  NSObject *processingQueue;
  _QWORD block[5];
  os_activity_scope_state_s buf;

  v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.opaque[0]) = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Starting migration coordination", (uint8_t *)&buf, 2u);
  }
  v4 = _os_activity_create(&dword_1A3D90000, "Start coordinating migration in UI process", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v4, &buf);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSCloudBookmarksMigrationCoordinator_startCoordinatingMigration__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_async(processingQueue, block);
  os_activity_scope_leave(&buf);

}

- (void)_determineCourseOfActionFromRemoteMigrationState
{
  NSObject *v3;
  WBSSafariBookmarksSyncAgentProtocol *syncAgent;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Requesting remote migration state from sync agent", buf, 2u);
  }
  syncAgent = self->_syncAgent;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke;
  v5[3] = &unk_1E4B2A960;
  v5[4] = self;
  -[WBSSafariBookmarksSyncAgentProtocol fetchRemoteMigrationStateWithCompletionHandler:](syncAgent, "fetchRemoteMigrationStateWithCompletionHandler:", v5);
}

void __92__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromSyncAgentMigrationState__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  const __CFString *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];
  uint8_t v9[16];

  switch(*(_QWORD *)(a1 + 40))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      objc_msgSend(*(id *)(a1 + 32), "_logKeyAction:", CFSTR("Could not open the database to check the state; do not migrate"));
      break;
    case 0:
      v2 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, "Sync agent is idle; consulting remote migration state to determine what to do",
          buf,
          2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_determineCourseOfActionFromRemoteMigrationState");
      v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Notifying the agent to periodically check the remote migration state", v7, 2u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "observeRemoteMigrationStateForSecondaryMigration");
      break;
    case 1:
      v4 = *(void **)(a1 + 32);
      v5 = CFSTR("Resuming migration because sync agent claims we are already responsible for migration");
      goto LABEL_10;
    case 2:
      v4 = *(void **)(a1 + 32);
      v5 = CFSTR("Trying to resume local-only local migration");
LABEL_10:
      objc_msgSend(v4, "_logKeyAction:", v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "beginMigrationFromDAV");
      break;
    case 3:
      v6 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_DEFAULT, "Not migrating because sync agent claims migration is already finished", v9, 2u);
      }
      break;
    default:
      return;
  }
}

uint64_t __67__WBSCloudBookmarksMigrationCoordinator_startCoordinatingMigration__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[40])
    return objc_msgSend(v2, "_determineCourseOfActionFromSyncAgentMigrationState");
  result = objc_msgSend(v2, "_logKeyAction:", CFSTR("Not migrating because migration is disabled"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 2;
  return result;
}

void __92__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromSyncAgentMigrationState__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromSyncAgentMigrationState__block_invoke_2;
  v4[3] = &unk_1E4B2A910;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

- (void)setMigrationEnabled:(BOOL)a3
{
  NSObject *processingQueue;
  _QWORD v4[5];
  BOOL v5;

  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__WBSCloudBookmarksMigrationCoordinator_setMigrationEnabled___block_invoke;
  v4[3] = &unk_1E4B2A8E8;
  v5 = a3;
  v4[4] = self;
  dispatch_async(processingQueue, v4);
}

- (WBSCloudBookmarksMigrationCoordinator)initWithSyncAgent:(id)a3 localDataProvider:(id)a4
{
  id v7;
  id v8;
  WBSCloudBookmarksMigrationCoordinator *v9;
  WBSCloudBookmarksMigrationCoordinator *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *processingQueue;
  WBSCloudBookmarksMigrationCoordinator *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSCloudBookmarksMigrationCoordinator;
  v9 = -[WBSCloudBookmarksMigrationCoordinator init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_syncAgent, a3);
    objc_storeWeak((id *)&v10->_localDataProvider, v8);
    v11 = dispatch_queue_create("com.apple.SafariShared.WBSCloudBookmarksMigrationCoordinatorProcessingQueue", 0);
    processingQueue = v10->_processingQueue;
    v10->_processingQueue = (OS_dispatch_queue *)v11;

    v10->_migrationEnabled = 1;
    v13 = v10;
  }

  return v10;
}

- (WBSCloudBookmarksMigrationCoordinator)init
{

  return 0;
}

- (WBSSafariBookmarksSyncAgentProtocol)syncAgent
{
  NSObject *processingQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__WBSCloudBookmarksMigrationCoordinator_syncAgent__block_invoke;
  v5[3] = &unk_1E4B2A8C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WBSSafariBookmarksSyncAgentProtocol *)v3;
}

void __50__WBSCloudBookmarksMigrationCoordinator_syncAgent__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)isMigrationEnabled
{
  NSObject *processingQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__WBSCloudBookmarksMigrationCoordinator_isMigrationEnabled__block_invoke;
  v5[3] = &unk_1E4B2A8C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processingQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__WBSCloudBookmarksMigrationCoordinator_isMigrationEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (void)_logKeyAction:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[WBSLogger logMessage:](self->_keyActionsLogger, "logMessage:", v4);

}

- (void)_logErrorAsKeyAction:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[WBSCloudBookmarksMigrationCoordinator _logErrorAsKeyAction:].cold.1((uint64_t)v4, v5, v6);
  -[WBSLogger logMessage:](self->_keyActionsLogger, "logMessage:", v4);

}

void __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  switch(*(_QWORD *)(a1 + 40))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      v2 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_10_cold_1(v2);
      break;
    case 0:
      v3 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Remote migration state indicates migration has not happened yet", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_beginMigrationIfPossible");
      break;
    case 1:
      v4 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_DEFAULT, "Remote migration state indicates someone else is migrating", v5, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_considerOverridingOtherMigratingDevice");
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_logKeyAction:", CFSTR("Remote migration state indicates migration is done; triggering local migration"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "beginMigrationFromDAV");
      break;
    default:
      return;
  }
}

- (void)_considerOverridingOtherMigratingDevice
{
  -[WBSSafariBookmarksSyncAgentProtocol beginMigrationFromDAV](self->_syncAgent, "beginMigrationFromDAV");
}

- (void)_beginMigrationIfPossible
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  NSObject *v5;
  NSObject *v7;
  _BOOL4 migrationEnabled;
  NSObject *v9;
  _BOOL4 v10;
  __int16 v11;
  uint8_t v12[16];
  __int16 v13;
  uint8_t buf[16];

  if (self->_didDetermineReadyToMigrate)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      return;
    v11 = 0;
    v3 = "Not doing anything since there was no change in migration readiness";
    v4 = (uint8_t *)&v11;
    v5 = v2;
    goto LABEL_4;
  }
  self->_didDetermineReadyToMigrate = 1;
  v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_DEFAULT, "Decided migration is possible", buf, 2u);
  }
  migrationEnabled = self->_migrationEnabled;
  v9 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (migrationEnabled)
  {
    if (v10)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_DEFAULT, "Requesting migration from sync agent", v12, 2u);
    }
    -[WBSSafariBookmarksSyncAgentProtocol beginMigrationFromDAV](self->_syncAgent, "beginMigrationFromDAV");
  }
  else if (v10)
  {
    v13 = 0;
    v3 = "Not migrating since migration has been disabled";
    v4 = (uint8_t *)&v13;
    v5 = v9;
LABEL_4:
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
  }
}

- (WBSCloudBookmarksMigrationCoordinatorLocalDataProvider)localDataProvider
{
  return (WBSCloudBookmarksMigrationCoordinatorLocalDataProvider *)objc_loadWeakRetained((id *)&self->_localDataProvider);
}

- (WBSLogger)keyActionsLogger
{
  return self->_keyActionsLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyActionsLogger, 0);
  objc_destroyWeak((id *)&self->_localDataProvider);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_syncAgent, 0);
}

- (void)_logErrorAsKeyAction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "%{public}@", (uint8_t *)&v3);
}

void __89__WBSCloudBookmarksMigrationCoordinator__determineCourseOfActionFromRemoteMigrationState__block_invoke_10_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Server is in an invalid migration state; not doing anything",
    v1,
    2u);
}

@end
