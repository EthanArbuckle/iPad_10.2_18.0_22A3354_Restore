@implementation PLComputeCachePolicyConfiguration

- (PLComputeCachePolicyConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4;
  PLComputeCachePolicyConfiguration *v5;
  void *v6;
  uint64_t v7;
  PLComputeCachePolicyConfiguration *v8;
  id v9;
  PLComputeCachePolicyConfiguration *v10;
  PLComputeCachePolicyConfiguration *v11;
  PLComputeCachePolicyConfiguration *v12;
  PLComputeCachePolicyConfiguration *v13;
  PLComputeCachePolicyConfiguration *v14;
  _QWORD v16[4];
  PLComputeCachePolicyConfiguration *v17;
  _QWORD v18[4];
  PLComputeCachePolicyConfiguration *v19;
  _QWORD v20[4];
  PLComputeCachePolicyConfiguration *v21;
  _QWORD v22[4];
  PLComputeCachePolicyConfiguration *v23;
  _QWORD v24[4];
  PLComputeCachePolicyConfiguration *v25;
  _QWORD v26[4];
  PLComputeCachePolicyConfiguration *v27;
  _QWORD v28[4];
  PLComputeCachePolicyConfiguration *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PLComputeCachePolicyConfiguration;
  v5 = -[PLComputeCachePolicyConfiguration init](&v30, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke;
    v28[3] = &unk_1E3670580;
    v8 = v5;
    v29 = v8;
    v9 = v6;
    -[PLComputeCachePolicyConfiguration configurationValueForKey:configurationDictionary:valueBlock:](v8, "configurationValueForKey:configurationDictionary:valueBlock:", CFSTR("backupFeatureVersion"), v9, v28);
    v26[0] = v7;
    v26[1] = 3221225472;
    v26[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_2;
    v26[3] = &unk_1E3670580;
    v10 = v8;
    v27 = v10;
    -[PLComputeCachePolicyConfiguration configurationValueForKey:configurationDictionary:valueBlock:](v10, "configurationValueForKey:configurationDictionary:valueBlock:", CFSTR("restoreFeatureVersion"), v9, v26);
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_3;
    v24[3] = &unk_1E3670580;
    v11 = v10;
    v25 = v11;
    -[PLComputeCachePolicyConfiguration configurationValueForKey:configurationDictionary:valueBlock:](v11, "configurationValueForKey:configurationDictionary:valueBlock:", CFSTR("minAssetCount"), v9, v24);
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_4;
    v22[3] = &unk_1E3670580;
    v12 = v11;
    v23 = v12;
    -[PLComputeCachePolicyConfiguration configurationValueForKey:configurationDictionary:valueBlock:](v12, "configurationValueForKey:configurationDictionary:valueBlock:", CFSTR("minCloudStorageTier"), v9, v22);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_5;
    v20[3] = &unk_1E3670580;
    v13 = v12;
    v21 = v13;
    -[PLComputeCachePolicyConfiguration configurationValueForKey:configurationDictionary:valueBlock:](v13, "configurationValueForKey:configurationDictionary:valueBlock:", CFSTR("minSnapshotTimeInterval"), v9, v20);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_6;
    v18[3] = &unk_1E3670580;
    v14 = v13;
    v19 = v14;
    -[PLComputeCachePolicyConfiguration configurationValueForKey:configurationDictionary:valueBlock:](v14, "configurationValueForKey:configurationDictionary:valueBlock:", CFSTR("minExpungedAssetCount"), v9, v18);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_7;
    v16[3] = &unk_1E3670580;
    v17 = v14;
    -[PLComputeCachePolicyConfiguration configurationValueForKey:configurationDictionary:valueBlock:](v17, "configurationValueForKey:configurationDictionary:valueBlock:", CFSTR("ambientSuggestionEntryLimit"), v9, v16);

  }
  return v5;
}

- (void)configurationValueForKey:(id)a3 configurationDictionary:(id)a4 valueBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v9)
    {
      PLMigrationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138543618;
        v12 = v7;
        v13 = 2114;
        v14 = v9;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "ComputeCachePolicy: Configuration override for key %{public}@ with value %{public}@", (uint8_t *)&v11, 0x16u);
      }

    }
  }
  else
  {

    v9 = 0;
  }
  v8[2](v8, v9);

}

- (BOOL)isBackupEnabled
{
  return self->_isBackupEnabled;
}

- (BOOL)isRestoreEnabled
{
  return self->_isRestoreEnabled;
}

- (unint64_t)minAssetCount
{
  return self->_minAssetCount;
}

- (unint64_t)minCloudStorageTier
{
  return self->_minCloudStorageTier;
}

- (double)minSnapshotTimeInterval
{
  return self->_minSnapshotTimeInterval;
}

- (unint64_t)minExpungedAssetCount
{
  return self->_minExpungedAssetCount;
}

- (unint64_t)ambientSuggestionEntryLimit
{
  return self->_ambientSuggestionEntryLimit;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  BOOL v3;

  v2 = result;
  if (a2)
  {
    result = objc_msgSend(a2, "unsignedShortValue");
    v3 = (_DWORD)result == 0;
  }
  else
  {
    v3 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(v2 + 32) + 8) = v3;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2;
  BOOL v3;

  v2 = result;
  if (a2)
  {
    result = objc_msgSend(a2, "unsignedShortValue");
    v3 = (_DWORD)result == 0;
  }
  else
  {
    v3 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(v2 + 32) + 9) = v3;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    result = objc_msgSend(a2, "unsignedIntegerValue");
  else
    result = 2000;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = result;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    result = objc_msgSend(a2, "unsignedLongLongValue");
  else
    result = 10000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

unint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_5(unint64_t result, void *a2)
{
  unint64_t v2;
  double v3;

  v2 = result;
  if (a2)
  {
    result = objc_msgSend(a2, "unsignedIntegerValue");
    v3 = (double)result;
  }
  else
  {
    v3 = 1209600.0;
  }
  *(double *)(*(_QWORD *)(v2 + 32) + 32) = v3;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    result = objc_msgSend(a2, "unsignedIntegerValue");
  else
    result = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

uint64_t __69__PLComputeCachePolicyConfiguration_initWithConfigurationDictionary___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    result = objc_msgSend(a2, "unsignedIntegerValue");
  else
    result = 100;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = result;
  return result;
}

@end
