@implementation PGMemoryConfiguration

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

- (NSDictionary)memoryCategorySubcategoryByOverTimeType
{
  return self->_memoryCategorySubcategoryByOverTimeType;
}

- (NSArray)memoryFeatureSpecifications
{
  return self->_memoryFeatureSpecifications;
}

- (BOOL)intersectRelevantAssetsForFeatures
{
  return self->_intersectRelevantAssetsForFeatures;
}

- (BOOL)requireSceneProcessingMeetsThresholdOverTime
{
  return self->_requireSceneProcessingMeetsThresholdOverTime;
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (unint64_t)minimumSceneAnalysisVersion
{
  return self->_minimumSceneAnalysisVersion;
}

- (PGMemoryMomentRequirements)memoryMomentRequirements
{
  return self->_memoryMomentRequirements;
}

- (PGOverTheYearsMemoryConfiguration)overTheYearsConfiguration
{
  return self->_overTheYearsConfiguration;
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredYearConfiguration
{
  return self->_featuredYearConfiguration;
}

- (PGFeaturedTimePeriodMemoryConfiguration)featuredSeasonConfiguration
{
  return self->_featuredSeasonConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredSeasonConfiguration, 0);
  objc_storeStrong((id *)&self->_featuredYearConfiguration, 0);
  objc_storeStrong((id *)&self->_overTheYearsConfiguration, 0);
  objc_storeStrong((id *)&self->_memoryMomentRequirements, 0);
  objc_storeStrong((id *)&self->_memoryFeatureSpecifications, 0);
  objc_storeStrong((id *)&self->_memoryCategorySubcategoryByOverTimeType, 0);
}

+ (id)memoryConfigurationsWithGraph:(id)a3 loggingConnection:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("MemoryConfigurations"), CFSTR("plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v9, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  if (v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__PGMemoryConfiguration_memoryConfigurationsWithGraph_loggingConnection___block_invoke;
    v17[3] = &unk_1E8429320;
    v21 = a1;
    v18 = v6;
    v19 = v7;
    v13 = v12;
    v20 = v13;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);
    v14 = v20;
    v15 = v13;

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] memoryConfigurations loaded from the plist is nil, failed with error %@", buf, 0xCu);
    }
    v15 = (id)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

+ (id)resolveConfigurationDictionary:(id)a3 configurationLabel:(id)a4 graph:(id)a5 loggingConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D77F78]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = objc_msgSend(a1, "memoryCategoryFromMemoryCategoryLabel:", v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D77F70]);

    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D77F88]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(a1, "memoryCategorySubcategoryByOverTimeTypeFromLabels:", v18);
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:");
      v19 = *MEMORY[0x1E0D77F90];
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D77F90]);
      v20 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v20;
      if (v20)
      {
        objc_msgSend(a1, "memoryFeatureSpecificationsFromDictionaries:memoryConfigurationLabel:graph:loggingConnection:", v20, v11, v12, v13);
        v21 = objc_claimAutoreleasedReturnValue();
        v50 = (void *)v21;
        if (v21)
        {
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v19);
          v22 = *MEMORY[0x1E0D77F98];
          objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D77F98]);
          v23 = objc_claimAutoreleasedReturnValue();
          v49 = (void *)v23;
          if (v23)
          {
            objc_msgSend(a1, "memoryMomentRequirementsFromDictionary:", v23);
            v24 = objc_claimAutoreleasedReturnValue();
            v48 = (void *)v24;
            if (v24)
            {
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, v22);
              v25 = *MEMORY[0x1E0D77FA8];
              objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D77FA8]);
              v26 = objc_claimAutoreleasedReturnValue();
              v47 = (void *)v26;
              if (v26)
              {
                objc_msgSend(a1, "overTheYearsMemoryConfigurationFromDictionary:", v26);
                v27 = objc_claimAutoreleasedReturnValue();
                v46 = (void *)v27;
                if (v27)
                {
                  objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, v25);
                  v28 = *MEMORY[0x1E0D77F68];
                  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D77F68]);
                  v29 = objc_claimAutoreleasedReturnValue();
                  v45 = (void *)v29;
                  if (v29)
                  {
                    objc_msgSend(a1, "featuredTimePeriodMemoryConfigurationFromDictionary:", v29);
                    v30 = objc_claimAutoreleasedReturnValue();
                    v44 = (void *)v30;
                    if (v30)
                    {
                      objc_msgSend(v14, "setObject:forKeyedSubscript:", v30, v28);
                      v31 = *MEMORY[0x1E0D77F60];
                      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D77F60]);
                      v32 = objc_claimAutoreleasedReturnValue();
                      v43 = (void *)v32;
                      if (v32)
                      {
                        objc_msgSend(a1, "featuredTimePeriodMemoryConfigurationFromDictionary:", v32);
                        v33 = objc_claimAutoreleasedReturnValue();
                        v42 = (void *)v33;
                        if (v33)
                        {
                          objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, v31);
                          objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D77F50]);
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v34)
                          {
                            v41 = v34;
                            v35 = objc_msgSend(a1, "minimumSceneAnalysisVersionForSignalModel:", objc_msgSend(v34, "integerValue"));
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v14, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D77FA0]);

                            v37 = v14;
                            v38 = v41;
                          }
                          else
                          {
                            v38 = 0;
                            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138412290;
                              v54 = v11;
                              _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil curationSignalModel for memoryConfiguration %@", buf, 0xCu);
                            }
                            v37 = 0;
                          }
                          v39 = (void *)v51;

                        }
                        else
                        {
                          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v54 = v11;
                            _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil seasonMemoryConfiguration for memoryConfiguration %@", buf, 0xCu);
                          }
                          v37 = 0;
                          v39 = (void *)v51;
                        }

                      }
                      else
                      {
                        v39 = (void *)v51;
                        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v54 = v11;
                          _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil seasonMemoryConfiguration dictionary for memoryConfiguration %@", buf, 0xCu);
                        }
                        v37 = 0;
                      }

                    }
                    else
                    {
                      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v54 = v11;
                        _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil featuredYearMemoryConfiguration for memoryConfiguration %@", buf, 0xCu);
                      }
                      v37 = 0;
                      v39 = (void *)v51;
                    }

                  }
                  else
                  {
                    v39 = (void *)v51;
                    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v54 = v11;
                      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil featuredYearMemoryConfiguration dictionary for memoryConfiguration %@", buf, 0xCu);
                    }
                    v37 = 0;
                  }

                }
                else
                {
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v54 = v11;
                    _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil overTheYearsConfiguration for memoryConfiguration %@", buf, 0xCu);
                  }
                  v37 = 0;
                  v39 = (void *)v51;
                }

              }
              else
              {
                v39 = (void *)v51;
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v54 = v11;
                  _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil overTheYearsConfiguration dictionary for memoryConfiguration %@", buf, 0xCu);
                }
                v37 = 0;
              }

            }
            else
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v54 = v11;
                _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil memoryMomentRequirements for memoryConfiguration %@", buf, 0xCu);
              }
              v37 = 0;
              v39 = (void *)v51;
            }

          }
          else
          {
            v39 = (void *)v51;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v11;
              _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil memoryMomentRequirements dictionary for memoryConfiguration %@", buf, 0xCu);
            }
            v37 = 0;
          }

        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v11;
            _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Nil memoryFeatureSpecifications for memoryConfiguration %@", buf, 0xCu);
          }
          v37 = 0;
          v39 = (void *)v51;
        }

      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v11;
          _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] No memoryFeatureSpecification dictionaries defined for memoryConfiguration %@", buf, 0xCu);
        }
        v37 = 0;
        v39 = (void *)v51;
      }

    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v11;
        _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] No memoryCategorySubcategoryLabelByOverTimeType defined for memoryConfiguration %@", buf, 0xCu);
      }
      v37 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v11;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] No memoryCategoryLabel defined for memoryConfiguration %@", buf, 0xCu);
    }
    v37 = 0;
  }

  return v37;
}

+ (unint64_t)memoryCategoryFromMemoryCategoryLabel:(id)a3
{
  id v3;
  int v4;
  unint64_t v5;
  BOOL v6;

  v3 = a3;
  if (PGIsAppleInternal_onceToken != -1)
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8044);
  v4 = PGIsAppleInternal_isAppleInternal;
  v5 = +[PGGraphBuilder memoryCategoryForLabel:](PGGraphBuilder, "memoryCategoryForLabel:", v3);

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (v6)
    return 100;
  else
    return v5;
}

+ (id)memoryCategorySubcategoryByOverTimeTypeFromLabels:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  char v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  if (PGIsAppleInternal_onceToken != -1)
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8044);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PGMemoryConfiguration_memoryCategorySubcategoryByOverTimeTypeFromLabels___block_invoke;
  v8[3] = &unk_1E8429348;
  v10 = PGIsAppleInternal_isAppleInternal;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

+ (id)memoryFeatureSpecificationsFromDictionaries:(id)a3 memoryConfigurationLabel:(id)a4 graph:(id)a5 loggingConnection:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  PGMemoryFeatureSpecification *v28;
  void *v29;
  id v30;
  __int128 v32;
  id v33;
  id obj;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *log;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v40 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v14)
  {
    v16 = v14;
    v38 = *(_QWORD *)v42;
    v37 = *MEMORY[0x1E0D77F58];
    v17 = *MEMORY[0x1E0D77F48];
    v36 = *MEMORY[0x1E0D77FB0];
    *(_QWORD *)&v15 = 138412290;
    v32 = v15;
    v33 = v10;
    obj = v13;
    log = v11;
    v35 = v12;
    v18 = v11;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v38)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v19);
      objc_msgSend(v20, "objectForKeyedSubscript:", v37, v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v17);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (!v21)
        break;
      if (!v22)
      {
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v32;
          v46 = v33;
          _os_log_error_impl(&dword_1CA237000, log, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Missing required memoryFeature property combineFeatureNodes for memoryConfiguration %@", buf, 0xCu);
        }
LABEL_24:

LABEL_25:
        v13 = obj;

        v30 = 0;
        v10 = v33;
        v11 = log;
        v12 = v35;
        goto LABEL_26;
      }
      v24 = objc_msgSend(v21, "integerValue");
      v25 = objc_msgSend(v23, "BOOLValue");
      objc_msgSend(v20, "objectForKeyedSubscript:", v36);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v26);
      else
        v27 = 0;
      v28 = -[PGMemoryFeatureSpecification initWithFeatureType:typeSpecificIdentifiers:combineFeatureNodes:graph:loggingConnection:]([PGMemoryFeatureSpecification alloc], "initWithFeatureType:typeSpecificIdentifiers:combineFeatureNodes:graph:loggingConnection:", v24, v27, v25, v40, v18);
      -[PGMemoryFeatureSpecification featureNodes](v28, "featureNodes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v35, "addObject:", v28);
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v32;
        v46 = v33;
        _os_log_error_impl(&dword_1CA237000, log, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] nil featureNodes for memoryConfiguration %@", buf, 0xCu);
      }

      if (!v29)
        goto LABEL_25;
      if (v16 == ++v19)
      {
        v13 = obj;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        v10 = v33;
        v11 = log;
        v12 = v35;
        if (v16)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v32;
      v46 = v33;
      _os_log_error_impl(&dword_1CA237000, log, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Missing required memoryFeature property featureType for memoryConfiguration %@", buf, 0xCu);
    }

    v21 = 0;
    goto LABEL_24;
  }
LABEL_18:

  v30 = v12;
LABEL_26:

  return v30;
}

+ (id)memoryMomentRequirementsFromDictionary:(id)a3
{
  id v3;
  PGDictionaryConfigurationSource *v4;
  PGMemoryMomentRequirementsBuilder *v5;
  void *v6;
  PGMemoryMomentRequirementsBuilder *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PGDictionaryConfigurationSource initWithDictionary:]([PGDictionaryConfigurationSource alloc], "initWithDictionary:", v3);

  v5 = [PGMemoryMomentRequirementsBuilder alloc];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGConfiguration initWithSources:version:](v5, "initWithSources:version:", v6, 1.0);

  -[PGMemoryMomentRequirementsBuilder memoryMomentRequirements](v7, "memoryMomentRequirements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)overTheYearsMemoryConfigurationFromDictionary:(id)a3
{
  id v3;
  PGDictionaryConfigurationSource *v4;
  PGOverTheYearsMemoryConfigurationBuilder *v5;
  void *v6;
  PGOverTheYearsMemoryConfigurationBuilder *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PGDictionaryConfigurationSource initWithDictionary:]([PGDictionaryConfigurationSource alloc], "initWithDictionary:", v3);

  v5 = [PGOverTheYearsMemoryConfigurationBuilder alloc];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGConfiguration initWithSources:version:](v5, "initWithSources:version:", v6, 1.0);

  -[PGOverTheYearsMemoryConfigurationBuilder overTheYearsMemoryConfiguration](v7, "overTheYearsMemoryConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)featuredTimePeriodMemoryConfigurationFromDictionary:(id)a3
{
  id v3;
  PGDictionaryConfigurationSource *v4;
  PGFeaturedTimePeriodMemoryConfigurationBuilder *v5;
  void *v6;
  PGFeaturedTimePeriodMemoryConfigurationBuilder *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PGDictionaryConfigurationSource initWithDictionary:]([PGDictionaryConfigurationSource alloc], "initWithDictionary:", v3);

  v5 = [PGFeaturedTimePeriodMemoryConfigurationBuilder alloc];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGConfiguration initWithSources:version:](v5, "initWithSources:version:", v6, 1.0);

  -[PGFeaturedTimePeriodMemoryConfigurationBuilder featuredTimePeriodMemoryConfiguration](v7, "featuredTimePeriodMemoryConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unint64_t)minimumSceneAnalysisVersionForSignalModel:(int64_t)a3
{
  id *v3;

  if (a3 == 1)
  {
    v3 = (id *)0x1E0D78228;
    return objc_msgSend(*v3, "latestVersion");
  }
  if (a3 == 2)
  {
    v3 = (id *)0x1E0D781F8;
    return objc_msgSend(*v3, "latestVersion");
  }
  return 0;
}

void __75__PGMemoryConfiguration_memoryCategorySubcategoryByOverTimeTypeFromLabels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a2;
  v6 = PGMemoryCategorySubcategoryForLabel(a3);
  if (!v6)
  {
    if (*(_BYTE *)(a1 + 40))
      v6 = 17001;
    else
      v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

}

void __73__PGMemoryConfiguration_memoryConfigurationsWithGraph_loggingConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  PGDictionaryConfigurationSource *v9;
  PGMemoryConfiguration *v10;
  void *v11;
  PGMemoryConfiguration *v12;
  NSObject *v13;
  NSObject *v14;
  PGDictionaryConfigurationSource *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 56), "resolveConfigurationDictionary:configurationLabel:graph:loggingConnection:", a3, v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[PGDictionaryConfigurationSource initWithDictionary:]([PGDictionaryConfigurationSource alloc], "initWithDictionary:", v8);
    v10 = [PGMemoryConfiguration alloc];
    v15 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PGConfiguration initWithSources:version:](v10, "initWithSources:version:", v11, 1.0);

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
    }
    else
    {
      v14 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] memoryConfiguration is nil for memoryConfiguration: %@", buf, 0xCu);
      }
      *a4 = 1;
    }

  }
  else
  {
    v13 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGMemoryConfiguration] Resolved memoryConfiguration dictionary is nil for memoryConfiguration: %@", buf, 0xCu);
    }
    *a4 = 1;
  }

}

@end
