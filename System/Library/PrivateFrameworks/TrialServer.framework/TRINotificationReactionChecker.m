@implementation TRINotificationReactionChecker

- (TRINotificationReactionChecker)initWithDateProvider:(id)a3 rolloutDatabase:(id)a4 experimentDatabase:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRINotificationReactionChecker *v12;
  TRINotificationReactionChecker *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRINotificationReactionChecker;
  v12 = -[TRINotificationReactionChecker init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dateProvider, a3);
    objc_storeStrong((id *)&v13->_rolloutDb, a4);
    objc_storeStrong((id *)&v13->_experimentDb, a5);
  }

  return v13;
}

- ($A5A652246548B43F8BC05201A1C72A70)reactionForHotfixDeployment:(id)a3 hotfixDeploymentDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  $A5A652246548B43F8BC05201A1C72A70 v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[TRINotificationReactionChecker _isOutdatedDeploymentDate:](self, "_isOutdatedDeploymentDate:", v7))
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v7;
      v9 = "Ignoring outdated notification with deployment date %@";
      v10 = v8;
      v11 = 12;
LABEL_7:
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    }
  }
  else
  {
    if (!-[TRINotificationReactionChecker _isExistingDeployment:](self, "_isExistingDeployment:", v6))
    {
      v12.var0 = 1;
      goto LABEL_10;
    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109120;
      LODWORD(v15) = objc_msgSend(v6, "deploymentId");
      v9 = "Ignoring notification with existing deploymentId %u";
      v10 = v8;
      v11 = 8;
      goto LABEL_7;
    }
  }

  v12.var0 = 0;
LABEL_10:

  return v12;
}

- (BOOL)_isOutdatedDeploymentDate:(id)a3
{
  TRIDateProviding *dateProvider;
  id v4;
  void *v5;
  uint64_t v6;

  dateProvider = self->_dateProvider;
  v4 = a3;
  -[TRIDateProviding lastFetchDateWithType:container:teamId:](dateProvider, "lastFetchDateWithType:container:teamId:", 1, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  return v6 == -1;
}

- (BOOL)_isExistingDeployment:(id)a3
{
  void *v3;
  BOOL v4;

  -[TRIRolloutDatabase recordWithDeployment:usingTransaction:](self->_rolloutDb, "recordWithDeployment:usingTransaction:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- ($A5A652246548B43F8BC05201A1C72A70)reactionForRollbackExperimentId:(id)a3
{
  id v4;
  TRIExperimentDatabase *experimentDb;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  experimentDb = self->_experimentDb;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__TRINotificationReactionChecker_reactionForRollbackExperimentId___block_invoke;
  v7[3] = &unk_1E9332ED0;
  v7[4] = &v8;
  -[TRIExperimentDatabase enumerateExperimentRecordsMatchingExperimentId:block:](experimentDb, "enumerateExperimentRecordsMatchingExperimentId:block:", v4, v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return ($A5A652246548B43F8BC05201A1C72A70)self;
}

uint64_t __66__TRINotificationReactionChecker_reactionForRollbackExperimentId___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentDb, 0);
  objc_storeStrong((id *)&self->_rolloutDb, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

@end
