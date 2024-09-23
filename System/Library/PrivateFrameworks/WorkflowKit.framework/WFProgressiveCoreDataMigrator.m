@implementation WFProgressiveCoreDataMigrator

+ (BOOL)migrateDatabaseAtPersistentStoreDescription:(id)a3 useLockFile:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  id v11;
  void (**v12)(void);
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  char v41;
  id v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  unint64_t v58;
  NSObject *v59;
  unint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  BOOL v93;
  int v94;
  NSObject *v95;
  id v96;
  NSObject *v97;
  void *v98;
  char v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  uint64_t v103;
  void *v104;
  id v105;
  NSObject *v107;
  void (**v108)(void);
  id v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  void *v116;
  id v117;
  uint64_t v118;
  void *v119;
  void *v120;
  id v122;
  NSObject *oslog;
  id v124;
  unint64_t v125;
  id context;
  id contexta;
  void *v128;
  id v129;
  id v130;
  void *v131;
  NSObject *v132;
  id v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  id v140;
  _QWORD v141[4];
  id v142;
  NSObject *v143;
  uint64_t v144;
  _QWORD aBlock[4];
  id v146;
  int v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  id v152;
  void *v153;
  _QWORD v154[2];
  _QWORD v155[2];
  _BYTE buf[24];
  void *v157;
  __int128 v158;
  _BYTE *v159;
  __int128 *v160;
  void *v161;
  _BYTE v162[24];
  char v163;
  uint64_t v164;

  v5 = a4;
  v164 = *MEMORY[0x1E0C80C00];
  v117 = a3;
  objc_msgSend(v117, "URL");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "URLForResource:withExtension:", CFSTR("Shortcuts"), CFSTR("momd"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v131, "URLByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Shortcuts.core_data_migration"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 512, 420);
    if (v9 != -1)
    {
      v10 = v9;
      if (flock(v9, 2) != -1)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __95__WFProgressiveCoreDataMigrator_migrateDatabaseAtPersistentStoreDescription_useLockFile_error___block_invoke;
        aBlock[3] = &unk_1E7AECF80;
        v147 = v10;
        v146 = v8;
        v11 = v8;
        v12 = (void (**)(void))_Block_copy(aBlock);
        v12[2]();

        goto LABEL_5;
      }
      close(v10);
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v22 = 0;
    goto LABEL_128;
  }
LABEL_5:
  v13 = *MEMORY[0x1E0C979E8];
  v144 = 0;
  v118 = v13;
  objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:options:error:");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0;
  if (!v116)
  {
    getWFDatabaseLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v112;
      _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_DEFAULT, "%s Not migrating, since persistent store metadata creation failed (likely no store has been created yet): %{public}@", buf, 0x16u);
    }
    v22 = 1;
    goto LABEL_127;
  }
  v133 = v120;
  v129 = v116;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = 0;
  objc_msgSend(v14, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v133, 0, 0, &v152);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  context = v152;
  v135 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v135)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("lastPathComponent.pathExtension"), CFSTR("mom"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "filterUsingPredicate:", v16);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("lastPathComponent"), 0, &__block_literal_global_8803);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v161, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "sortUsingDescriptors:", v18);

    v137 = (void *)objc_opt_new();
    objc_msgSend(v129, "objectForKeyedSubscript:", *MEMORY[0x1E0C979F8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v24 = v20;

    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;

    v150 = 0u;
    v151 = 0u;
    v149 = 0u;
    v148 = 0u;
    v28 = v135;
    v29 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v148, buf, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v149;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v149 != v30)
            objc_enumerationMutation(v28);
          v32 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * i);
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v32);
          if (!v33)
          {
            getWFDatabaseLogObject();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v162 = 136315394;
              *(_QWORD *)&v162[4] = "WFManagedObjectModelsFromCurrentToLatest";
              *(_WORD *)&v162[12] = 2114;
              *(_QWORD *)&v162[14] = v32;
              _os_log_impl(&dword_1C15B3000, v38, OS_LOG_TYPE_FAULT, "%s Failed to create managed object model from URL %{public}@", v162, 0x16u);
            }

            goto LABEL_45;
          }
          objc_msgSend(v137, "addObject:", v33);
          objc_msgSend(v33, "versionIdentifiers");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "anyObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqualToString:", v27);

          if ((v36 & 1) != 0)
            goto LABEL_38;
        }
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v148, buf, 16);
        if (v29)
          continue;
        break;
      }
    }
LABEL_38:

    v37 = objc_msgSend(v137, "count");
    if (v37 == -[NSObject count](v28, "count"))
    {
      getWFDatabaseLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v162 = 136315138;
        *(_QWORD *)&v162[4] = "WFManagedObjectModelsFromCurrentToLatest";
        _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_DEFAULT, "%s None of the models are compatible with with the store metadata, the database was likely truncated before.", v162, 0xCu);
      }
LABEL_45:
      v132 = MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v137, "reverseObjectEnumerator");
      v28 = objc_claimAutoreleasedReturnValue();
      -[NSObject allObjects](v28, "allObjects");
      v132 = objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    getWFDatabaseLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "WFManagedObjectModelsFromCurrentToLatest";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v133;
      *(_WORD *)&buf[22] = 2114;
      v157 = context;
      _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s Failed to get model URLs in directory %{public}@: %{public}@", buf, 0x20u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(context);
    v132 = MEMORY[0x1E0C9AA60];
  }

  if ((unint64_t)-[NSObject count](v132, "count") <= 1)
  {
    getWFDatabaseLogObject();
    oslog = objc_claimAutoreleasedReturnValue();
    v22 = 1;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      v39 = -[NSObject count](v132, "count");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = v39;
      _os_log_impl(&dword_1C15B3000, oslog, OS_LOG_TYPE_INFO, "%s Found %{public}lu models, Core Data migration not necessary, bailing out.", buf, 0x16u);
    }
    goto LABEL_126;
  }
  objc_msgSend(MEMORY[0x1E0D140A0], "createTemporaryDirectoryWithFilename:", CFSTR("ProgressiveMigration"));
  oslog = objc_claimAutoreleasedReturnValue();
  if (!oslog)
  {
    getWFDatabaseLogObject();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      _os_log_impl(&dword_1C15B3000, v44, OS_LOG_TYPE_ERROR, "%s Failed to perform Core Data migration because a temporary directory could not be created.", buf, 0xCu);
    }
    goto LABEL_116;
  }
  -[NSObject firstObject](v132, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isConfiguration:compatibleWithStoreMetadata:", 0, v129);

  if ((v41 & 1) == 0)
  {
    v42 = objc_alloc(MEMORY[0x1E0C97C00]);
    -[NSObject firstObject](v132, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "initWithManagedObjectModel:", v43);

    v45 = *MEMORY[0x1E0C97868];
    v154[0] = *MEMORY[0x1E0C978D0];
    v154[1] = v45;
    v155[0] = MEMORY[0x1E0C9AAB0];
    v155[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "type");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "configuration");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "URL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addPersistentStoreWithType:configuration:URL:options:error:](v44, "addPersistentStoreWithType:configuration:URL:options:error:", v47, v48, v49, v46, a5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50 == 0;

    if (!v51)
    {

      goto LABEL_54;
    }
    getWFDatabaseLogObject();
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      _os_log_impl(&dword_1C15B3000, v101, OS_LOG_TYPE_ERROR, "%s Failed to perform Core Data migration because current model can not be mapped to the same version's model", buf, 0xCu);
    }

LABEL_116:
    v22 = 0;
    goto LABEL_125;
  }
LABEL_54:
  v52 = objc_alloc(MEMORY[0x1E0C97C00]);
  -[NSObject lastObject](v132, "lastObject");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v52, "initWithManagedObjectModel:", v53);

  v55 = (void *)objc_opt_new();
  v141[0] = MEMORY[0x1E0C809B0];
  v141[1] = 3221225472;
  v141[2] = __95__WFProgressiveCoreDataMigrator_migrateDatabaseAtPersistentStoreDescription_useLockFile_error___block_invoke_14;
  v141[3] = &unk_1E7AF92C0;
  v122 = v55;
  v142 = v122;
  v107 = v54;
  v143 = v107;
  v108 = (void (**)(void))_Block_copy(v141);
  getWFDatabaseLogObject();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
    _os_log_impl(&dword_1C15B3000, v56, OS_LOG_TYPE_INFO, "%s Starting Core Data migration", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "UUIDString");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0;
  v134 = 0;
  v59 = v132;
  while (v58 < -[NSObject count](v59, "count") - 1)
  {
    contexta = (id)MEMORY[0x1C3BB3598]();
    -[NSObject objectAtIndexedSubscript:](v132, "objectAtIndexedSubscript:", v58);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v58 + 1;
    -[NSObject objectAtIndexedSubscript:](v132, "objectAtIndexedSubscript:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "lastObject");
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v62;
    v64 = v131;
    if (v62)
      v64 = (void *)v62;
    v130 = v64;

    v125 = v60 - 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shortcuts-%@-%lu.sqlite"), v114, v60 - 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject URLByAppendingPathComponent:](oslog, "URLByAppendingPathComponent:", v65);
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = (void *)MEMORY[0x1E0C97BA0];
    v153 = v128;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "mappingModelFromBundles:forSourceModel:destinationModel:", v67, v138, v61);
    v68 = objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v69 = v134;
    }
    else
    {
      getWFDatabaseLogObject();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
        _os_log_impl(&dword_1C15B3000, v70, OS_LOG_TYPE_DEFAULT, "%s Could not find explicit mapping model, trying to construct inferred one", buf, 0xCu);
      }

      v140 = v134;
      objc_msgSend(MEMORY[0x1E0C97BA0], "inferredMappingModelForSourceModel:destinationModel:error:", v138, v61, &v140);
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = v140;

      if (!v68)
      {
        getWFDatabaseLogObject();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
          _os_log_impl(&dword_1C15B3000, v68, OS_LOG_TYPE_ERROR, "%s Failed to create mapping model, bailing out", buf, 0xCu);
        }
        v94 = 2;
        v134 = v69;
        goto LABEL_103;
      }
    }
    objc_msgSend(v138, "versionIdentifiers");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "anyObject");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v73 = v72;
      else
        v73 = 0;
    }
    else
    {
      v73 = 0;
    }
    v124 = v73;

    objc_msgSend(v61, "versionIdentifiers");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "anyObject");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v76 = v75;
      else
        v76 = 0;
    }
    else
    {
      v76 = 0;
    }
    v77 = v76;

    getWFDatabaseLogObject();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v77;
      _os_log_impl(&dword_1C15B3000, v78, OS_LOG_TYPE_INFO, "%s Migrating to schema with identifier %{public}@", buf, 0x16u);
    }

    if ((objc_msgSend(v77, "isEqualToString:", CFSTR("v2")) & 1) != 0
      || objc_msgSend(v77, "isEqualToString:", CFSTR("v3")))
    {
      v79 = (void *)MEMORY[0x1E0CB3B20];
      v80 = (void *)objc_opt_new();
      objc_msgSend(v79, "setValueTransformer:forName:", v80, CFSTR("WFOrderedSetValue"));

    }
    v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97BB0]), "initWithSourceModel:destinationModel:", v138, v61);
    v139 = v69;
    v82 = objc_msgSend(v81, "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:", v130, v118, 0, v68, v136, v118, 0, &v139);
    v134 = v139;

    if ((v82 & 1) != 0)
    {
      objc_msgSend(v122, "addObject:", v136);
      objc_msgSend(a1, "customModificationsStepForSchemaWithIdentifier:", v77);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (v83)
      {
        getWFDatabaseLogObject();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v77;
          _os_log_impl(&dword_1C15B3000, v84, OS_LOG_TYPE_INFO, "%s Running custom modifications step after migrating to schema with identifier %{public}@", buf, 0x16u);
        }

        v85 = v83;
        v111 = v61;
        v109 = v136;
        objc_msgSend(MEMORY[0x1E0C97C08], "persistentStoreDescriptionWithURL:");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v111);
        objc_msgSend(v119, "type");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "configuration");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "URL");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = 0;
        objc_msgSend(v113, "addPersistentStoreWithType:configuration:URL:options:error:", v86, v87, v88, 0, &v152);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = v152;

        if (v89)
        {
          v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
          objc_msgSend(v90, "setPersistentStoreCoordinator:", v113);
          objc_msgSend(v90, "setMergePolicy:", *MEMORY[0x1E0C978D8]);
          objc_msgSend(v90, "setUndoManager:", 0);
          *(_QWORD *)v162 = 0;
          *(_QWORD *)&v162[8] = v162;
          *(_QWORD *)&v162[16] = 0x2020000000;
          v163 = 1;
          *(_QWORD *)&v148 = 0;
          *((_QWORD *)&v148 + 1) = &v148;
          *(_QWORD *)&v149 = 0x3032000000;
          *((_QWORD *)&v149 + 1) = __Block_byref_object_copy__8820;
          *(_QWORD *)&v150 = __Block_byref_object_dispose__8821;
          *((_QWORD *)&v150 + 1) = 0;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __WFPerformCustomModificationsStep_block_invoke;
          v157 = &unk_1E7AEE370;
          v159 = v162;
          *(_QWORD *)&v158 = v85;
          v91 = v90;
          *((_QWORD *)&v158 + 1) = v91;
          v160 = &v148;
          objc_msgSend(v91, "performBlockAndWait:", buf);
          v92 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v148 + 1) + 40));
          v93 = *(_BYTE *)(*(_QWORD *)&v162[8] + 24) != 0;

          _Block_object_dispose(&v148, 8);
          _Block_object_dispose(v162, 8);

        }
        else
        {
          getWFDatabaseLogObject();
          v95 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "WFPerformCustomModificationsStep";
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v110;
            _os_log_impl(&dword_1C15B3000, v95, OS_LOG_TYPE_ERROR, "%s Failed to add persistent store during Core Data migration: %{public}@", buf, 0x16u);
          }

          v92 = objc_retainAutorelease(v110);
          v93 = 0;
        }

        v96 = v92;
        if (v93)
        {
          v94 = 0;
        }
        else
        {
          getWFDatabaseLogObject();
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v77;
            *(_WORD *)&buf[22] = 2114;
            v157 = v96;
            _os_log_impl(&dword_1C15B3000, v97, OS_LOG_TYPE_ERROR, "%s Failed to perform custom database modifications for Core Data schema with identifier %{public}@: %{public}@", buf, 0x20u);
          }

          v94 = 2;
        }
        v134 = v96;
      }
      else
      {
        v85 = 0;
        v94 = 0;
      }
    }
    else
    {
      getWFDatabaseLogObject();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v124;
        *(_WORD *)&buf[22] = 2114;
        v157 = v77;
        LOWORD(v158) = 2114;
        *(_QWORD *)((char *)&v158 + 2) = v134;
        _os_log_impl(&dword_1C15B3000, v85, OS_LOG_TYPE_ERROR, "%s Failed to migrate from schema with identifier %{public}@ to %{public}@. Error: %{public}@", buf, 0x2Au);
      }
      v94 = 2;
    }

LABEL_103:
    objc_autoreleasePoolPop(contexta);
    v59 = v132;
    v58 = v125 + 1;
    if (v94)
      break;
  }
  if (v134)
  {
    if (a5)
    {
      v22 = 0;
      *a5 = objc_retainAutorelease(v134);
      goto LABEL_124;
    }
LABEL_123:
    v22 = 0;
  }
  else
  {
    objc_msgSend(v122, "lastObject");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = -[NSObject replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:](v107, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v131, 0, v98, 0, v118, a5);

    if ((v99 & 1) == 0)
    {
      getWFDatabaseLogObject();
      v102 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v122, "lastObject");
        v103 = objc_claimAutoreleasedReturnValue();
        v104 = (void *)v103;
        if (a5)
          v105 = *a5;
        else
          v105 = 0;
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v131;
        *(_WORD *)&buf[22] = 2114;
        v157 = (void *)v103;
        LOWORD(v158) = 2114;
        *(_QWORD *)((char *)&v158 + 2) = v105;
        _os_log_impl(&dword_1C15B3000, v102, OS_LOG_TYPE_ERROR, "%s Failed to replace persistent store at %{public}@ with %{public}@. Error: %{public}@", buf, 0x2Au);

      }
      goto LABEL_123;
    }
    getWFDatabaseLogObject();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]";
      _os_log_impl(&dword_1C15B3000, v100, OS_LOG_TYPE_INFO, "%s Core Data migration completed successfully", buf, 0xCu);
    }

    v22 = 1;
  }
LABEL_124:

  v108[2]();
  v44 = v107;
LABEL_125:

LABEL_126:
  v21 = v132;
LABEL_127:

LABEL_128:
  return v22;
}

void __95__WFProgressiveCoreDataMigrator_migrateDatabaseAtPersistentStoreDescription_useLockFile_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (flock(*(_DWORD *)(a1 + 40), 8) == -1)
  {
    getWFDatabaseLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *__error();
      v5 = 136315394;
      v6 = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]_block_invoke";
      v7 = 1026;
      v8 = v3;
      _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_ERROR, "%s Error: Failed to unlock migration file, errno=%{public}d", (uint8_t *)&v5, 0x12u);
    }

  }
  close(*(_DWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

void __95__WFProgressiveCoreDataMigrator_migrateDatabaseAtPersistentStoreDescription_useLockFile_error___block_invoke_14(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = *MEMORY[0x1E0C979E8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1C3BB3598]();
        v10 = *(void **)(a1 + 40);
        v14 = 0;
        v11 = objc_msgSend(v10, "destroyPersistentStoreAtURL:withType:options:error:", v8, v6, 0, &v14);
        v12 = v14;
        if ((v11 & 1) == 0)
        {
          getWFDatabaseLogObject();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "+[WFProgressiveCoreDataMigrator migrateDatabaseAtPersistentStoreDescription:useLockFile:error:]_block_invoke";
            v21 = 2114;
            v22 = v12;
            _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Failed to destroy temporary persistent store after migration: %{public}@", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v9);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v4);
  }

}

+ (id)customModificationsStepForSchemaWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("v3")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("v5")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("v7")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("v10")))
  {
    v4 = (void *)objc_opt_new();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
