@implementation PLComputeCachePolicy

- (PLComputeCachePolicy)initWithPolicyData:(id)a3 configuration:(id)a4
{
  id v8;
  id v9;
  PLComputeCachePolicy *v10;
  PLComputeCachePolicy *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLComputeCachePolicy.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PLComputeCachePolicy;
  v10 = -[PLComputeCachePolicy init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_data, a3);
    objc_storeStrong((id *)&v11->_configuration, a4);
    -[PLComputeCachePolicy _checkDenyPolicy](v11, "_checkDenyPolicy");
    if (-[PLComputeCachePolicy snapshotAllowed](v11, "snapshotAllowed"))
      -[PLComputeCachePolicy _checkAllowPolicy](v11, "_checkAllowPolicy");
  }

  return v11;
}

- (BOOL)snapshotRequired
{
  _BOOL4 v3;

  v3 = -[PLComputeCachePolicy snapshotAllowed](self, "snapshotAllowed");
  if (v3)
    LOBYTE(v3) = self->_allowPolicy != 0;
  return v3;
}

- (BOOL)snapshotAllowed
{
  return self->_denyPolicy == 0;
}

- (void)_checkDenyPolicy
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  NSString *v9;
  NSString *reason;
  NSObject *v11;
  NSString *v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[PLComputeCachePolicy _deriveDenyPolicy](self, "_deriveDenyPolicy");
  self->_denyPolicy = v3;
  if ((unint64_t)(v3 - 1) <= 4)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    PLStringFromPLComputeCacheSnapshotDenyPolicyShort(v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = self->_denyPolicy - 1;
    if (v7 > 4)
      v8 = CFSTR("Snapshot enabled. Check allow policy");
    else
      v8 = off_1E36705C8[v7];
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Snapshot deny policy triggered. Policy: %@ (%@)"), v5, v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    reason = self->_reason;
    self->_reason = v9;

    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = self->_reason;
      *(_DWORD *)buf = 138543362;
      v14 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "ComputeCachePolicy: %{public}@", buf, 0xCu);
    }

  }
}

- (void)_checkAllowPolicy
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t allowPolicy;
  const __CFString *v8;
  const __CFString *v9;
  NSString *v10;
  NSString *reason;
  NSObject *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  uint8_t buf[4];
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = -[PLComputeCachePolicy _deriveAllowPolicy](self, "_deriveAllowPolicy");
  self->_allowPolicy = v3;
  if ((unint64_t)(v3 - 1) < 2)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    PLStringFromPLComputeCacheSnapshotAllowPolicyShort(v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    allowPolicy = self->_allowPolicy;
    v8 = CFSTR("Snapshot disabled. Snapshot is current");
    if (allowPolicy == 1)
      v8 = CFSTR("Snapshot required. Snapshot is out of date");
    if (allowPolicy == 2)
      v9 = CFSTR("Snapshot required. Snapshot has deleted asset records");
    else
      v9 = v8;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Snapshot required. Policy: %@ (%@)"), v5, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    reason = self->_reason;
    self->_reason = v10;

    PLMigrationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    v13 = self->_reason;
    *(_DWORD *)buf = 138543362;
    v24 = v13;
    goto LABEL_17;
  }
  if (v3)
    return;
  v14 = (void *)MEMORY[0x1E0CB3940];
  PLStringFromPLComputeCacheSnapshotAllowPolicyShort(0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = self->_allowPolicy;
  v18 = CFSTR("Snapshot disabled. Snapshot is current");
  if (v17 == 1)
    v18 = CFSTR("Snapshot required. Snapshot is out of date");
  if (v17 == 2)
    v19 = CFSTR("Snapshot required. Snapshot has deleted asset records");
  else
    v19 = v18;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Snapshot is current. Update not required. Policy: %@ (%@)"), v15, v19);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v21 = self->_reason;
  self->_reason = v20;

  PLMigrationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v22 = self->_reason;
    *(_DWORD *)buf = 138543362;
    v24 = v22;
LABEL_17:
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "ComputeCachePolicy: %{public}@", buf, 0xCu);
  }
LABEL_18:

}

- (int64_t)_deriveDenyPolicy
{
  void *v4;

  if (!-[PLComputeCachePolicyDataSource isEnabled](self->_data, "isEnabled"))
    return 1;
  if (!-[PLComputeCachePolicyConfiguration isBackupEnabled](self->_configuration, "isBackupEnabled"))
    return 2;
  if ((-[PLComputeCachePolicyDataSource restoreState](self->_data, "restoreState") & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 5;
  -[PLComputeCachePolicyDataSource lastSnapshotDate](self->_data, "lastSnapshotDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && !-[PLComputeCachePolicy _isAssetCountWithinPolicy](self, "_isAssetCountWithinPolicy"))
    return 3;
  if (-[PLComputeCachePolicy _isiCloudTierWithinPolicy](self, "_isiCloudTierWithinPolicy"))
    return 0;
  return 4;
}

- (int64_t)_deriveAllowPolicy
{
  if (!-[PLComputeCachePolicy _isLastSnapshotDateWithinPolicy](self, "_isLastSnapshotDateWithinPolicy"))
    return 1;
  if (-[PLComputeCachePolicyDataSource hasAtLeastExpungedAssetCount:](self->_data, "hasAtLeastExpungedAssetCount:", -[PLComputeCachePolicyConfiguration minExpungedAssetCount](self->_configuration, "minExpungedAssetCount")))
  {
    return 2;
  }
  return 0;
}

- (BOOL)_isAssetCountWithinPolicy
{
  unint64_t v3;

  v3 = -[PLComputeCachePolicyDataSource assetCount](self->_data, "assetCount");
  return v3 != 0x7FFFFFFFFFFFFFFFLL
      && v3 >= -[PLComputeCachePolicyConfiguration minAssetCount](self->_configuration, "minAssetCount");
}

- (BOOL)_isLastSnapshotDateWithinPolicy
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  BOOL v10;

  -[PLComputeCachePolicyDataSource lastSnapshotDate](self->_data, "lastSnapshotDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerForKey:", CFSTR("PLComputeCachePolicyMinSnapshotTimeInMinutes"));

    if (v8 < 1)
      -[PLComputeCachePolicyConfiguration minSnapshotTimeInterval](self->_configuration, "minSnapshotTimeInterval");
    else
      v9 = (double)(60 * v8);
    v10 = v6 < v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_isiCloudTierWithinPolicy
{
  unint64_t v3;

  v3 = -[PLComputeCachePolicyDataSource iCloudStorageSizeInBytes](self->_data, "iCloudStorageSizeInBytes");
  return v3 > -[PLComputeCachePolicyConfiguration minCloudStorageTier](self->_configuration, "minCloudStorageTier");
}

- (NSString)reason
{
  return self->_reason;
}

- (PLComputeCachePolicyConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)denyPolicy
{
  return self->_denyPolicy;
}

- (int64_t)allowPolicy
{
  return self->_allowPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
