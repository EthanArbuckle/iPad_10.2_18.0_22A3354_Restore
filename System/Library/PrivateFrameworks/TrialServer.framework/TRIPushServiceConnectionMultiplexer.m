@implementation TRIPushServiceConnectionMultiplexer

- (TRIPushServiceConnectionMultiplexer)initWithServerContext:(id)a3 taskQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  TRINotificationReactionChecker *v10;
  void *v11;
  void *v12;
  TRINotificationReactionChecker *v13;
  TRIHotfixRolloutTargetingScheduler *v14;
  TRIUrgentRollbackScheduler *v15;
  void *v16;
  TRIUrgentRollbackScheduler *v17;
  TRIPushNotificationHandler *v18;
  void *v19;
  TRIPushServiceConnectionMultiplexer *v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "keyValueStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [TRINotificationReactionChecker alloc];
  objc_msgSend(v7, "rolloutDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "experimentDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TRINotificationReactionChecker initWithDateProvider:rolloutDatabase:experimentDatabase:](v10, "initWithDateProvider:rolloutDatabase:experimentDatabase:", v9, v11, v12);

  v14 = -[TRIHotfixRolloutTargetingScheduler initWithTaskQueue:]([TRIHotfixRolloutTargetingScheduler alloc], "initWithTaskQueue:", v6);
  v15 = [TRIUrgentRollbackScheduler alloc];
  objc_msgSend(v7, "experimentDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[TRIUrgentRollbackScheduler initWithExperimentDatabase:taskQueue:](v15, "initWithExperimentDatabase:taskQueue:", v16, v6);

  v18 = -[TRIPushNotificationHandler initWithNotificationChecker:hotfixScheduler:rollbackScheduler:]([TRIPushNotificationHandler alloc], "initWithNotificationChecker:hotfixScheduler:rollbackScheduler:", v13, v14, v17);
  v19 = (void *)objc_opt_new();
  v20 = -[TRIPushServiceConnectionMultiplexer initWithConnectionCreator:connectionDelegate:serverContext:](self, "initWithConnectionCreator:connectionDelegate:serverContext:", v19, v18, v7);

  return v20;
}

- (TRIPushServiceConnectionMultiplexer)initWithConnectionCreator:(id)a3 connectionDelegate:(id)a4 serverContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRIPushServiceConnectionMultiplexer *v12;
  TRIPushServiceConnectionMultiplexer *v13;
  uint64_t v14;
  TRIPushServiceChannelSubscribing *currentConnection;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TRIPushServiceConnectionMultiplexer;
  v12 = -[TRIPushServiceConnectionMultiplexer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connectionCreator, a3);
    objc_storeStrong((id *)&v13->_delegate, a4);
    objc_msgSend(v9, "connectionWithDelegate:environment:", v10, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    currentConnection = v13->_currentConnection;
    v13->_currentConnection = (TRIPushServiceChannelSubscribing *)v14;

    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

- (BOOL)_isTestingIdentifier:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("TRI-TEST-"));
}

- (void)_logFaultIfNotTestingIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[TRIPushServiceConnectionMultiplexer _isTestingIdentifier:](self, "_isTestingIdentifier:", v4))
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Failed to create channel id for identifier %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)subscribeForRolloutDeployment:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0DC09C0], "currentEnvironment");
  objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "populationType");

  if (v7 == 3 && v5 == 3)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Skipping subscribing to cloud channel for rollout deployment: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    -[TRIPushServiceConnectionMultiplexer _channelIdFromRolloutDeployment:](self, "_channelIdFromRolloutDeployment:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[TRIPushServiceConnectionMultiplexer currentConnection](self, "currentConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subscribeToChannel:", v9);
    }
    else
    {
      objc_msgSend(v4, "rolloutId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPushServiceConnectionMultiplexer _logFaultIfNotTestingIdentifier:](self, "_logFaultIfNotTestingIdentifier:", v10);
    }

  }
}

- (void)subscribeForExperimentId:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TRIPushServiceConnectionMultiplexer _channelIdFromExperimentId:](self, "_channelIdFromExperimentId:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TRIPushServiceConnectionMultiplexer currentConnection](self, "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscribeToChannel:", v4);

  }
  else
  {
    -[TRIPushServiceConnectionMultiplexer _logFaultIfNotTestingIdentifier:](self, "_logFaultIfNotTestingIdentifier:", v6);
  }

}

- (void)unsubscribeForExperimentId:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TRIPushServiceConnectionMultiplexer _channelIdFromExperimentId:](self, "_channelIdFromExperimentId:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TRIPushServiceConnectionMultiplexer currentConnection](self, "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unsubscribeFromChannel:", v4);

  }
  else
  {
    -[TRIPushServiceConnectionMultiplexer _logFaultIfNotTestingIdentifier:](self, "_logFaultIfNotTestingIdentifier:", v6);
  }

}

- (id)_channelIdFromRolloutDeployment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  TRIPushChannelId *v10;
  TRIPushChannelId *v11;
  void *v12;
  void *v13;
  void *v14;
  TRIPushChannelId *v15;
  void *v16;

  v4 = a3;
  -[TRIServerContext rolloutDatabase](self->_context, "rolloutDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordWithDeployment:usingTransaction:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "artifact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rollout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasChannelId");

  v10 = [TRIPushChannelId alloc];
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v6, "artifact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rollout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "channelId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[TRIPushChannelId initWithPushChannelId:](v11, "initWithPushChannelId:", v14);

    if (!v15)
      goto LABEL_5;
  }
  else
  {
    v15 = -[TRIPushChannelId initWithRolloutDeployment:](v10, "initWithRolloutDeployment:", v4);
    if (!v15)
    {
LABEL_5:
      objc_msgSend(v4, "rolloutId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPushServiceConnectionMultiplexer _logFaultIfNotTestingIdentifier:](self, "_logFaultIfNotTestingIdentifier:", v16);

    }
  }

  return v15;
}

- (id)_channelIdFromExperimentId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  TRIPushChannelId *v10;
  void *v11;
  void *v12;
  void *v13;
  TRIPushChannelId *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__48;
  v21 = __Block_byref_object_dispose__48;
  v22 = 0;
  -[TRIServerContext experimentDatabase](self->_context, "experimentDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__TRIPushServiceConnectionMultiplexer__channelIdFromExperimentId___block_invoke;
  v16[3] = &unk_1E9332ED0;
  v16[4] = &v17;
  objc_msgSend(v5, "enumerateExperimentRecordsMatchingExperimentId:block:", v4, v16);

  v6 = (void *)v18[5];
  if (v6
    && (objc_msgSend(v6, "artifact"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "experiment"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hasChannelId"),
        v8,
        v7,
        v9))
  {
    v10 = [TRIPushChannelId alloc];
    objc_msgSend((id)v18[5], "artifact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "experiment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "channelId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TRIPushChannelId initWithPushChannelId:](v10, "initWithPushChannelId:", v13);

    if (!v14)
      goto LABEL_6;
  }
  else
  {
    v14 = -[TRIPushChannelId initWithExperimentId:]([TRIPushChannelId alloc], "initWithExperimentId:", v4);
    if (!v14)
LABEL_6:
      -[TRIPushServiceConnectionMultiplexer _logFaultIfNotTestingIdentifier:](self, "_logFaultIfNotTestingIdentifier:", v4);
  }
  _Block_object_dispose(&v17, 8);

  return v14;
}

void __66__TRIPushServiceConnectionMultiplexer__channelIdFromExperimentId___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "status") == 1)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

- (id)_expectedChannelIdsForRolloutDeployments:(id)a3 experimentIds:(id)a4 maxChannelsAllowed:(unint64_t)a5
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v8 = MEMORY[0x1E0C809B0];
  v24 = *MEMORY[0x1E0C80C00];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __113__TRIPushServiceConnectionMultiplexer__expectedChannelIdsForRolloutDeployments_experimentIds_maxChannelsAllowed___block_invoke;
  v19[3] = &unk_1E9335F88;
  v19[4] = self;
  v9 = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __113__TRIPushServiceConnectionMultiplexer__expectedChannelIdsForRolloutDeployments_experimentIds_maxChannelsAllowed___block_invoke_2;
  v18[3] = &unk_1E9335FB0;
  v18[4] = self;
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") > a5)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134218240;
      v21 = v14;
      v22 = 2048;
      v23 = a5;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Number of expected channels (%tu) exceeded the max channels allowed (%tu)", buf, 0x16u);
    }

    objc_msgSend(v12, "subarrayWithRange:", 0, a5);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);

  return v16;
}

id __113__TRIPushServiceConnectionMultiplexer__expectedChannelIdsForRolloutDeployments_experimentIds_maxChannelsAllowed___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_channelIdFromRolloutDeployment:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __113__TRIPushServiceConnectionMultiplexer__expectedChannelIdsForRolloutDeployments_experimentIds_maxChannelsAllowed___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_channelIdFromExperimentId:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)ensureSubscriptionsExistOnlyForRolloutDeployments:(id)a3 experimentIds:(id)a4 maxChannelsAllowed:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  TRIPushChannelId *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[TRIPushServiceConnectionMultiplexer currentConnection](self, "currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscribedChannelIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TRIPushServiceConnectionMultiplexer _expectedChannelIdsForRolloutDeployments:experimentIds:maxChannelsAllowed:](self, "_expectedChannelIdsForRolloutDeployments:experimentIds:maxChannelsAllowed:", v8, v9, a5);
    v12 = objc_claimAutoreleasedReturnValue();
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v33 = objc_msgSend(v8, "count");
      v34 = 2048;
      v35 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Keeping channels for %tu rollouts + %tu experiments", buf, 0x16u);
    }
    v25 = v9;
    v26 = v8;

    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v11, "count");
      v16 = -[NSObject count](v12, "count");
      *(_DWORD *)buf = 134218240;
      v33 = v15;
      v34 = 2048;
      v35 = v16;
      _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Reconciling %tu actual subscriptions with %tu expected subscriptions", buf, 0x16u);
    }

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v11);
    objc_msgSend(v17, "minusSet:", v12);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = -[TRIPushChannelId initWithPushChannelId:]([TRIPushChannelId alloc], "initWithPushChannelId:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22));
          if (v23)
          {
            -[TRIPushServiceConnectionMultiplexer currentConnection](self, "currentConnection");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "unsubscribeFromChannel:", v23);

          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }

    v9 = v25;
    v8 = v26;
  }
  else
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Couldn't resolve subscriptions since channel list is nil", buf, 2u);
    }
  }

}

- (void)switchToEnvironment:(unsigned __int8)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPushServiceConnectionMultiplexer.m"), 189, CFSTR("Not implemented yet"));

}

- (TRIPushServiceConnectionCreating)connectionCreator
{
  return self->_connectionCreator;
}

- (TRIPushServiceChannelSubscribing)currentConnection
{
  return self->_currentConnection;
}

- (TRIPushServiceConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong((id *)&self->_connectionCreator, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
