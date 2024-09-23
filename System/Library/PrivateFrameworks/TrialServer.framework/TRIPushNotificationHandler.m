@implementation TRIPushNotificationHandler

- (TRIPushNotificationHandler)initWithNotificationChecker:(id)a3 hotfixScheduler:(id)a4 rollbackScheduler:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRIPushNotificationHandler *v12;
  TRIPushNotificationHandler *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIPushNotificationHandler;
  v12 = -[TRIPushNotificationHandler init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationChecker, a3);
    objc_storeStrong((id *)&v13->_hotfixScheduler, a4);
    objc_storeStrong((id *)&v13->_rollbackScheduler, a5);
  }

  return v13;
}

- (void)didReceivePushNotification:(id)a3
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPushNotificationHandler.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification"));

  }
  v6 = objc_msgSend(v5, "notificationOneOfCase");
  switch(v6)
  {
    case 2:
      objc_msgSend(v5, "experimentNotification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPushNotificationHandler _handleRollbackNotification:](self, "_handleRollbackNotification:", v8);
LABEL_11:

      break;
    case 1:
      objc_msgSend(v5, "rolloutNotification");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPushNotificationHandler _handleDeploymentNotification:](self, "_handleDeploymentNotification:", v8);
      goto LABEL_11;
    case 0:
      TRILogCategory_Server();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v5;
        _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Got push notification without content: %@", buf, 0xCu);
      }

      break;
  }

}

- (void)_handleDeploymentNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[TRIPushNotificationHandler _isMissingNotificationFields:](self, "_isMissingNotificationFields:", v4))
  {
    v5 = (void *)MEMORY[0x1E0DC0B60];
    objc_msgSend(v4, "rolloutId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deploymentWithRolloutId:deploymentId:", v6, objc_msgSend(v4, "deploymentId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "deploymentDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRIPushNotificationHandler notificationChecker](self, "notificationChecker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "reactionForHotfixDeployment:hotfixDeploymentDate:", v7, v9);

    if (v11)
    {
      objc_msgSend(v4, "notificationProcessingPolicy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "assetDownloadPolicy");
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543618;
        v16 = v7;
        v17 = 1026;
        v18 = v13 == 2;
        _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Scheduling Hotfix for deployment %{public}@ (any network + battery allowed: %{public}d)", (uint8_t *)&v15, 0x12u);
      }

      -[TRIHotfixRolloutTargetingSchedulerProtocol scheduleHotfixForDeployment:allowingAnyNetworkingAndBatteryUsage:runDelay:](self->_hotfixScheduler, "scheduleHotfixForDeployment:allowingAnyNetworkingAndBatteryUsage:runDelay:", v7, v13 == 2, (double)arc4random_uniform(objc_msgSend(v12, "delaySeconds")));
    }

  }
}

- (BOOL)_isMissingNotificationFields:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  char v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  objc_class *v21;
  NSObject *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  objc_class *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "hasNotificationProcessingPolicy") & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      v12 = 1;
      goto LABEL_28;
    }
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v15;
    v16 = "Cannot decode message of type %@ with missing field: notificationProcessingPolicy";
LABEL_14:
    _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v31, 0xCu);

    goto LABEL_27;
  }
  objc_msgSend(v3, "notificationProcessingPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasDelaySeconds");

  if ((v5 & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    objc_msgSend(v3, "notificationProcessingPolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v19;
    v20 = "Cannot decode message of type %@ with missing field: delaySeconds";
LABEL_19:
    _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v31, 0xCu);

    goto LABEL_27;
  }
  objc_msgSend(v3, "notificationProcessingPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasAssetDownloadPolicy");

  if ((v7 & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    objc_msgSend(v3, "notificationProcessingPolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v19;
    v20 = "Cannot decode message of type %@ with missing field: assetDownloadPolicy";
    goto LABEL_19;
  }
  if ((objc_msgSend(v3, "hasRolloutId") & 1) == 0)
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412290;
      v32 = v27;
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", (uint8_t *)&v31, 0xCu);

    }
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v15;
    v16 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_14;
  }
  objc_msgSend(v3, "rolloutId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v15;
    v16 = "Cannot decode message of type %@ with field of length 0: rolloutId";
    goto LABEL_14;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v15;
    v16 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_14;
  }
  v10 = objc_msgSend(v3, "hasDeploymentDate");
  if ((v10 & 1) == 0)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412290;
      v32 = v30;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: deploymentDate", (uint8_t *)&v31, 0xCu);

    }
  }
  v12 = v10 ^ 1;
LABEL_28:

  return v12;
}

- (void)_handleRollbackNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  NSObject *v14;
  const char *v15;
  objc_class *v16;
  NSObject *v17;
  objc_class *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  NSObject *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasExperimentId") & 1) != 0)
  {
    objc_msgSend(v4, "experimentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      objc_msgSend(v4, "experimentId");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "deploymentIdArray_Count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[TRINotificationReactionCheckerProtocol reactionForRollbackExperimentId:](self->_notificationChecker, "reactionForRollbackExperimentId:", v7))
      {
        objc_msgSend(v4, "deploymentIdArray");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __58__TRIPushNotificationHandler__handleRollbackNotification___block_invoke;
        v19[3] = &unk_1E93306F0;
        v10 = v8;
        v20 = v10;
        objc_msgSend(v9, "enumerateValuesWithBlock:", v19);

        TRILogCategory_Server();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v22 = v7;
          v23 = 2114;
          v24 = v10;
          _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Scheduling Urgent Rollback for experiment: %{public}@ deployments: %{public}@", buf, 0x16u);
        }

        -[TRIUrgentRollbackSchedulerProtocol scheduleUrgentRollbackForExperiment:deploymentIds:](self->_rollbackScheduler, "scheduleUrgentRollbackForExperiment:deploymentIds:", v7, v10);
      }

      goto LABEL_13;
    }
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v14 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    v15 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_15:
    _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_13;
  }
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v17;
    _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);

  }
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    v15 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_15;
  }
LABEL_13:

}

void __58__TRIPushNotificationHandler__handleRollbackNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (TRINotificationReactionCheckerProtocol)notificationChecker
{
  return self->_notificationChecker;
}

- (TRIHotfixRolloutTargetingSchedulerProtocol)hotfixScheduler
{
  return self->_hotfixScheduler;
}

- (TRIUrgentRollbackSchedulerProtocol)rollbackScheduler
{
  return self->_rollbackScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollbackScheduler, 0);
  objc_storeStrong((id *)&self->_hotfixScheduler, 0);
  objc_storeStrong((id *)&self->_notificationChecker, 0);
}

@end
