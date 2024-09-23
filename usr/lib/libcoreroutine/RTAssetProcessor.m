@implementation RTAssetProcessor

- (RTAssetProcessor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTAssetProcessor)initWithDefaultsManager:(id)a3
{
  id v5;
  RTAssetProcessor *v6;
  RTAssetProcessor *v7;
  RTAssetProcessor *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTAssetProcessor;
    v6 = -[RTAssetProcessor init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_defaultsManager, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTAssetProcessor initWithDefaultsManager:]";
      v14 = 1024;
      v15 = 39;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)processAssetsAtPath:(id)a3 intoPath:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  RTAssetProcessor *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t i;
  const char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  BOOL v42;
  void *v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id obj;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[2];
  _QWORD v76[2];
  uint8_t v77[128];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;
  const __CFString *v84;
  uint64_t v85;
  _QWORD v86[4];

  v86[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "fileExistsAtPath:", v7) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isReadableFileAtPath:", v7);

        if ((v12 & 1) != 0)
        {
          -[RTAssetProcessor defaultsManager](self, "defaultsManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", CFSTR("RTDefaultsABTestDeviceSeed"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = v9;
          if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v15 = self;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityAsset);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "Generating new device seed.", buf, 2u);
            }

            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "UUIDString");
            v29 = objc_claimAutoreleasedReturnValue();

            v15 = self;
            -[RTAssetProcessor defaultsManager](self, "defaultsManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKey:", v29, CFSTR("RTDefaultsABTestDeviceSeed"));

            v14 = (void *)v29;
          }
          v55 = v7;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v7, v53);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTAssetProcessor _objectForKey:expectedClass:inDictionary:](v15, "_objectForKey:expectedClass:inDictionary:", CFSTR("ABTestOverrides"), objc_opt_class(), v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_opt_new();
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          obj = v32;
          v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
          if (v61)
          {
            v60 = *(_QWORD *)v72;
            v56 = v33;
            v57 = v14;
            do
            {
              for (i = 0; i != v61; ++i)
              {
                if (*(_QWORD *)v72 != v60)
                  objc_enumerationMutation(obj);
                v35 = *(const char **)(*((_QWORD *)&v71 + 1) + 8 * i);
                -[RTAssetProcessor _objectForKey:expectedClass:inDictionary:](v15, "_objectForKey:expectedClass:inDictionary:", CFSTR("SeedId"), objc_opt_class(), v35);
                v36 = objc_claimAutoreleasedReturnValue();
                -[RTAssetProcessor _objectForKey:expectedClass:inDictionary:](v15, "_objectForKey:expectedClass:inDictionary:", CFSTR("GroupId"), objc_opt_class(), v35);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTAssetProcessor _objectForKey:expectedClass:inDictionary:](v15, "_objectForKey:expectedClass:inDictionary:", CFSTR("ModValue"), objc_opt_class(), v35);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTAssetProcessor _objectForKey:expectedClass:inDictionary:](v15, "_objectForKey:expectedClass:inDictionary:", CFSTR("Low"), objc_opt_class(), v35);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTAssetProcessor _objectForKey:expectedClass:inDictionary:](v15, "_objectForKey:expectedClass:inDictionary:", CFSTR("High"), objc_opt_class(), v35);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTAssetProcessor _objectForKey:expectedClass:inDictionary:](v15, "_objectForKey:expectedClass:inDictionary:", CFSTR("ExpirationDate"), objc_opt_class(), v35);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTAssetProcessor _objectForKey:expectedClass:inDictionary:](v15, "_objectForKey:expectedClass:inDictionary:", CFSTR("Overrides"), objc_opt_class(), v35);
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = (void *)v38;
                v62 = (void *)v36;
                if (!v36 || !v66 || !v65 || !v64 || !v63 || !v37 || !v38)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityAsset);
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v79 = v35;
                    _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "Invalid group definition, skipping group, %@", buf, 0xCu);
                  }
                  v43 = v62;
                  goto LABEL_54;
                }
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v37, "compare:", v40);

                v42 = v41 == -1;
                v43 = v62;
                if (!v42
                  && -[RTAssetProcessor _deviceSeed:belongsToGroupId:seedId:modValue:low:high:](v15, "_deviceSeed:belongsToGroupId:seedId:modValue:low:high:", v14, v66, v62, v65, v64, v63))
                {
                  _rt_log_facility_get_os_log(RTLogFacilityAsset);
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v79 = (const char *)v62;
                    v80 = 2112;
                    v81 = v66;
                    _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "Device belongs to seedId, %@, groupId, %@", buf, 0x16u);
                  }

                  v69 = 0u;
                  v70 = 0u;
                  v67 = 0u;
                  v68 = 0u;
                  v45 = v39;
                  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
                  if (v46)
                  {
                    v47 = v46;
                    v48 = *(_QWORD *)v68;
                    do
                    {
                      for (j = 0; j != v47; ++j)
                      {
                        if (*(_QWORD *)v68 != v48)
                          objc_enumerationMutation(v45);
                        v50 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
                        objc_msgSend(v45, "objectForKeyedSubscript:", v50);
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v31, "setObject:forKeyedSubscript:", v51, v50);

                      }
                      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
                    }
                    while (v47);
                  }

                  v75[0] = CFSTR("RTDefaultsABTestSeedId");
                  v75[1] = CFSTR("RTDefaultsABTestGroupId");
                  v43 = v62;
                  v76[0] = v62;
                  v76[1] = v66;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
                  v52 = objc_claimAutoreleasedReturnValue();
                  v33 = v56;
                  objc_msgSend(v56, "addObject:", v52);
                  v14 = v57;
                  v15 = self;
LABEL_54:

                }
              }
              v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
            }
            while (v61);
          }

          objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, CFSTR("ABTestOverrides"));
          if (objc_msgSend(v33, "count"))
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("RTDefaultsABTestActiveGroups"));
          v9 = v54;
          v25 = objc_msgSend(v31, "writeToFile:atomically:", v54, 1);

          v7 = v55;
          goto LABEL_21;
        }
      }
      else
      {

      }
      if (a5)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0D18598];
        v83 = *MEMORY[0x1E0CB2D50];
        v84 = CFSTR("unable to read input asset file.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v23;
        v21 = v24;
        v22 = 0;
        goto LABEL_20;
      }
LABEL_22:
      v25 = 0;
      goto LABEL_23;
    }
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v79 = "-[RTAssetProcessor processAssetsAtPath:intoPath:outError:]";
    v80 = 1024;
    LODWORD(v81) = 55;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetPath (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_13:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v79 = "-[RTAssetProcessor processAssetsAtPath:intoPath:outError:]";
      v80 = 1024;
      LODWORD(v81) = 56;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsPath (in %s:%d)", buf, 0x12u);
    }

    if (!a5)
      goto LABEL_22;
    goto LABEL_16;
  }
  if (!a5)
    goto LABEL_22;
LABEL_16:
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = *MEMORY[0x1E0D18598];
  v85 = *MEMORY[0x1E0CB2D50];
  v86[0] = CFSTR("requires assetPath and defaultsPath.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  v21 = v19;
  v22 = 7;
LABEL_20:
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v14);
  v25 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_23:
  return v25;
}

- (id)_objectForKey:(id)a3 expectedClass:(Class)a4 inDictionary:(id)a5
{
  void *v5;
  id v6;

  objc_msgSend(a5, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (BOOL)_deviceSeed:(id)a3 belongsToGroupId:(id)a4 seedId:(id)a5 modValue:(id)a6 low:(id)a7 high:(id)a8
{
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;

  v12 = a8;
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = a7;
  v15 = a6;
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), a3, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");

  v18 = objc_msgSend(v15, "unsignedIntegerValue");
  v19 = v17 % v18;
  v20 = objc_msgSend(v14, "unsignedIntegerValue");

  v21 = v20 <= v19 && v19 < objc_msgSend(v12, "unsignedIntegerValue");
  return v21;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
