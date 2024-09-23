@implementation STHistoryAnalyzer

- (id)deltasForStore:(id)a3 inManagedObjectContext:(id)a4 sinceToken:(id)a5 ignoreAuthor:(id)a6 finalToken:(id *)a7 error:(id *)a8
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  STDelta *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  STDelta *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  const char *v78;
  NSObject *v79;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  void *v84;
  NSObject *v85;
  id v86;
  id *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v94;
  id obj;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  void *v106;
  uint8_t v107;
  char v108[7];
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t v114;
  char v115[15];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  char v121[16];
  uint8_t buf[4];
  NSObject *v123;
  __int16 v124;
  NSObject *v125;
  __int16 v126;
  void *v127;
  char v128[16];
  _BYTE v129[128];
  char v130[16];
  _BYTE v131[128];
  _QWORD v132[4];

  v88 = a7;
  v132[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v94 = a6;
  v14 = objc_opt_new();
  +[STLog mirroring](STLog, "mirroring");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.8(v11, (uint64_t)v13, v15);

  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterToken:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAffectedStores:", v17);

  objc_msgSend(v16, "setResultType:", 5);
  v120 = 0;
  v91 = v16;
  objc_msgSend(v12, "executeRequest:error:", v16, &v120);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v120;
  v101 = (id)v14;
  v100 = v11;
  v102 = v12;
  v92 = v13;
  v89 = v19;
  v90 = v18;
  if (v18)
  {
    objc_msgSend(v18, "result");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[STLog mirroring](STLog, "mirroring");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.7(v20, v21);

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    obj = v20;
    v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
    v22 = 0;
    v23 = 0;
    if (v97)
    {
      v96 = *(_QWORD *)v117;
      v24 = v94;
      while (1)
      {
        for (i = 0; i != v97; ++i)
        {
          if (*(_QWORD *)v117 != v96)
            objc_enumerationMutation(obj);
          v106 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x1D8234BBC]();
          +[STLog mirroring](STLog, "mirroring");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v106, "author");
            v82 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "token");
            v83 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v123 = v82;
            v124 = 2114;
            v125 = v83;
            _os_log_debug_impl(&dword_1D22E7000, v27, OS_LOG_TYPE_DEBUG, "Transaction author: %{public}@, token: %{public}@", buf, 0x16u);

          }
          if (!v24
            || (objc_msgSend(v106, "author"),
                v28 = (void *)objc_claimAutoreleasedReturnValue(),
                v29 = objc_msgSend(v28, "isEqualToString:", v24),
                v28,
                !v29))
          {
            v98 = v26;
            v99 = i;
            +[STLog mirroring](STLog, "mirroring", v88, v89, v90);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.5((uint64_t)v130, (uint64_t)v106);

            v112 = 0u;
            v113 = 0u;
            v110 = 0u;
            v111 = 0u;
            objc_msgSend(v106, "changes");
            v104 = objc_claimAutoreleasedReturnValue();
            v31 = -[NSObject countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
            if (!v31)
            {
LABEL_87:
              v26 = v98;
              i = v99;
              goto LABEL_88;
            }
            v32 = v31;
            v33 = *(_QWORD *)v111;
            while (2)
            {
              v34 = 0;
              v103 = v32;
LABEL_22:
              v35 = v23;
              v36 = v22;
              if (*(_QWORD *)v111 != v33)
                objc_enumerationMutation(v104);
              v37 = *(NSObject **)(*((_QWORD *)&v110 + 1) + 8 * v34);
              objc_msgSend(v106, "token");
              v23 = (id)objc_claimAutoreleasedReturnValue();

              if (!-[STHistoryAnalyzer _isChangeInteresting:](self, "_isChangeInteresting:", v37))
              {
                +[STLog mirroring](STLog, "mirroring");
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v123 = v37;
                  _os_log_debug_impl(&dword_1D22E7000, v46, OS_LOG_TYPE_DEBUG, "Skipping uninteresting change: %{public}@", buf, 0xCu);
                }
                goto LABEL_36;
              }
              v38 = -[NSObject changeType](v37, "changeType");
              -[NSObject changedObjectID](v37, "changedObjectID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39;
              if (v38 == 2)
              {
                objc_msgSend(v39, "entity");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "userInfo");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("isMirrored"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("YES"));

                if ((v44 & 1) != 0)
                {
                  -[NSObject tombstone](v37, "tombstone");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
                  v46 = objc_claimAutoreleasedReturnValue();

                  if (v46)
                  {
                    +[STLog mirroring](STLog, "mirroring");
                    v47 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v100, "configurationName");
                      v76 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v123 = v76;
                      v124 = 2114;
                      v125 = v46;
                      _os_log_debug_impl(&dword_1D22E7000, v47, OS_LOG_TYPE_DEBUG, "Detected change for store: %{public}@, Delete: %{public}@", buf, 0x16u);

                    }
                    objc_msgSend(v101, "objectForKeyedSubscript:", v46);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v48)
                    {
                      v49 = -[STDelta initWithUniqueIdentifier:]([STDelta alloc], "initWithUniqueIdentifier:", v46);
                      objc_msgSend(v101, "setObject:forKeyedSubscript:", v49, v46);

                    }
                    objc_msgSend(v101, "objectForKeyedSubscript:", v46);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "deleted");

                  }
                  v22 = v36;
LABEL_50:
                  v32 = v103;
LABEL_81:

                  if (v32 == ++v34)
                  {
                    v81 = -[NSObject countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
                    v32 = v81;
                    if (!v81)
                    {
                      v24 = v94;
                      goto LABEL_87;
                    }
                    continue;
                  }
                  goto LABEL_22;
                }
                +[STLog mirroring](STLog, "mirroring");
                v46 = objc_claimAutoreleasedReturnValue();
                v32 = v103;
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                  -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.2((uint64_t)v128, (uint64_t)v37);
LABEL_36:
                v22 = v36;
                goto LABEL_81;
              }
              break;
            }
            v109 = v22;
            objc_msgSend(v102, "existingObjectWithID:error:", v39, &v109);
            v46 = objc_claimAutoreleasedReturnValue();
            v22 = v109;

            -[NSObject entity](v46, "entity");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "name");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("RMCloudActivation"));

            if (v53)
            {
              v54 = v46;
              if (-[NSObject activationType](v54, "activationType"))
              {

                goto LABEL_40;
              }
              +[STLog mirroring](STLog, "mirroring");
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v123 = v54;
                _os_log_debug_impl(&dword_1D22E7000, v65, OS_LOG_TYPE_DEBUG, "Skipping legacy STCloudActivation: %{public}@", buf, 0xCu);
              }

LABEL_78:
              v46 = v54;
LABEL_79:
              v32 = v103;
LABEL_80:

              goto LABEL_81;
            }
LABEL_40:
            if (-[NSObject conformsToProtocol:](v46, "conformsToProtocol:", &unk_1EFC7FAC8))
            {
              v55 = v46;
              if (!v55)
              {
                +[STLog mirroring](STLog, "mirroring");
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                  -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.3(&v107, v108, v54);
                v46 = 0;
                goto LABEL_79;
              }
              v56 = v55;
              -[NSObject updatedProperties](v37, "updatedProperties");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "valueForKey:", CFSTR("name"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              +[STLog mirroring](STLog, "mirroring");
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v100, "configurationName");
                v79 = objc_claimAutoreleasedReturnValue();
                -[NSObject changedObjectID](v37, "changedObjectID");
                v80 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v123 = v79;
                v124 = 2114;
                v125 = v80;
                v126 = 2114;
                v127 = v58;
                _os_log_debug_impl(&dword_1D22E7000, v59, OS_LOG_TYPE_DEBUG, "Detected change (subobject) for store: %{public}@, Changed subobject id: %{public}@, Properties: %{public}@", buf, 0x20u);

              }
              -[NSObject syncableRootObject](v56, "syncableRootObject");
              v46 = objc_claimAutoreleasedReturnValue();

            }
            if (!-[NSObject conformsToProtocol:](v46, "conformsToProtocol:", &unk_1EFC7F0C8))
              goto LABEL_50;
            -[NSObject entity](v46, "entity");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "userInfo");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("isMirrored"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("YES"));

            if ((v63 & 1) == 0)
            {
              +[STLog mirroring](STLog, "mirroring");
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.2((uint64_t)v121, (uint64_t)v37);
              goto LABEL_79;
            }
            if (+[STHistoryAnalyzer _changedObjectBelongsToFamily:context:](STHistoryAnalyzer, "_changedObjectBelongsToFamily:context:", v46, v102))
            {
              +[STLog mirroring](STLog, "mirroring");
              v54 = objc_claimAutoreleasedReturnValue();
              v32 = v103;
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject objectID](v46, "objectID");
                v64 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v123 = v64;
                _os_log_impl(&dword_1D22E7000, v54, OS_LOG_TYPE_DEFAULT, "Ignoring changed object belonging to family: %{public}@", buf, 0xCu);

              }
              goto LABEL_80;
            }
            v54 = v46;
            -[NSObject updateUniqueIdentifier](v54, "updateUniqueIdentifier");
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
LABEL_67:
              -[NSObject dictionaryRepresentation](v54, "dictionaryRepresentation");
              v66 = objc_claimAutoreleasedReturnValue();
              -[NSObject valueForKey:](v54, "valueForKey:", CFSTR("uniqueIdentifier"));
              v68 = objc_claimAutoreleasedReturnValue();
              if (v68)
              {
                objc_msgSend(v101, "objectForKeyedSubscript:", v68);
                v72 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v72)
                {
                  v73 = -[STDelta initWithUniqueIdentifier:]([STDelta alloc], "initWithUniqueIdentifier:", v68);
                  objc_msgSend(v101, "setObject:forKeyedSubscript:", v73, v68);

                }
                objc_msgSend(v101, "objectForKeyedSubscript:", v68);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "changedWithDictionary:", v66);

                +[STLog mirroring](STLog, "mirroring");
                v71 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v100, "configurationName");
                  v75 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v123 = v75;
                  v124 = 2114;
                  v125 = v68;
                  _os_log_debug_impl(&dword_1D22E7000, v71, OS_LOG_TYPE_DEBUG, "Detected change for store: %{public}@, Change: %{public}@", buf, 0x16u);

                }
              }
              else
              {
                +[STLog mirroring](STLog, "mirroring");
                v71 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v123 = v54;
                  _os_log_debug_impl(&dword_1D22E7000, v71, OS_LOG_TYPE_DEBUG, "Skipping change because object has no uniqueIdentifier: %{public}@", buf, 0xCu);
                }
              }
              goto LABEL_77;
            }
            v66 = v54;
            -[NSObject device](v66, "device");
            v67 = objc_claimAutoreleasedReturnValue();
            v68 = v67;
            if (v67)
            {
              -[NSObject identifier](v67, "identifier");
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              +[STLog mirroring](STLog, "mirroring");
              v70 = objc_claimAutoreleasedReturnValue();
              v71 = v70;
              if (v69)
              {
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v123 = v66;
                  _os_log_impl(&dword_1D22E7000, v71, OS_LOG_TYPE_DEFAULT, "Found valid STUserDeviceState: %{public}@", buf, 0xCu);
                }

                goto LABEL_67;
              }
              if (!os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
              {
LABEL_77:

                goto LABEL_78;
              }
              *(_DWORD *)buf = 138543362;
              v123 = v66;
              v77 = v71;
              v78 = "Skipping STUserDeviceState with device.identifier = nil : %{public}@";
            }
            else
            {
              +[STLog mirroring](STLog, "mirroring");
              v71 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
                goto LABEL_77;
              *(_DWORD *)buf = 138543362;
              v123 = v66;
              v77 = v71;
              v78 = "Skipping STUserDeviceState with device = nil : %{public}@";
            }
            _os_log_fault_impl(&dword_1D22E7000, v77, OS_LOG_TYPE_FAULT, v78, buf, 0xCu);
            goto LABEL_77;
          }
          +[STLog mirroring](STLog, "mirroring");
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
            -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.6(&v114, v115, v104);
LABEL_88:

          objc_autoreleasePoolPop(v26);
        }
        v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
        if (!v97)
          goto LABEL_95;
      }
    }
    v24 = v94;
LABEL_95:

    if (v88 && v23)
    {
      v23 = objc_retainAutorelease(v23);
      *v88 = v23;
    }
  }
  else
  {
    v84 = v19;
    +[STLog mirroring](STLog, "mirroring");
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
      -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.1();

    v22 = v84;
    v23 = 0;
    v24 = v94;
  }
  if (a8 && v22)
    *a8 = objc_retainAutorelease(v22);
  v86 = v101;

  return v86;
}

- (BOOL)_isChangeInteresting:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "changeType") == 1)
  {
    objc_msgSend(v3, "updatedProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v3, "updatedProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v3, "updatedProperties", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v5);
            v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v13, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("ck"));

            if ((v15 & 1) == 0)
            {
              objc_msgSend(v13, "name");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v16);

            }
          }
          v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

      LOBYTE(v5) = objc_msgSend(v8, "count") != 0;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return (char)v5;
}

+ (BOOL)_changedObjectBelongsToFamily:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    +[STFamilyOrganization fetchRequest](STFamilyOrganization, "fetchRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v8, "execute:", &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    if (!v9)
    {
      +[STLog mirroring](STLog, "mirroring");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[STHistoryAnalyzer _changedObjectBelongsToFamily:context:].cold.1();
      LOBYTE(v13) = 0;
      goto LABEL_11;
    }
    objc_msgSend(v9, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "organization");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v12, "isEqual:", v11);
  }
  else
  {
    v15 = 0;
    +[STCoreUser fetchLocalUserInContext:error:](STCoreUser, "fetchLocalUserInContext:error:", v6, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (!v8)
    {
      +[STLog mirroring](STLog, "mirroring");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[STHistoryAnalyzer _changedObjectBelongsToFamily:context:].cold.2();
      LOBYTE(v13) = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "user");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject dsid](v10, "dsid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dsid");
      v11 = objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "isEqualToNumber:", v11) ^ 1;
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v13) = 0;
      goto LABEL_16;
    }
    objc_msgSend(v5, "userDeviceState");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject user](v10, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dsid");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dsid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSObject isEqualToNumber:](v11, "isEqualToNumber:", v12) ^ 1;
  }

LABEL_11:
LABEL_15:

LABEL_16:
  return v13;
}

- (NSPersistentHistoryToken)finalToken
{
  return self->_finalToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalToken, 0);
}

- (void)deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_FAULT, "fetchHistoryAfterToken failed: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)deltasForStore:(uint64_t)a1 inManagedObjectContext:(uint64_t)a2 sinceToken:ignoreAuthor:finalToken:error:.cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "changedObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v6;
  OUTLINED_FUNCTION_4(&dword_1D22E7000, v7, v8, "Skipping unmirrored entity change: %{public}@");

  OUTLINED_FUNCTION_4_1();
}

- (void)deltasForStore:(NSObject *)a3 inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:.cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_2(&dword_1D22E7000, (int)a2, a3, "Change is a subobject but has no root, skipping", a1);
}

- (void)deltasForStore:(uint64_t)a1 inManagedObjectContext:(uint64_t)a2 sinceToken:ignoreAuthor:finalToken:error:.cold.5(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  *v3 = 134217984;
  *v2 = v5;
  OUTLINED_FUNCTION_4(&dword_1D22E7000, v6, v7, "Transaction changes to process: %lu");

}

- (void)deltasForStore:(NSObject *)a3 inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:.cold.6(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_2(&dword_1D22E7000, (int)a2, a3, "Skipping transaction due to author", a1);
}

- (void)deltasForStore:(void *)a1 inManagedObjectContext:(NSObject *)a2 sinceToken:ignoreAuthor:finalToken:error:.cold.7(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_DEBUG, "Transactions to process: %lu", v3, 0xCu);
}

- (void)deltasForStore:(NSObject *)a3 inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:.cold.8(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "configurationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  v7 = 2114;
  v8 = a2;
  _os_log_debug_impl(&dword_1D22E7000, a3, OS_LOG_TYPE_DEBUG, "deltasForStore: %{public}@, token passed in: %{public}@", v6, 0x16u);

}

+ (void)_changedObjectBelongsToFamily:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch family organizations: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_changedObjectBelongsToFamily:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1D22E7000, v0, v1, "Failed to fetch the local user: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
