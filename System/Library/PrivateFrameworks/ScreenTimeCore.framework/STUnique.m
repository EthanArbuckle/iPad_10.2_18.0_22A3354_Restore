@implementation STUnique

- (STUnique)initWithPersistenceController:(id)a3
{
  id v5;
  STUnique *v6;
  STUnique *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUnique;
  v6 = -[STUnique init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_persistenceController, a3);

  return v7;
}

+ (id)localToCloudMapping
{
  if (localToCloudMapping_oneTime != -1)
    dispatch_once(&localToCloudMapping_oneTime, &__block_literal_global_16);
  return (id)localToCloudMapping_entityMapping;
}

void __31__STUnique_localToCloudMapping__block_invoke()
{
  void *v0;

  v0 = (void *)localToCloudMapping_entityMapping;
  localToCloudMapping_entityMapping = (uint64_t)&unk_1E938DEE8;

}

+ (id)cloudToLocalMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__STUnique_cloudToLocalMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cloudToLocalMapping_oneTime != -1)
    dispatch_once(&cloudToLocalMapping_oneTime, block);
  return (id)cloudToLocalMapping_entityMapping;
}

void __31__STUnique_cloudToLocalMapping__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "localToCloudMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v1, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v1, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10 = (void *)cloudToLocalMapping_entityMapping;
  cloudToLocalMapping_entityMapping = (uint64_t)v2;

}

+ (id)mirroredEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__STUnique_mirroredEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mirroredEntityNames_oneTime != -1)
    dispatch_once(&mirroredEntityNames_oneTime, block);
  return (id)mirroredEntityNames_entityNames;
}

void __31__STUnique_mirroredEntityNames__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "localToCloudMapping");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2 * objc_msgSend(v1, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v1, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v2, "addObject:", v8);
        objc_msgSend(v1, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10 = (void *)mirroredEntityNames_entityNames;
  mirroredEntityNames_entityNames = (uint64_t)v2;

}

+ (Class)_internalClassForSerializableClassName:(id)a3
{
  uint64_t v3;
  id v4;
  NSString *v5;
  void *v6;

  v3 = _internalClassForSerializableClassName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_internalClassForSerializableClassName__onceToken, &__block_literal_global_8);
  objc_msgSend((id)_internalClassForSerializableClassName__mapping, "objectForKeyedSubscript:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

void __51__STUnique__internalClassForSerializableClassName___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[9];
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  +[STTestSyncableObject serializableClassName](STTestSyncableObject, "serializableClassName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  v12[0] = CFSTR("STTestSyncableObject");
  +[STBlueprint serializableClassName](STBlueprint, "serializableClassName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v1;
  v12[1] = CFSTR("STBlueprint");
  +[STFamilyOrganizationSettings serializableClassName](STFamilyOrganizationSettings, "serializableClassName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  v12[2] = CFSTR("STFamilyOrganizationSettings");
  +[STiCloudOrganizationSettings serializableClassName](STiCloudOrganizationSettings, "serializableClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v12[3] = CFSTR("STiCloudOrganizationSettings");
  +[STUserDeviceState serializableClassName](STUserDeviceState, "serializableClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v4;
  v12[4] = CFSTR("STUserDeviceState");
  +[STInstalledApp serializableClassName](STInstalledApp, "serializableClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v5;
  v12[5] = CFSTR("STInstalledApp");
  +[STLocalOrganization serializableClassName](STLocalOrganization, "serializableClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  v12[6] = CFSTR("STLocalOrganization");
  +[STiCloudOrganization serializableClassName](STiCloudOrganization, "serializableClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v7;
  v12[7] = CFSTR("STiCloudOrganization");
  +[STFamilyOrganization serializableClassName](STFamilyOrganization, "serializableClassName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[8] = v8;
  v12[8] = CFSTR("STFamilyOrganization");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 9);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_internalClassForSerializableClassName__mapping;
  _internalClassForSerializableClassName__mapping = v9;

}

- (BOOL)areLocalChangesInterestingWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  v22 = 0;
  -[STUnique persistenceController](self, "persistenceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "newBackgroundContext");
    objc_msgSend(v7, "setName:", CFSTR("Analyze"));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__STUnique_areLocalChangesInterestingWithError___block_invoke;
    v12[3] = &unk_1E9371938;
    v12[4] = self;
    v13 = v6;
    v8 = v7;
    v14 = v8;
    v15 = &v17;
    v16 = &v23;
    objc_msgSend(v8, "performBlockAndWait:", v12);
    if (a3)
    {
      v9 = (void *)v18[5];
      if (v9)
        *a3 = objc_retainAutorelease(v9);
    }
    v10 = *((_BYTE *)v24 + 24) != 0;

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 6, 0);
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v10;
}

void __48__STUnique_areLocalChangesInterestingWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id obj;
  id v15;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "historyTokenFromStore:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  v15 = 0;
  objc_msgSend(v2, "deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:", v4, v5, v3, CFSTR("STUnique"), &v15, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  objc_storeStrong((id *)(v6 + 40), obj);
  if (objc_msgSend(v7, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else if (v8)
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(id *)(v11 + 40);
    objc_msgSend(v9, "addHistoryToken:toMetadataForStore:error:", v8, v10, &v13);
    objc_storeStrong((id *)(v11 + 40), v13);
    +[STLog mirroring](STLog, "mirroring");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __48__STUnique_areLocalChangesInterestingWithError___block_invoke_cold_1();

  }
}

- (BOOL)migrateWithExportNeeded:(BOOL *)a3 error:(id *)a4
{
  BOOL v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  v6 = -[STUnique migrateWithError:](self, "migrateWithError:", &v10);
  v7 = v10;
  v8 = v7;
  if (a3)
    *a3 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v8 == 0;
}

- (BOOL)migrateWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  STUnique *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;

  +[STLog mirroring](STLog, "mirroring");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STUnique migrateWithError:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__12;
  v42 = __Block_byref_object_dispose__12;
  v43 = 0;
  -[STUnique persistenceController](self, "persistenceController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cloudStore");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v14 && v15)
  {
    v17 = (void *)objc_msgSend(v13, "newBackgroundContext");
    objc_msgSend(v17, "setTransactionAuthor:", CFSTR("STUnique"));
    objc_msgSend(v17, "setName:", CFSTR("Migrate"));
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __29__STUnique_migrateWithError___block_invoke;
    v30[3] = &unk_1E9371960;
    v18 = v17;
    v31 = v18;
    v32 = v16;
    v33 = v14;
    v34 = self;
    v35 = &v48;
    v36 = &v44;
    v37 = &v38;
    objc_msgSend(v18, "performBlockAndWait:", v30);
    if (a3)
    {
      if (!*((_BYTE *)v45 + 24))
      {
        v19 = (void *)v39[5];
        if (v19)
          *a3 = objc_retainAutorelease(v19);
      }
    }
    +[STLog mirroring](STLog, "mirroring");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[STUnique migrateWithError:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    v28 = *((_BYTE *)v49 + 24) != 0;
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 6, 0);
    v28 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v28;
}

void __29__STUnique_migrateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  objc_class *v7;
  objc_class *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  objc_class *v33;
  uint64_t v34;
  void *v35;
  objc_class *v36;
  objc_class *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  objc_class *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  objc_class *v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  id v74;
  int v75;
  NSObject *v76;
  NSObject *v77;
  objc_class *v78;
  void *v79;
  objc_class *v80;
  objc_class *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  id v87;
  objc_class *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  objc_class *v94;
  NSObject *v95;
  void *v96;
  uint64_t v97;
  objc_class *v98;
  NSObject *v99;
  objc_class *v100;
  void *v101;
  uint64_t v102;
  char v103;
  objc_class *v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  objc_class *v126;
  objc_class *v127;
  objc_class *v128;
  objc_class *v129;
  objc_class *v130;
  uint8_t v131;
  char v132[7];
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  id v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  objc_class *v143;
  uint8_t v144;
  char v145[7];
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  objc_class *v151;
  id v152;
  objc_class *v153;
  id v154;
  id v155;
  uint8_t v156[4];
  uint64_t v157;
  _BYTE v158[128];
  uint8_t v159[128];
  uint8_t buf[4];
  objc_class *v161;
  __int16 v162;
  id v163;
  _QWORD v164[2];
  _QWORD v165[2];
  _BYTE v166[128];
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v155 = 0;
  v125 = v2;
  v6 = objc_msgSend(v2, "initializeCachesWithManagedObjectContext:withCloudStore:andLocalStore:error:", v3, v4, v5, &v155);
  v7 = (objc_class *)v155;
  v8 = v7;
  v9 = 0x1E936F000uLL;
  if (!v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    if (!v7)
      goto LABEL_106;
    goto LABEL_103;
  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 56), "historyTokenFromStore:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "historyTokenFromStore:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[STLog mirroring](STLog, "mirroring");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __29__STUnique_migrateWithError___block_invoke_cold_8();

  +[STLog mirroring](STLog, "mirroring");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __29__STUnique_migrateWithError___block_invoke_cold_7();

  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 32);
  v154 = 0;
  v17 = v8;
  v153 = v8;
  objc_msgSend(v10, "deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:", v15, v16, v11, CFSTR("STUnique"), &v154, &v153);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v154;
  v19 = v153;

  v21 = *(_QWORD *)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 40);
  v151 = v19;
  v152 = 0;
  objc_msgSend(v10, "deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:", v20, v21, v12, CFSTR("STUnique"), &v152, &v151);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v152;
  v126 = v151;

  v118 = v18;
  if (objc_msgSend(v18, "count") && objc_msgSend(v22, "count"))
    objc_msgSend(*(id *)(a1 + 56), "newResolveConflictsBetweenLocalDeltas:cloudDeltas:", v18, v22);
  v121 = a1;
  v113 = v10;
  v115 = v22;
  v109 = v12;
  v111 = v11;
  if (objc_msgSend(v22, "count"))
  {
    v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
    +[STLog mirroring](STLog, "mirroring");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 134217984;
      v161 = (objc_class *)v24;
      _os_log_impl(&dword_1D22E7000, v23, OS_LOG_TYPE_DEFAULT, "Detected %lu cloud changes", buf, 0xCu);
    }

    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    objc_msgSend(v22, "allValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v148;
      v120 = v25;
      v122 = *(_QWORD *)v148;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v148 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * i);
          if (objc_msgSend(v30, "changeType", v109, v111, v113) != 2)
          {
            objc_msgSend(v30, "dictionary");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("class"));
            v33 = (objc_class *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              v36 = +[STUnique _internalClassForSerializableClassName:](STUnique, "_internalClassForSerializableClassName:", v33);
              if (v36)
              {
                v37 = v36;
                objc_msgSend(v30, "dictionary");
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = *(_QWORD *)(a1 + 32);
                v143 = v126;
                -[objc_class fetchOrCreateWithDictionaryRepresentation:inContext:error:](v37, "fetchOrCreateWithDictionaryRepresentation:inContext:error:", v38, v39, &v143);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = v143;

                if (v38 && v40)
                {
                  v165[0] = v40;
                  v164[0] = CFSTR("object");
                  v164[1] = CFSTR("dictionary");
                  objc_msgSend(v30, "dictionary");
                  v42 = objc_claimAutoreleasedReturnValue();
                  v165[1] = v42;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v165, v164, 2);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v119, "addObject:", v43);

                  v25 = v120;
                }
                else
                {
                  +[STLog mirroring](STLog, "mirroring");
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v161 = v41;
                    _os_log_error_impl(&dword_1D22E7000, v42, OS_LOG_TYPE_ERROR, "Could not find/create local object: %{public}@", buf, 0xCu);
                  }
                }

                +[STLog mirroring](STLog, "mirroring");
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v30, "uniqueIdentifier");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v161 = v37;
                  v162 = 2114;
                  v163 = v45;
                  _os_log_impl(&dword_1D22E7000, v44, OS_LOG_TYPE_DEFAULT, "Mirroring change: Updated local object (%{public}@) %{public}@", buf, 0x16u);

                  v25 = v120;
                }

                v9 = 0x1E936F000;
                goto LABEL_36;
              }
              objc_msgSend(*(id *)(v9 + 3304), "mirroring");
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v161 = v33;
                _os_log_error_impl(&dword_1D22E7000, v38, OS_LOG_TYPE_ERROR, "External to internal mapping missing for: %@", buf, 0xCu);
              }
            }
            else
            {
              objc_msgSend(*(id *)(v9 + 3304), "mirroring");
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                __29__STUnique_migrateWithError___block_invoke_cold_6(&v144, v145, v38);
            }
            v41 = v126;
LABEL_36:

            v126 = v41;
            a1 = v121;
            v28 = v122;
            goto LABEL_37;
          }
          objc_msgSend(*(id *)(v9 + 3304), "mirroring");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v30, "uniqueIdentifier");
            v32 = (objc_class *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v161 = v32;
            _os_log_impl(&dword_1D22E7000, v31, OS_LOG_TYPE_DEFAULT, "Mirroring change: Deleted local copy of %{public}@", buf, 0xCu);

          }
          objc_msgSend(v30, "uniqueIdentifier");
          v33 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v34 = *(_QWORD *)(a1 + 32);
          v146 = 0;
          objc_msgSend(v125, "deleteLocalObjectWithUniqueIdentifier:managedObjectContext:error:", v33, v34, &v146);
LABEL_37:

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
      }
      while (v27);
    }

    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v46 = v119;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v139, v159, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v140;
      v50 = CFSTR("dictionary");
      do
      {
        v51 = 0;
        v123 = v48;
        do
        {
          if (*(_QWORD *)v140 != v49)
            objc_enumerationMutation(v46);
          v52 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v51);
          objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("object"), v109, v111, v113);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", v50);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "updateWithDictionaryRepresentation:", v54);
          if (_os_feature_enabled_impl())
          {
            v55 = v50;
            objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("class"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[objc_class isEqual:](+[STUnique _internalClassForSerializableClassName:](STUnique, "_internalClassForSerializableClassName:", v56), "isEqual:", objc_opt_class()))
            {
              objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("isAppAndWebsiteActivityEnabled"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = v57;
              if (v57)
              {
                v59 = v46;
                v60 = objc_msgSend(v57, "BOOLValue");
                v61 = *(_QWORD *)(v121 + 32);
                v138 = 0;
                v62 = +[STUnique _updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:](STUnique, "_updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:", v60, v61, &v138);
                v63 = (objc_class *)v138;
                if (!v62)
                {
                  +[STLog mirroring](STLog, "mirroring");
                  v64 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v161 = v63;
                    _os_log_fault_impl(&dword_1D22E7000, v64, OS_LOG_TYPE_FAULT, "Failed to update Screen Time settings: %{public}@", buf, 0xCu);
                  }

                }
                v46 = v59;
              }

            }
            v50 = v55;
            v48 = v123;
          }

          ++v51;
        }
        while (v48 != v51);
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v139, v159, 16);
      }
      while (v48);
    }

    a1 = v121;
    v11 = v111;
    v10 = v113;
    v12 = v109;
  }
  if (objc_msgSend(v118, "count", v109, v111, v113))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    +[STLog mirroring](STLog, "mirroring");
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = objc_msgSend(v118, "count");
      *(_DWORD *)buf = 134217984;
      v161 = (objc_class *)v66;
      _os_log_impl(&dword_1D22E7000, v65, OS_LOG_TYPE_DEFAULT, "Detected %lu local changes", buf, 0xCu);
    }

    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    objc_msgSend(v118, "allValues");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v134, v158, 16);
    if (v124)
    {
      v68 = *(_QWORD *)v135;
      do
      {
        v69 = 0;
        do
        {
          if (*(_QWORD *)v135 != v68)
            objc_enumerationMutation(v67);
          v70 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v69);
          if (objc_msgSend(v70, "changeType") == 2)
          {
            objc_msgSend(v70, "uniqueIdentifier");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = *(_QWORD *)(a1 + 32);
            v133 = 0;
            objc_msgSend(v125, "deleteCloudObjectWithUniqueIdentifier:managedObjectContext:error:", v71, v72, &v133);
            v73 = objc_claimAutoreleasedReturnValue();
            v74 = v133;

            if (v73)
            {
              v75 = -[NSObject BOOLValue](v73, "BOOLValue");
              +[STLog mirroring](STLog, "mirroring");
              v76 = objc_claimAutoreleasedReturnValue();
              v77 = v76;
              if (v75)
              {
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v70, "uniqueIdentifier");
                  v78 = (objc_class *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v161 = v78;
                  _os_log_impl(&dword_1D22E7000, v77, OS_LOG_TYPE_DEFAULT, "Mirroring change: Deleted cloud copy of %{public}@", buf, 0xCu);
                  goto LABEL_70;
                }
              }
              else if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
              {
                __29__STUnique_migrateWithError___block_invoke_cold_4(v156, v70, &v157, v77);
              }
            }
            else
            {
              +[STLog mirroring](STLog, "mirroring");
              v77 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v70, "uniqueIdentifier");
                v78 = (objc_class *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v161 = v78;
                v162 = 2114;
                v163 = v74;
                _os_log_error_impl(&dword_1D22E7000, v77, OS_LOG_TYPE_ERROR, "Mirroring change: Failed to delete cloud copy of %{public}@: %{public}@", buf, 0x16u);
LABEL_70:

              }
            }

            goto LABEL_83;
          }
          objc_msgSend(v70, "dictionary");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("class"));
          v74 = (id)objc_claimAutoreleasedReturnValue();

          if (v74)
          {
            v80 = +[STUnique _internalClassForSerializableClassName:](STUnique, "_internalClassForSerializableClassName:", v74);
            if (v80)
            {
              v81 = v80;
              objc_msgSend(v70, "uniqueIdentifier");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "dictionary");
              v83 = objc_claimAutoreleasedReturnValue();
              v84 = a1;
              v85 = (void *)v83;
              v86 = *(_QWORD *)(v84 + 32);
              v130 = v126;
              v87 = (id)objc_msgSend(v125, "updateCloudObjectWithUniqueIdentifier:dictionary:managedObjectContext:error:", v82, v83, v86, &v130);
              v88 = v130;

              +[STLog mirroring](STLog, "mirroring");
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v70, "uniqueIdentifier");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v161 = v81;
                v162 = 2114;
                v163 = v89;
                _os_log_impl(&dword_1D22E7000, v73, OS_LOG_TYPE_DEFAULT, "Mirroring change: Updated cloud object (%{public}@) %{public}@", buf, 0x16u);

              }
              v126 = v88;
              a1 = v121;
            }
            else
            {
              +[STLog mirroring](STLog, "mirroring");
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v161 = (objc_class *)v74;
                _os_log_error_impl(&dword_1D22E7000, v73, OS_LOG_TYPE_ERROR, "External to internal mapping missing for: %@", buf, 0xCu);
              }
            }
          }
          else
          {
            +[STLog mirroring](STLog, "mirroring");
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              __29__STUnique_migrateWithError___block_invoke_cold_5(&v131, v132, v73);
          }
LABEL_83:

          ++v69;
        }
        while (v124 != v69);
        v90 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v134, v158, 16);
        v124 = v90;
      }
      while (v90);
    }

    v11 = v112;
    v10 = v114;
    v12 = v110;
  }
  v91 = v115;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (v117)
    {
      v93 = *(_QWORD *)(a1 + 48);
      v92 = *(void **)(a1 + 56);
      v129 = v126;
      objc_msgSend(v92, "addHistoryToken:toMetadataForStore:error:", v117, v93, &v129);
      v94 = v129;

      +[STLog mirroring](STLog, "mirroring");
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
        __48__STUnique_areLocalChangesInterestingWithError___block_invoke_cold_1();

      v126 = v94;
    }
    if (v116)
    {
      v96 = *(void **)(a1 + 56);
      v97 = *(_QWORD *)(a1 + 40);
      v128 = v126;
      objc_msgSend(v96, "addHistoryToken:toMetadataForStore:error:", v116, v97, &v128);
      v98 = v128;

      +[STLog mirroring](STLog, "mirroring");
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
        __29__STUnique_migrateWithError___block_invoke_cold_2();

      v100 = v98;
    }
    else
    {
      v100 = v126;
    }
    objc_msgSend(*(id *)(a1 + 56), "persistenceController");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = *(_QWORD *)(a1 + 32);
    v127 = v100;
    v103 = objc_msgSend(v101, "saveContext:error:", v102, &v127);
    v104 = v127;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v103;
    v126 = v104;
    v91 = v115;
  }

  v8 = v126;
  if (v126)
  {
LABEL_103:
    +[STLog mirroring](STLog, "mirroring");
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
      __29__STUnique_migrateWithError___block_invoke_cold_1();

    STXPCSafeErrorFromCoreDataError(v8, 6);
    v106 = objc_claimAutoreleasedReturnValue();
    v107 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v108 = *(void **)(v107 + 40);
    *(_QWORD *)(v107 + 40) = v106;

  }
LABEL_106:

}

- (void)newResolveConflictsBetweenLocalDeltas:(id)a3 cloudDeltas:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138543362;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v13, v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          if (objc_msgSend(v15, "changeType") == 1)
          {
            if (objc_msgSend(v14, "changeType") == 1)
            {
              objc_msgSend(v5, "removeObjectForKey:", v13);
              +[STLog mirroring](STLog, "mirroring");
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v20;
                v26 = v13;
                v18 = v17;
                v19 = "Conflict: remote change and local change: %{public}@";
                goto LABEL_15;
              }
LABEL_16:

              goto LABEL_17;
            }
            objc_msgSend(v6, "removeObjectForKey:", v13);
            +[STLog mirroring](STLog, "mirroring");
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_16;
            *(_DWORD *)buf = v20;
            v26 = v13;
            v18 = v17;
            v19 = "Conflict: remote change and local delete: %{public}@";
          }
          else
          {
            objc_msgSend(v5, "removeObjectForKey:", v13);
            +[STLog mirroring](STLog, "mirroring");
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_16;
            *(_DWORD *)buf = v20;
            v26 = v13;
            v18 = v17;
            v19 = "Conflict: remote delete: %{public}@";
          }
LABEL_15:
          _os_log_impl(&dword_1D22E7000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
          goto LABEL_16;
        }
LABEL_17:

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v10);
  }

}

- (void)resolveConflictsBetweenLocalDeltas:(id)a3 cloudDeltas:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v55;
    v36 = v6;
    v37 = v5;
    v34 = *(_QWORD *)v55;
    v35 = v7;
    do
    {
      v11 = 0;
      v38 = v9;
      do
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v11);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v45 = v13;
          v15 = v12;
          v16 = v14;
          v39 = v11;
          v40 = v14;
          if (objc_msgSend(v14, "changeType") == 1)
          {
            if (objc_msgSend(v13, "changeType") == 1)
            {
              +[STLog mirroring](STLog, "mirroring");
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v61 = v15;
                v18 = v17;
                v19 = "Conflict: remote insert and local insert: %{public}@";
                goto LABEL_44;
              }
LABEL_45:
              v13 = v45;
LABEL_46:

              v11 = v39;
              v14 = v40;
              goto LABEL_47;
            }
            if (objc_msgSend(v13, "changeType") == 2)
            {
              objc_msgSend(v13, "inserted");
              +[STLog mirroring](STLog, "mirroring");
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v61 = v15;
                _os_log_impl(&dword_1D22E7000, v17, OS_LOG_TYPE_DEFAULT, "Conflict: remote insert and local update: %{public}@", buf, 0xCu);
              }
              goto LABEL_46;
            }
            objc_msgSend(v6, "removeObjectForKey:", v15);
            +[STLog mirroring](STLog, "mirroring");
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_45;
            *(_DWORD *)buf = 138543362;
            v61 = v15;
            v18 = v17;
            v19 = "Conflict: remote insert and local delete: %{public}@";
          }
          else if (objc_msgSend(v16, "changeType") == 2)
          {
            v20 = v15;
            if (objc_msgSend(v13, "changeType") == 1)
            {
              +[STLog mirroring](STLog, "mirroring");
              v17 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                goto LABEL_45;
              *(_DWORD *)buf = 138543362;
              v61 = v15;
              v18 = v17;
              v19 = "Conflict: remote update and local insert: %{public}@";
            }
            else
            {
              if (objc_msgSend(v13, "changeType") == 2)
              {
                v52 = 0u;
                v53 = 0u;
                v50 = 0u;
                v51 = 0u;
                objc_msgSend(v40, "updatedProperties");
                obj = (id)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
                if (v43)
                {
                  v42 = *(_QWORD *)v51;
                  do
                  {
                    v21 = 0;
                    do
                    {
                      if (*(_QWORD *)v51 != v42)
                        objc_enumerationMutation(obj);
                      v44 = v21;
                      v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v21);
                      v46 = 0u;
                      v47 = 0u;
                      v48 = 0u;
                      v49 = 0u;
                      objc_msgSend(v45, "updatedProperties");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = (void *)objc_msgSend(v23, "copy");

                      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                      if (v25)
                      {
                        v26 = v25;
                        v27 = *(_QWORD *)v47;
                        do
                        {
                          for (i = 0; i != v26; ++i)
                          {
                            if (*(_QWORD *)v47 != v27)
                              objc_enumerationMutation(v24);
                            v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
                            objc_msgSend(v22, "name");
                            v30 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v29, "name");
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            v32 = objc_msgSend(v30, "isEqualToString:", v31);

                            if (v32)
                            {
                              objc_msgSend(v29, "name");
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v45, "removePropertyWithName:", v33);

                            }
                          }
                          v20 = v15;
                          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                        }
                        while (v26);
                      }

                      v21 = v44 + 1;
                    }
                    while (v44 + 1 != v43);
                    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
                  }
                  while (v43);
                }

                +[STLog mirroring](STLog, "mirroring");
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v61 = v20;
                  _os_log_impl(&dword_1D22E7000, v17, OS_LOG_TYPE_DEFAULT, "Conflict: remote update and local update: %{public}@", buf, 0xCu);
                }
                v6 = v36;
                v5 = v37;
                v10 = v34;
                v7 = v35;
                v9 = v38;
                goto LABEL_45;
              }
              objc_msgSend(v6, "removeObjectForKey:", v15);
              +[STLog mirroring](STLog, "mirroring");
              v17 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                goto LABEL_45;
              *(_DWORD *)buf = 138543362;
              v61 = v15;
              v18 = v17;
              v19 = "Conflict: remote update and local delete: %{public}@";
            }
          }
          else
          {
            objc_msgSend(v5, "removeObjectForKey:", v15);
            +[STLog mirroring](STLog, "mirroring");
            v17 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              goto LABEL_45;
            *(_DWORD *)buf = 138543362;
            v61 = v15;
            v18 = v17;
            v19 = "Conflict: remote delete: %{public}@";
          }
LABEL_44:
          _os_log_impl(&dword_1D22E7000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
          goto LABEL_45;
        }
LABEL_47:

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v9);
  }

}

- (id)historyTokenFromStore:(id)a3
{
  return +[STUnique historyTokenFromStore:](STUnique, "historyTokenFromStore:", a3);
}

+ (id)historyTokenFromStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("STUnique"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (!v6)
    {
      +[STLog mirroring](STLog, "mirroring");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[STUnique historyTokenFromStore:].cold.1((uint64_t)v3, (uint64_t)v7, v8);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)addHistoryToken:(id)a3 toMetadataForStore:(id)a4 error:(id *)a5
{
  return +[STUnique addHistoryToken:toMetadataForStore:error:](STUnique, "addHistoryToken:toMetadataForStore:error:", a3, a4, a5);
}

+ (BOOL)addHistoryToken:(id)a3 toMetadataForStore:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v7)
  {
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("STUnique"));
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("STUnique"));

LABEL_5:
    objc_msgSend(v8, "setMetadata:", v10);
    LOBYTE(v11) = 1;
  }

  return (char)v11;
}

+ (BOOL)_updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:(BOOL)a3 inContext:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  __CFString *v26;
  uint64_t v27;

  v6 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v24 = 0;
  +[STScreenTimeSettings fetchScreenTimeSettingsInContext:error:](STScreenTimeSettings, "fetchScreenTimeSettingsInContext:error:", v7, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  v10 = v9;
  if (v8)
  {
    v23 = v9;
    +[STCoreUser fetchLocalUserInContext:error:](STCoreUser, "fetchLocalUserInContext:error:", v7, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;

    v13 = v11 != 0;
    if (v11)
    {
      objc_msgSend(v11, "unmodeledManagingOrganizationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cloudSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {
        if (objc_msgSend(v8, "screenTimeEnabled") != v6)
        {
          +[STLog mirroring](STLog, "mirroring");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = CFSTR("NO");
            if (v6)
              v20 = CFSTR("YES");
            v21 = v20;
            *(_DWORD *)buf = 138543362;
            v26 = v21;
            _os_log_impl(&dword_1D22E7000, v19, OS_LOG_TYPE_DEFAULT, "Updating ScreenTimeEnabled setting to: %{public}@", buf, 0xCu);

          }
          objc_msgSend(v8, "setScreenTimeEnabled:", v6);
        }
      }
      else
      {
        +[STLog mirroring](STLog, "mirroring");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D22E7000, v16, OS_LOG_TYPE_DEFAULT, "User is not using iCloud organization settings. Will not update Screen Time Settings based on iCloud organization settings.", buf, 2u);
        }

      }
    }
    else if (a5)
    {
      +[STLog mirroring](STLog, "mirroring");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[STUnique _updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:].cold.2();

      *a5 = objc_retainAutorelease(v12);
    }

  }
  else if (a5)
  {
    +[STLog mirroring](STLog, "mirroring");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[STUnique _updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:].cold.1();

    v12 = objc_retainAutorelease(v10);
    v13 = 0;
    *a5 = v12;
  }
  else
  {
    v13 = 0;
    v12 = v9;
  }

  return v13;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (void)setPersistenceController:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_migratedToken, 0);
}

void __48__STUnique_areLocalChangesInterestingWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1D22E7000, v0, v1, "Saved token - local: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)migrateWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, a1, a3, "Mirroring migration end", a5, a6, a7, a8, 0);
}

- (void)migrateWithError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, a1, a3, "Mirroring migration start", a5, a6, a7, a8, 0);
}

void __29__STUnique_migrateWithError___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_FAULT, "Error occurred during mirroring migration: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __29__STUnique_migrateWithError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1D22E7000, v0, v1, "Saved token - cloud: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __29__STUnique_migrateWithError___block_invoke_cold_4(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1D22E7000, a4, OS_LOG_TYPE_ERROR, "Mirroring change: Unable to delete cloud copy of %{public}@ : Missing cloud object", a1, 0xCu);

}

void __29__STUnique_migrateWithError___block_invoke_cold_5(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1D22E7000, (int)a2, a3, "Local delta missing class key", a1);
}

void __29__STUnique_migrateWithError___block_invoke_cold_6(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1D22E7000, (int)a2, a3, "Cloud delta missing class key", a1);
}

void __29__STUnique_migrateWithError___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1D22E7000, v0, v1, "Previous token - cloud: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __29__STUnique_migrateWithError___block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1D22E7000, v0, v1, "Previous token - local: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)historyTokenFromStore:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138543874;
  v4 = CFSTR("STUnique");
  v5 = 2114;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "Failed to deserialize history token for '%{public}@' in store: %{public}@\n%{public}@", (uint8_t *)&v3, 0x20u);
}

+ (void)_updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to find Screen Time Settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch local user: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
