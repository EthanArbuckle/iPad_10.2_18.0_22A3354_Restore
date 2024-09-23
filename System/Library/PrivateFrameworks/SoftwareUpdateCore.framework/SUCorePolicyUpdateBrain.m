@implementation SUCorePolicyUpdateBrain

- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6
{
  SUCorePolicyUpdateBrain *v6;
  SUCorePolicyUpdateBrain *v7;
  NSNumber *compatibilityVersion;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUCorePolicyUpdateBrain;
  v6 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:](&v10, sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    compatibilityVersion = v6->_compatibilityVersion;
    v6->_compatibilityVersion = 0;

  }
  return v7;
}

- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5
{
  SUCorePolicyUpdateBrain *v5;
  SUCorePolicyUpdateBrain *v6;
  NSNumber *compatibilityVersion;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyUpdateBrain;
  v5 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:](&v9, sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingExtensions_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = 0;

  }
  return v6;
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return -[SUCorePolicyUpdateBrain constructSoftwareUpdateMAAssetQueryWithPurpose:](self, "constructSoftwareUpdateMAAssetQueryWithPurpose:", 0);
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  SUCorePolicyUpdateBrain *v14;
  objc_super v16;
  uint8_t buf[4];
  SUCorePolicyUpdateBrain *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DA8960];
  v5 = a3;
  objc_msgSend(v4, "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] constructSoftwareUpdateMAAssetQuery for policy: %@", buf, 0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)SUCorePolicyUpdateBrain;
  -[SUCorePolicy constructSoftwareUpdateMAAssetQueryWithPurpose:](&v16, sel_constructSoftwareUpdateMAAssetQueryWithPurpose_, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addKeyValuePair:with:", CFSTR("_CompatibilityVersion"), v11);

  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
    v14 = (SUCorePolicyUpdateBrain *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] querying SU metadata: compatibilityVersion=%{public}@", buf, 0xCu);

  }
  return v8;
}

- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  SUCorePolicyUpdateBrain *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  id *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  SUCorePolicyUpdateBrain *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = self;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] selectSoftwareUpdatePrimaryAsset:secondaryAsset:fromAssetQuery for policy: %@", buf, 0xCu);
  }

  if (a3)
  {
    objc_msgSend(v7, "SUCoreBorder_results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        v15 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v52 = (SUCorePolicyUpdateBrain *)v15;
        _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] %lu SU query results (before filtering)", buf, 0xCu);
      }
      v45 = a3;
      v46 = v7;

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[SUCorePolicy policyExtensions](self, "policyExtensions");
      v13 = objc_claimAutoreleasedReturnValue();
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v48;
        while (2)
        {
          v19 = 0;
          v20 = v10;
          do
          {
            if (*(_QWORD *)v48 != v18)
              objc_enumerationMutation(v13);
            v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v19);
            objc_msgSend(v21, "filterSoftwareUpdateAssetArray:", v20);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "oslog");
            v23 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = objc_msgSend(v10, "count");
              objc_msgSend(v21, "extensionName");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v52 = (SUCorePolicyUpdateBrain *)v24;
              v53 = 2114;
              v54 = v25;
              _os_log_impl(&dword_1DDFDD000, v23, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] %lu assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);

            }
            if (!objc_msgSend(v10, "count"))
            {
              objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "oslog");
              v44 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1DDFDD000, v44, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] 0 assets found, stopping filtering early", buf, 2u);
              }

              v7 = v46;
              goto LABEL_39;
            }
            ++v19;
            v20 = v10;
          }
          while (v17 != v19);
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v17)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "oslog");
      v27 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v52 = (SUCorePolicyUpdateBrain *)v28;
        _os_log_impl(&dword_1DDFDD000, v27, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] %lu SU query results (before sorting on mastered version)", buf, 0xCu);
      }

      objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_1);
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject lastObject](v13, "lastObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "attributes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "safeStringForKey:", CFSTR("_MasteredVersion"));
      v31 = (SUCorePolicyUpdateBrain *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "oslog");
      v33 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v31;
        _os_log_impl(&dword_1DDFDD000, v33, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] found highestMasteredVersion = %{public}@", buf, 0xCu);
      }

      v34 = -[NSObject count](v13, "count");
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "oslog");
      v36 = objc_claimAutoreleasedReturnValue();

      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        v7 = v46;
        if (v37)
        {
          v38 = -[NSObject count](v13, "count");
          *(_DWORD *)buf = 134217984;
          v52 = (SUCorePolicyUpdateBrain *)v38;
          _os_log_impl(&dword_1DDFDD000, v36, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] %ld assets found", buf, 0xCu);
        }

        if ((unint64_t)-[NSObject count](v13, "count") >= 2)
        {
          objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("selectSoftwareUpdatePrimaryAsset found %lu assets when 1 was expected"), -[NSObject count](v13, "count"));
          objc_msgSend(v39, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY_UPDATE_BRAIN] SELECT_UPDATE_ASSET"), v40, 8409, 0);

          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "oslog");
          v42 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v52 = v31;
            _os_log_impl(&dword_1DDFDD000, v42, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] taking the last asset in the asset array, which is the highest mastered version (%{public}@)", buf, 0xCu);
          }

        }
        -[NSObject lastObject](v13, "lastObject");
        *v45 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = v46;
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DDFDD000, v36, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] 0 assets found", buf, 2u);
        }

      }
    }
    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] 0 SU query results (before filtering)", buf, 2u);
    }
LABEL_39:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackError:forReason:withResult:withError:", CFSTR("[POLICY_UPDATE_BRAIN] SELECT_UPDATE_ASSET"), CFSTR("selectSoftwareUpdatePrimaryAsset called with unexpected nil primaryAsset param"), 8102, 0);
  }

}

uint64_t __90__SUCorePolicyUpdateBrain_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("_MasteredVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeStringForKey:", CFSTR("_MasteredVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:options:", v8, 64);

  return v9;
}

- (SUCorePolicyUpdateBrain)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyUpdateBrain *v5;
  uint64_t v6;
  NSNumber *compatibilityVersion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyUpdateBrain;
  v5 = -[SUCorePolicy initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_CompatibilityVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUCorePolicyUpdateBrain;
  v4 = a3;
  -[SUCorePolicy encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_CompatibilityVersion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyUpdateBrain *v4;
  SUCorePolicyUpdateBrain *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = (SUCorePolicyUpdateBrain *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v11.receiver = self;
      v11.super_class = (Class)SUCorePolicyUpdateBrain;
      if (-[SUCorePolicy isEqual:](&v11, sel_isEqual_, v5))
      {
        v6 = (void *)MEMORY[0x1E0DA8920];
        -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicyUpdateBrain compatibilityVersion](v5, "compatibilityVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v6, "numberIsEqual:to:", v7, v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyUpdateBrain;
  v5 = -[SUCorePolicy copyWithZone:](&v9, sel_copyWithZone_);
  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setCompatibilityVersion:", v7);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicyUpdateBrain;
  -[SUCorePolicy description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyUpdateBrain(compatibilityVersion:%@|super:%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyUpdateBrain;
  -[SUCorePolicy summary](&v9, sel_summary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("|compatibilityVersion=%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  if ((objc_msgSend(v3, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("|"));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
}

@end
