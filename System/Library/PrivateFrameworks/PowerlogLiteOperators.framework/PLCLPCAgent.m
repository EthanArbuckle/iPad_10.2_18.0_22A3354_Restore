@implementation PLCLPCAgent

uint64_t __40__PLCLPCAgent_logCLPCStatsAccumulators___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 == 1)
  {
    v6 = objc_alloc(MEMORY[0x1E0D80008]);
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "lastEntryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithEntryKey:withDate:", v7, v8);

    v41 = a1;
    v10 = *(_QWORD *)(a1 + 48);
    v11 = v9;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("timestampEnd"));
    objc_msgSend(v5, "rows");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v5;
    if (objc_msgSend(v13, "count"))
    {
      v16 = 0;
      v42 = 0;
      *(_QWORD *)&v14 = 134217984;
      v40 = v14;
      do
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v16, v40);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedLongLongValue");

        if (v18)
        {
          objc_msgSend(v15, "schema");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "columns");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "statID");

          if (v22 == 1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("APWakeTime"));
          }
          else
          {
            v24 = v15;
            v25 = v11;
            objc_msgSend(v24, "schema");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "columns");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectAtIndexedSubscript:", v16);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "valueID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "unsignedLongLongValue");

            v31 = (void *)qword_1ED884CE8;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              objc_msgSend(*(id *)(v41 + 40), "addToLookupTableAndCache:forEntryKey:andLookupMap:", v30, accumulatorsLookupEntryKey, qword_1ED884CE8);
              PLLogCLPC();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v40;
                v46 = v30;
                _os_log_fault_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_FAULT, "Missing Accumulators lookup entry for ID %llu:", buf, 0xCu);
              }

            }
            v43 = CFSTR("ObfuscatedID");
            v35 = (void *)qword_1ED884CE8;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v30);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
            v38 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v25;
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, v38);
            v42 = (void *)v38;
            v15 = v5;
          }

        }
        ++v16;
      }
      while (objc_msgSend(v13, "count") > v16);
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(*(id *)(v41 + 40), "logEntry:", v11);

    v5 = v15;
  }

  return 1;
}

uint64_t __45__PLCLPCAgent_logCLPCCPUClusterAccumulators___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const __CFString *v54;
  void *v55;
  uint8_t buf[4];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (a2 == 3)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v4, "rows");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (!v45)
      goto LABEL_27;
    v44 = *(_QWORD *)v51;
    *(_QWORD *)&v6 = 134217984;
    v42 = v6;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v51 != v44)
          objc_enumerationMutation(obj);
        v46 = v7;
        v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x1E0D80008]);
        v10 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "lastEntryDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v9, "initWithEntryKey:withDate:", v10, v11);

        v49 = v12;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("timestampEnd"));
        if (objc_msgSend(v8, "count"))
        {
          v13 = 0;
          v48 = 0;
          while (1)
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", v13, v42);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "unsignedLongLongValue");

            objc_msgSend(v5, "schema");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "columns");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "type");

            objc_msgSend(v5, "schema");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "columns");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", v13);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "valueID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "unsignedLongLongValue");

            if (v19 == 2)
              break;
            if (v19 == 1)
            {
              objc_msgSend(v5, "schema");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "columns");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectAtIndexedSubscript:", v13);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "statID");

              if (v28 == 1)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v49;
                v31 = v29;
                v32 = CFSTR("APWakeTime");
                goto LABEL_14;
              }
              if (!v15)
                goto LABEL_16;
              v33 = (void *)qword_1ED884CF0;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v24);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectForKeyedSubscript:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v35)
              {
                objc_msgSend(*(id *)(a1 + 40), "addToLookupTableAndCache:forEntryKey:andLookupMap:", v24, cpuClusterAccumulatorsLookupEntryKey, qword_1ED884CF0);
                PLLogCLPC();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = v42;
                  v57 = v24;
                  _os_log_fault_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_FAULT, "Missing CPU Cluster Accumulators lookup entry for ID %llu:", buf, 0xCu);
                }

              }
              v54 = CFSTR("ObfuscatedID");
              v37 = (void *)qword_1ED884CF0;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v24);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectForKeyedSubscript:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v39;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
              v40 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setObject:forKeyedSubscript:", v29, v40);
              v48 = (void *)v40;
LABEL_15:

            }
LABEL_16:
            if (objc_msgSend(v8, "count") <= (unint64_t)++v13)
              goto LABEL_25;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v49;
          v31 = v29;
          v32 = CFSTR("ClusterIndex");
LABEL_14:
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, v32);
          goto LABEL_15;
        }
        v48 = 0;
LABEL_25:
        objc_msgSend(*(id *)(a1 + 40), "logEntry:", v49, v42);

        v7 = v46 + 1;
      }
      while (v46 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (!v45)
      {
LABEL_27:

        break;
      }
    }
  }

  return 1;
}

uint64_t __38__PLCLPCAgent_logCLPCLostPerformance___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  __int128 v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  __int128 v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[2];
  _QWORD v64[2];
  uint8_t buf[4];
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a2 == 4)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v58 = v4;
    objc_msgSend(v4, "rows");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v52)
    {
      v51 = *(_QWORD *)v60;
      v6 = 0x1E0CB3000uLL;
      *(_QWORD *)&v5 = 134217984;
      v49 = v5;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v60 != v51)
            objc_enumerationMutation(obj);
          v53 = v7;
          v8 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v7);
          v9 = objc_alloc(MEMORY[0x1E0D80008]);
          v10 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "lastEntryDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v9, "initWithEntryKey:withDate:", v10, v11);

          v56 = v12;
          objc_msgSend(v12, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("timestampEnd"));
          if (objc_msgSend(v8, "count"))
          {
            v13 = 0;
            v55 = 0;
            v57 = 0;
            while (2)
            {
              v14 = v6;
              objc_msgSend(v8, "objectAtIndexedSubscript:", v13, v49);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "unsignedLongLongValue");

              objc_msgSend(v58, "schema");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "columns");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectAtIndexedSubscript:", v13);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "type");

              objc_msgSend(v58, "schema");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "columns");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectAtIndexedSubscript:", v13);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "valueID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "unsignedLongLongValue");

              v6 = v14;
              switch(v20)
              {
                case 1:
                  objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedLongLong:", v16);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v56;
                  v28 = v26;
                  v29 = CFSTR("APWakeTime");
                  goto LABEL_23;
                case 2:
                  objc_msgSend(v58, "schema");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "columns");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "objectAtIndexedSubscript:", v13);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "metadataType");

                  if (v43 == 2)
                  {
                    objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedLongLong:", v16);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = v56;
                    v28 = v26;
                    v29 = CFSTR("DeviceType");
                  }
                  else
                  {
                    objc_msgSend(v58, "schema");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "columns");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "objectAtIndexedSubscript:", v13);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = objc_msgSend(v46, "metadataType");

                    if (v47 != 1)
                      goto LABEL_24;
                    objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedLongLong:", v16);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = v56;
                    v28 = v26;
                    v29 = CFSTR("ClusterIndex");
                  }
LABEL_23:
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, v29);

LABEL_24:
                  if (objc_msgSend(v8, "count") <= (unint64_t)++v13)
                    goto LABEL_28;
                  continue;
                case 3:
                  v57 = v16;
                  goto LABEL_24;
                case 4:
                  if (v57)
                  {
                    v30 = (void *)qword_1ED884CE0;
                    objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedLongLong:", v25);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "objectForKeyedSubscript:", v31);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v32)
                    {
                      objc_msgSend(*(id *)(a1 + 40), "addToLookupTableAndCache:forEntryKey:andLookupMap:", v25, lostPerformanceLookupEntryKey, qword_1ED884CE0);
                      PLLogCLPC();
                      v33 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = v49;
                        v66 = v25;
                        _os_log_fault_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_FAULT, "Missing Lost Performance lookup entry for ID %llu:", buf, 0xCu);
                      }

                    }
                    v63[0] = CFSTR("ObfuscatedID");
                    v34 = (void *)qword_1ED884CE0;
                    objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedLongLong:", v25);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "objectForKeyedSubscript:", v35);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v63[1] = CFSTR("Transitions");
                    v64[0] = v36;
                    objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedLongLong:", v16);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v64[1] = v37;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
                    v38 = objc_claimAutoreleasedReturnValue();

                    objc_msgSend(*(id *)(v14 + 2024), "numberWithUnsignedLongLong:", v57);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "setObject:forKeyedSubscript:", v39, v38);

                    v57 = 0;
                    v55 = (void *)v38;
                  }
                  else
                  {
                    v57 = 0;
                  }
                  goto LABEL_24;
                default:
                  v6 = v14;
                  goto LABEL_24;
              }
            }
          }
          v55 = 0;
LABEL_28:
          objc_msgSend(*(id *)(a1 + 40), "logEntry:", v56, v49);

          v7 = v53 + 1;
        }
        while (v53 + 1 != v52);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v52);
    }

    v4 = v58;
  }

  return 1;
}

- (NSDate)lastEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

void __34__PLCLPCAgent_setupThermalMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLLogCLPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Source"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Source"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", &unk_1E86346F8);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "provider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "readDeltaStats:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 80);
      *(_QWORD *)(v11 + 80) = v10;

      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "logCLPCLostPerformance:", v13);
        objc_msgSend(*(id *)(a1 + 32), "logCLPCStatsAccumulators:", v13);
        objc_msgSend(*(id *)(a1 + 32), "logCLPCCPUClusterAccumulators:", v13);
        objc_msgSend(*(id *)(a1 + 32), "setLastEntryDate:", v13);
      }
      else
      {
        PLLogCLPC();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v14) = 0;
          _os_log_error_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_ERROR, "readDeltaStats failed to return results in ThermalMonitor", (uint8_t *)&v14, 2u);
        }
      }

    }
  }

}

- (void)setLastEntryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CLPCReportingAccess)provider
{
  return (CLPCReportingAccess *)objc_getProperty(self, a2, 64, 1);
}

- (void)logCLPCStatsAccumulators:(id)a3
{
  id v4;
  void *v5;
  CLPCReportingReadResult *readResults;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PLCLPCAgent *v11;
  id v12;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLCLPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("Accumulators"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  readResults = self->_readResults;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__PLCLPCAgent_logCLPCStatsAccumulators___block_invoke;
  v9[3] = &unk_1E85800A8;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  -[CLPCReportingReadResult enumerate:](readResults, "enumerate:", v9);

}

- (void)logCLPCLostPerformance:(id)a3
{
  id v4;
  void *v5;
  CLPCReportingReadResult *readResults;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PLCLPCAgent *v11;
  id v12;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLCLPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("LostPerformance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  readResults = self->_readResults;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PLCLPCAgent_logCLPCLostPerformance___block_invoke;
  v9[3] = &unk_1E85800A8;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  -[CLPCReportingReadResult enumerate:](readResults, "enumerate:", v9);

}

- (void)logCLPCCPUClusterAccumulators:(id)a3
{
  id v4;
  void *v5;
  CLPCReportingReadResult *readResults;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PLCLPCAgent *v11;
  id v12;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLCLPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("CPUClusterAccumulators"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  readResults = self->_readResults;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PLCLPCAgent_logCLPCCPUClusterAccumulators___block_invoke;
  v9[3] = &unk_1E85800A8;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  -[CLPCReportingReadResult enumerate:](readResults, "enumerate:", v9);

}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLCLPCAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLCLPCAgent)init
{
  PLCLPCAgent *v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[16];

  if ((shouldUseNewCLPCPath() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)PLCLPCAgent;
    self = -[PLAgent init](&v6, sel_init);
    v3 = self;
  }
  else
  {
    PLLogCLPC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "New CLPC path is not available", buf, 2u);
    }

    v3 = 0;
  }

  return v3;
}

+ (id)entryEventNoneDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("LostPerformanceLookup");
  objc_msgSend(a1, "entryEventNoneLostPerformanceLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("AccumulatorsLookup");
  objc_msgSend(a1, "entryEventNoneAccumulatorsLookup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("CPUClusterAccumulatorsLookup");
  objc_msgSend(a1, "entryEventNoneCPUClusterAccumulatorsLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventNoneLostPerformanceLookup
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80340];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E86535A0;
  v12[1] = &unk_1E86346E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("ObfuscatedValue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventNoneAccumulatorsLookup
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80340];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E86535A0;
  v12[1] = &unk_1E86346E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("ObfuscatedValue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventNoneCPUClusterAccumulatorsLookup
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80340];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E86535B0;
  v12[1] = &unk_1E86346E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("ObfuscatedValue");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("LostPerformance");
  objc_msgSend(a1, "entryEventIntervalDefinitionLostPerformance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("Accumulators");
  objc_msgSend(a1, "entryEventIntervalDefinitionAccumulators");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("CPUClusterAccumulators");
  objc_msgSend(a1, "entryEventIntervalDefinitionCPUClusterAccumulators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventIntervalDefinitionLostPerformance
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[5];

  v32[3] = *MEMORY[0x1E0C80C00];
  v31[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v29[0] = *MEMORY[0x1E0D80318];
  v29[1] = v2;
  v30[0] = &unk_1E86535B0;
  v30[1] = MEMORY[0x1E0C9AAB0];
  v29[2] = *MEMORY[0x1E0D802A8];
  v30[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v22;
  v31[1] = *MEMORY[0x1E0D802F0];
  v27[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_DateFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v20;
  v27[1] = CFSTR("DeviceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  v27[2] = CFSTR("ClusterIndex");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v16;
  v27[3] = CFSTR("APWakeTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v3;
  v31[2] = *MEMORY[0x1E0D802B0];
  v25[0] = CFSTR("key");
  v23[0] = CFSTR("ObfuscatedID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("Transitions");
  v24[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = CFSTR("value");
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitionAccumulators
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[5];

  v26[3] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1E86535B0;
  v24[1] = MEMORY[0x1E0C9AAB0];
  v23[2] = *MEMORY[0x1E0D802A8];
  v24[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_DateFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("APWakeTime");
  v22[0] = v14;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v5;
  v25[2] = *MEMORY[0x1E0D802B0];
  v19[0] = CFSTR("key");
  v17 = CFSTR("ObfuscatedID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("value");
  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitionCPUClusterAccumulators
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[5];

  v28[3] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1E86535B0;
  v26[1] = MEMORY[0x1E0C9AAB0];
  v25[2] = *MEMORY[0x1E0D802A8];
  v26[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_DateFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v23[1] = CFSTR("ClusterIndex");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v14;
  v23[2] = CFSTR("APWakeTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v5;
  v27[2] = *MEMORY[0x1E0D802B0];
  v21[0] = CFSTR("key");
  v19 = CFSTR("ObfuscatedID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("value");
  v22[0] = v8;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)initOperatorDependancies
{
  CLPCReportingAccess *v3;
  id v4;
  CLPCReportingAccess *provider;
  NSObject *v6;
  CLPCReportingStatSelection *v7;
  CLPCReportingStatSelection *selection;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  CLPCReportingReadResult *v15;
  CLPCReportingReadResult *readResults;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0D70A18], "createClient:", &v19);
  v3 = (CLPCReportingAccess *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  provider = self->_provider;
  self->_provider = v3;

  if (v4)
  {
    PLLogCLPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      return;
    }
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    v11 = "Error creating CLPC client %@";
LABEL_18:
    _os_log_error_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
    goto LABEL_3;
  }
  v7 = (CLPCReportingStatSelection *)objc_opt_new();
  selection = self->_selection;
  self->_selection = v7;

  if (!self->_selection)
  {
    PLLogCLPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v13 = "Error creating selection";
LABEL_21:
    _os_log_error_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_22;
  }
  if (!-[PLCLPCAgent configureLostPerformance](self, "configureLostPerformance"))
  {
    PLLogCLPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v13 = "Lost Performance configuration failed";
    goto LABEL_21;
  }
  if (!-[PLCLPCAgent configureAccumulators](self, "configureAccumulators"))
  {
    PLLogCLPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v13 = "Accumulators configuration failed";
    goto LABEL_21;
  }
  if (!-[PLCLPCAgent configureCPUClusterAccumulators](self, "configureCPUClusterAccumulators"))
  {
    PLLogCLPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v13 = "CPU CLuster Accumulators configuration failed";
    goto LABEL_21;
  }
  -[PLCLPCAgent provider](self, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCLPCAgent selection](self, "selection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v9, "enableStats:error:", v10, &v18);
  v4 = v18;

  if (v4)
  {
    PLLogCLPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    v11 = "enableStats failed with %@";
    goto LABEL_18;
  }
  -[PLCLPCAgent setEntryKeys](self, "setEntryKeys");
  -[PLCLPCAgent provider](self, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "readDeltaStats:", 0);
  v15 = (CLPCReportingReadResult *)objc_claimAutoreleasedReturnValue();
  readResults = self->_readResults;
  self->_readResults = v15;

  if (self->_readResults)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCLPCAgent setLastEntryDate:](self, "setLastEntryDate:", v17);

    -[PLCLPCAgent createLookupMaps](self, "createLookupMaps");
    -[PLCLPCAgent setupTimer](self, "setupTimer");
    -[PLCLPCAgent setupThermalMonitor](self, "setupThermalMonitor");
    return;
  }
  PLLogCLPC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v13 = "readDeltaStats failed to return results";
    goto LABEL_21;
  }
LABEL_22:

}

- (BOOL)configureLostPerformance
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PLCLPCAgent selection](self, "selection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "selectStatsOfSchema:error:", 4, &v6);
  v3 = v6;

  if (v3)
  {
    PLLogCLPC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_ERROR, "selectStat for Lost Perf failed with %@", buf, 0xCu);
    }

  }
  return v3 == 0;
}

- (BOOL)configureAccumulators
{
  void *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PLCLPCAgent selection](self, "selection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v3, "selectStat:error:", 0x100000000, &v16);
  v4 = v16;

  if (v4)
  {
    PLLogCLPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      v6 = "selectStat failed for Package Power Zone with %@";
LABEL_16:
      _os_log_error_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
    }
  }
  else
  {
    -[PLCLPCAgent selection](self, "selection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v7, "selectStat:error:", 0x100000002, &v15);
    v4 = v15;

    if (v4)
    {
      PLLogCLPC();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        v6 = "selectStat failed for Package Energy Estimate with %@";
        goto LABEL_16;
      }
    }
    else
    {
      -[PLCLPCAgent selection](self, "selection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v8, "selectStat:error:", 0x100000003, &v14);
      v4 = v14;

      if (v4)
      {
        PLLogCLPC();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v4;
          v6 = "selectStat failed for CPU Energy Estimate with %@";
          goto LABEL_16;
        }
      }
      else
      {
        -[PLCLPCAgent selection](self, "selection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        objc_msgSend(v9, "selectStat:error:", 0x100000004, &v13);
        v4 = v13;

        if (v4)
        {
          PLLogCLPC();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v4;
            v6 = "selectStat failed for ANE Energy Estimate with %@";
            goto LABEL_16;
          }
        }
        else
        {
          -[PLCLPCAgent selection](self, "selection");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          objc_msgSend(v10, "selectStat:error:", 0x100000005, &v12);
          v4 = v12;

          if (!v4)
            return 1;
          PLLogCLPC();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v4;
            v6 = "selectStat failed for GPU Energy Estimate with %@";
            goto LABEL_16;
          }
        }
      }
    }
  }

  return 0;
}

- (BOOL)configureCPUClusterAccumulators
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PLCLPCAgent selection](self, "selection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "selectStatsOfSchema:error:", 3, &v6);
  v3 = v6;

  if (v3)
  {
    PLLogCLPC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_ERROR, "selectStat failed for CPU Cluster Accumulator with %@", buf, 0xCu);
    }

  }
  return v3 == 0;
}

- (void)setEntryKeys
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = *MEMORY[0x1E0D80388];
  +[PLOperator entryKeyForType:andName:](PLCLPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("LostPerformanceLookup"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)lostPerformanceLookupEntryKey;
  lostPerformanceLookupEntryKey = v3;

  +[PLOperator entryKeyForType:andName:](PLCLPCAgent, "entryKeyForType:andName:", v2, CFSTR("AccumulatorsLookup"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)accumulatorsLookupEntryKey;
  accumulatorsLookupEntryKey = v5;

  +[PLOperator entryKeyForType:andName:](PLCLPCAgent, "entryKeyForType:andName:", v2, CFSTR("CPUClusterAccumulatorsLookup"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)cpuClusterAccumulatorsLookupEntryKey;
  cpuClusterAccumulatorsLookupEntryKey = v7;

}

- (void)createLookupMaps
{
  NSObject *v2;
  uint8_t v3[16];

  if (!-[PLCLPCAgent setupStats](self, "setupStats"))
  {
    PLLogCLPC();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_ERROR, "setupStats failed", v3, 2u);
    }

  }
}

- (BOOL)setupStats
{
  CLPCReportingReadResult *readResults;
  BOOL v3;
  _QWORD v5[7];
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__14;
  v6[4] = __Block_byref_object_dispose__14;
  v7 = 0;
  readResults = self->_readResults;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__PLCLPCAgent_setupStats__block_invoke;
  v5[3] = &unk_1E8580080;
  v5[5] = v6;
  v5[6] = &v8;
  v5[4] = self;
  -[CLPCReportingReadResult enumerate:](readResults, "enumerate:", v5);
  v3 = *((_BYTE *)v9 + 24) == 0;
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  return v3;
}

uint64_t __25__PLCLPCAgent_setupStats__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a2)
  {
    case 4:
      v6 = &lostPerformanceLookupEntryKey;
      goto LABEL_7;
    case 3:
      v6 = &cpuClusterAccumulatorsLookupEntryKey;
      goto LABEL_7;
    case 1:
      v6 = &accumulatorsLookupEntryKey;
LABEL_7:
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = (id)*v6;
      v9 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v8;

      objc_msgSend(v5, "schema");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "columns");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "constructCache:forEntryKey:", v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      goto LABEL_11;
  }
  PLLogCLPC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 134217984;
    v15 = a2;
    _os_log_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_INFO, "Enumerating on schema %lu not permitted", (uint8_t *)&v14, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_11:

  return 1;
}

- (void)setupTimer
{
  id v3;
  void *v4;
  void *v5;
  PLTimer *v6;
  PLTimer *tenMinuteTimer;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD v10[5];

  v3 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 600.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __25__PLCLPCAgent_setupTimer__block_invoke;
  v10[3] = &unk_1E8578078;
  v10[4] = self;
  v6 = (PLTimer *)objc_msgSend(v3, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v4, 1, 0, v5, v10, 600.0, 0.0);
  tenMinuteTimer = self->_tenMinuteTimer;
  self->_tenMinuteTimer = v6;

  PLLogCLPC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Initialized a timer for CLPC Stats", v9, 2u);
  }

}

void __25__PLCLPCAgent_setupTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  PLLogCLPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEBUG, "Fired the 10 minute timer for CLPC Stats", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readDeltaStats:", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "logCLPCLostPerformance:", v7);
    objc_msgSend(*(id *)(a1 + 32), "logCLPCStatsAccumulators:", v7);
    objc_msgSend(*(id *)(a1 + 32), "logCLPCCPUClusterAccumulators:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setLastEntryDate:", v7);
  }
  else
  {
    PLLogCLPC();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_ERROR, "readDeltaStats failed to return results in 10 minute Timer", v8, 2u);
    }
  }

}

- (void)setupThermalMonitor
{
  id v3;
  PLNSNotificationOperatorComposition *v4;
  PLNSNotificationOperatorComposition *thermalMonitorListener;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD v8[5];

  v3 = objc_alloc(MEMORY[0x1E0D80010]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__PLCLPCAgent_setupThermalMonitor__block_invoke;
  v8[3] = &unk_1E8577F48;
  v8[4] = self;
  v4 = (PLNSNotificationOperatorComposition *)objc_msgSend(v3, "initWithOperator:forNotification:withBlock:", self, CFSTR("PLThermalMonitorNotification"), v8);
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v4;

  PLLogCLPC();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "Initialized thermal monitor notification for CLPC Stats", v7, 2u);
  }

}

- (void)logLookupTable:(id)a3 withEntryKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PLCLPCAgent *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v33 = self;
  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "isEqualToString:", lostPerformanceLookupEntryKey))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v13, "type", v33) == 3)
          {
            objc_msgSend(v13, "valueID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("ObfuscatedValue"));
            objc_msgSend(v7, "addObject:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v10);
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", accumulatorsLookupEntryKey))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v35 = v5;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          if (objc_msgSend(v21, "type", v33) == 1 && objc_msgSend(v21, "statID") != 1)
          {
            objc_msgSend(v21, "valueID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("ObfuscatedValue"));
            objc_msgSend(v7, "addObject:", v23);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v18);
    }
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", cpuClusterAccumulatorsLookupEntryKey))
      goto LABEL_36;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v35 = v5;
    v24 = v5;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
          if (objc_msgSend(v29, "type", v33) == 1 && objc_msgSend(v29, "statID") != 1)
          {
            objc_msgSend(v29, "valueID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("ObfuscatedValue"));
            objc_msgSend(v7, "addObject:", v31);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v26);
    }
  }
  v5 = v35;

LABEL_36:
  if (objc_msgSend(v7, "count", v33))
  {
    v48 = v6;
    v49 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "logEntries:withGroupID:", v32, v6);

  }
}

- (void)createLookupCache:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entriesForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCLPC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v58 = (uint64_t)v3;
    v59 = 2048;
    v60 = objc_msgSend(v6, "count");
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Entries  in %@ lookup table %lu", buf, 0x16u);
  }

  if (objc_msgSend(v3, "isEqualToString:", lostPerformanceLookupEntryKey))
  {
    v41 = v3;
    v8 = objc_opt_new();
    v9 = (void *)qword_1ED884CE0;
    qword_1ED884CE0 = v8;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v40 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v51 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ObfuscatedValue"), v40);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v15, "entryID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)qword_1ED884CE0, "setObject:forKeyedSubscript:", v17, v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v12);
    }

    PLLogCLPC();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_34;
    *(_DWORD *)buf = 138412290;
    v58 = qword_1ED884CE0;
    v19 = "Lost Perf Lookup map is %@";
LABEL_33:
    _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0xCu);
LABEL_34:
    v6 = v40;
    v3 = v41;

    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", accumulatorsLookupEntryKey))
  {
    v41 = v3;
    v20 = objc_opt_new();
    v21 = (void *)qword_1ED884CE8;
    qword_1ED884CE8 = v20;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v40 = v6;
    v22 = v6;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ObfuscatedValue"), v40);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v27, "entryID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)qword_1ED884CE8, "setObject:forKeyedSubscript:", v29, v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v24);
    }

    PLLogCLPC();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_34;
    *(_DWORD *)buf = 138412290;
    v58 = qword_1ED884CE8;
    v19 = "Accumulators Lookup map is %@";
    goto LABEL_33;
  }
  if (objc_msgSend(v3, "isEqualToString:", cpuClusterAccumulatorsLookupEntryKey))
  {
    v41 = v3;
    v30 = objc_opt_new();
    v31 = (void *)qword_1ED884CF0;
    qword_1ED884CF0 = v30;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = v6;
    v32 = v6;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("ObfuscatedValue"), v40);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v37, "entryID"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)qword_1ED884CF0, "setObject:forKeyedSubscript:", v39, v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v34);
    }

    PLLogCLPC();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_34;
    *(_DWORD *)buf = 138412290;
    v58 = qword_1ED884CF0;
    v19 = "CPU Cluster Stats Accumulators Lookup map is %@";
    goto LABEL_33;
  }
LABEL_35:

}

- (void)constructCache:(id)a3 forEntryKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countOfEntriesForKey:", v6);

  if (!v9)
    -[PLCLPCAgent logLookupTable:withEntryKey:](self, "logLookupTable:withEntryKey:", v10, v6);
  -[PLCLPCAgent createLookupCache:](self, "createLookupCache:", v6);

}

- (void)addToLookupTableAndCache:(unint64_t)a3 forEntryKey:(id)a4 andLookupMap:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  PLLogCLPC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412290;
    v21 = (unint64_t)v8;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "adding a new lookup ID in %@", (uint8_t *)&v20, 0xCu);
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("ObfuscatedValue"));

  -[PLOperator logEntry:](self, "logEntry:", v11);
  PLLogCLPC();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v20 = 134218242;
    v21 = a3;
    v22 = 2112;
    v23 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "added lookup ID %llu in %@", (uint8_t *)&v20, 0x16u);
  }

  PLLogCLPC();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412290;
    v21 = (unint64_t)v9;
    _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "adding a new lookup ID in %@", (uint8_t *)&v20, 0xCu);
  }

  -[PLOperator storage](self, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastEntryForKey:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ObfuscatedValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "entryID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v17);

  PLLogCLPC();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412290;
    v21 = (unint64_t)v9;
    _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "Lookup map is %@", (uint8_t *)&v20, 0xCu);
  }

}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", lostPerformanceLookupEntryKey) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", accumulatorsLookupEntryKey) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", cpuClusterAccumulatorsLookupEntryKey))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ID < 0"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PLTimer)tenMinuteTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTenMinuteTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CLPCReportingStatSelection)selection
{
  return (CLPCReportingStatSelection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSelection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CLPCReportingReadResult)readResults
{
  return (CLPCReportingReadResult *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReadResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_readResults, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_tenMinuteTimer, 0);
  objc_storeStrong((id *)&self->_lastEntryDate, 0);
}

@end
