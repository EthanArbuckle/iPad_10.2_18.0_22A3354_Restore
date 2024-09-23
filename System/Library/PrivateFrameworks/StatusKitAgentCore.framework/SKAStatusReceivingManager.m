@implementation SKAStatusReceivingManager

- (SKAStatusReceivingManager)initWithDatabaseManager:(id)a3 encryptionManager:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKAStatusReceivingManager *v12;
  SKAStatusReceivingManager *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *backgroundCleanupQueue;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SKAStatusReceivingManager;
  v12 = -[SKAStatusReceivingManager init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_encryptionManager, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_DEFAULT, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = dispatch_queue_create("com.apple.StatusKit.StatusReceivingManager.cleanup", v15);
    backgroundCleanupQueue = v13->_backgroundCleanupQueue;
    v13->_backgroundCleanupQueue = (OS_dispatch_queue *)v16;

  }
  return v13;
}

- (void)handleIncomingStatusData:(id)a3 onChannelIdentifier:(id)a4 dateReceived:(id)a5 dateExpired:(id)a6 serverTime:(id)a7
{
  id v11;
  __CFString *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  double v31;
  double v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSObject *WeakRetained;
  NSObject *backgroundCleanupQueue;
  NSObject *log;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  _QWORD block[4];
  __CFString *v50;
  NSObject *v51;
  id v52;
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  NSObject *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = (__CFString *)a4;
  v13 = a6;
  v14 = a7;
  v15 = (void *)-[SKADatabaseManaging newBackgroundContext](self->_databaseManager, "newBackgroundContext");
  -[SKADatabaseManaging existingChannelForSubscriptionIdentifier:databaseContext:](self->_databaseManager, "existingChannelForSubscriptionIdentifier:databaseContext:", v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v48 = v11;
    objc_msgSend(v16, "statusType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:](SKAServerBag, "statusEnabledByServerForStatusTypeIdentifier:", v18);

    +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v12;
        _os_log_impl(&dword_2188DF000, v21, OS_LOG_TYPE_DEFAULT, "Found channel matching channel identifier: %@.", buf, 0xCu);
      }

      v11 = v48;
      -[SKAStatusEncryptionManaging extractEnvelopeFromStatusEnvelopeData:](self->_encryptionManager, "extractEnvelopeFromStatusEnvelopeData:", v48);
      v22 = objc_claimAutoreleasedReturnValue();
      v21 = v22;
      if (v22)
      {
        v46 = v14;
        -[NSObject statusUniqueIdentifier](v22, "statusUniqueIdentifier");
        v44 = objc_claimAutoreleasedReturnValue();
        -[NSObject datePublished](v21, "datePublished");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject dateCreated](v21, "dateCreated");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "statusType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.offgrid.status"));

        if (v25)
        {
          +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v54 = CFSTR("com.apple.offgrid.status");
            _os_log_impl(&dword_2188DF000, v26, OS_LOG_TYPE_DEFAULT, "Status type is %@, overriding creation date to make it most recent", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDBCE60], "now");
          v27 = objc_claimAutoreleasedReturnValue();

          +[SKAServerBag statusValidityForOffGridPayload](SKAServerBag, "statusValidityForOffGridPayload");
          objc_msgSend(v47, "dateByAddingTimeInterval:");
          v28 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v27;
          v13 = (id)v28;
        }
        else
        {
          v29 = v23;
        }
        v45 = v29;
        v14 = v46;
        objc_msgSend(v29, "timeIntervalSinceDate:", v46);
        v32 = v31;
        v30 = v44;
        v11 = v48;
        if (-[NSObject length](v44, "length"))
        {
          if (v47)
          {
            if (v32 <= 300.0)
            {
              -[SKADatabaseManaging existingStatusForUniqueIdentifier:databaseContext:](self->_databaseManager, "existingStatusForUniqueIdentifier:databaseContext:", v44, v15);
              v33 = objc_claimAutoreleasedReturnValue();
              +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
              log = objc_claimAutoreleasedReturnValue();
              v34 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
              if (v33)
              {
                if (v34)
                {
                  *(_DWORD *)buf = 138412546;
                  v54 = (const __CFString *)v44;
                  v55 = 2112;
                  v56 = v33;
                  _os_log_impl(&dword_2188DF000, log, OS_LOG_TYPE_DEFAULT, "We've already received a status with this unique identifier (%@), ignoring. Existing status: %@", buf, 0x16u);
                }
              }
              else
              {
                if (v34)
                {
                  *(_DWORD *)buf = 138412546;
                  v54 = (const __CFString *)v44;
                  v55 = 2112;
                  v56 = v12;
                  _os_log_impl(&dword_2188DF000, log, OS_LOG_TYPE_DEFAULT, "Received new status %@ for channel %@", buf, 0x16u);
                }

                -[SKADatabaseManaging createStatusWithUniqueIdentifier:dateCreated:datePublished:dateReceived:dateExpired:rawData:channelIdentifier:databaseContext:](self->_databaseManager, "createStatusWithUniqueIdentifier:dateCreated:datePublished:dateReceived:dateExpired:rawData:channelIdentifier:databaseContext:", v44, v45, v47, v46, v13, v48, v12, v15);
                log = objc_claimAutoreleasedReturnValue();
                +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v54 = (const __CFString *)v44;
                  _os_log_impl(&dword_2188DF000, v35, OS_LOG_TYPE_DEFAULT, "Saved incoming status update to database with unique identifier: %@", buf, 0xCu);
                }

                if (v13
                  && (objc_msgSend(MEMORY[0x24BDBCE60], "now"),
                      v36 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v36, "timeIntervalSince1970"),
                      v38 = v37,
                      objc_msgSend(v13, "timeIntervalSince1970"),
                      v40 = v39,
                      v36,
                      v38 > v40))
                {
                  +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
                  WeakRetained = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_2188DF000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Not informing delegate of status because it has expired", buf, 2u);
                  }
                }
                else
                {
                  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                  -[NSObject statusReceivingManager:didReceiveStatusUpdate:onChannel:](WeakRetained, "statusReceivingManager:didReceiveStatusUpdate:onChannel:", self, log, v17);
                }

                objc_initWeak((id *)buf, self);
                backgroundCleanupQueue = self->_backgroundCleanupQueue;
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __110__SKAStatusReceivingManager_handleIncomingStatusData_onChannelIdentifier_dateReceived_dateExpired_serverTime___block_invoke;
                block[3] = &unk_24D977200;
                objc_copyWeak(&v52, (id *)buf);
                v50 = v12;
                v51 = v44;
                dispatch_async(backgroundCleanupQueue, block);

                objc_destroyWeak(&v52);
                objc_destroyWeak((id *)buf);
                v11 = v48;
                v14 = v46;
              }

            }
            else
            {
              +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:].cold.5();
            }
          }
          else
          {
            +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:].cold.4();
          }
        }
        else
        {
          +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:].cold.3();
        }

      }
      else
      {
        +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:].cold.2();
      }

    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:].cold.6(v17, v21);
      v11 = v48;
    }
  }
  else
  {
    +[SKAStatusReceivingManager logger](SKAStatusReceivingManager, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SKAStatusReceivingManager handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:].cold.1();
  }

}

void __110__SKAStatusReceivingManager_handleIncomingStatusData_onChannelIdentifier_dateReceived_dateExpired_serverTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "databaseManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newBackgroundContext");

  objc_msgSend(WeakRetained, "databaseManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanupOldStatusUpdatesForChannelIdentifier:excludingStatusUniqueIdentifier:databaseContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3);

}

+ (id)logger
{
  if (logger_onceToken_11 != -1)
    dispatch_once(&logger_onceToken_11, &__block_literal_global_11);
  return (id)logger__logger_11;
}

void __35__SKAStatusReceivingManager_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAStatusReceivingManager");
  v1 = (void *)logger__logger_11;
  logger__logger_11 = (uint64_t)v0;

}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManager, a3);
}

- (SKAStatusEncryptionManaging)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionManager, a3);
}

- (SKAStatusReceivingManagingDelegate)delegate
{
  return (SKAStatusReceivingManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)backgroundCleanupQueue
{
  return self->_backgroundCleanupQueue;
}

- (void)setBackgroundCleanupQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundCleanupQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundCleanupQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find channel matching incoming status update, ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not extract unencrypted envelope from incoming status update, ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not determine status unique identifier for incoming status update, ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not determine date published for incoming status update, ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleIncomingStatusData:onChannelIdentifier:dateReceived:dateExpired:serverTime:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Date created is too far in the future, ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleIncomingStatusData:(void *)a1 onChannelIdentifier:(NSObject *)a2 dateReceived:dateExpired:serverTime:.cold.6(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "statusType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2188DF000, a2, OS_LOG_TYPE_ERROR, "Status type %@ disabled by server. Dropping incoming status update", (uint8_t *)&v4, 0xCu);

}

@end
