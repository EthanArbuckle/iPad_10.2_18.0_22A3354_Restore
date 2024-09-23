@implementation SAReporter

+ (void)collectSAFAppSizeResults:(id)a3
{
  void (**v3)(id, uint64_t, uint64_t);
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[24];
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, uint64_t, uint64_t))a3;
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[SAReporter collectSAFAppSizeResults:].cold.4(v4, v5, v6, v7, v8, v9, v10, v11);

  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  v45 = 0;
  v12 = (void *)objc_opt_new();
  v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __39__SAReporter_collectSAFAppSizeResults___block_invoke;
  v36[3] = &unk_2518F3708;
  v38 = &v40;
  v39 = &v46;
  v14 = v13;
  v37 = v14;
  objc_msgSend(v12, "startObservingWithScanOptions:updateHandler:", 17889, v36);
  v15 = dispatch_time(0, 120000000000);
  if (dispatch_group_wait(v14, v15))
  {
    SALog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[SAReporter collectSAFAppSizeResults:].cold.3(v16);

    v17 = (void *)MEMORY[0x24BDD1540];
    v53 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Timeout reached while collecting SpaceAttributionFramework report"), &stru_2518F3CC8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 60, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v41[5];
    v41[5] = v21;

    v23 = 0;
    v24 = v41;
LABEL_11:
    v27 = v24[5];
    goto LABEL_12;
  }
  if (v41[5])
  {
    SALog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v41[5], "localizedDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[SAReporter collectSAFAppSizeResults:].cold.2(v26, (uint64_t)v52, v25);
    }

    v23 = 0;
    v24 = v41;
    goto LABEL_11;
  }
  SALog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    +[SAReporter collectSAFAppSizeResults:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);

  v27 = 0;
  v23 = v47[5];
LABEL_12:
  v3[2](v3, v23, v27);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

}

uint64_t __39__SAReporter_collectSAFAppSizeResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  id obj;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    SALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __39__SAReporter_collectSAFAppSizeResults___block_invoke_cold_1(a1 + 40, v7);
  }
  else
  {
    v63 = v6;
    objc_msgSend(v5, "appData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hiddenAppsData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clonesInfo");
    v66 = v5;
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v9;
    v65 = a1;
    v62 = v8;
    if (v8)
    {
      v7 = objc_opt_new();
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      obj = v8;
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
      if (v71)
      {
        v68 = *(_QWORD *)v91;
        v69 = v7;
        do
        {
          for (i = 0; i != v71; ++i)
          {
            if (*(_QWORD *)v91 != v68)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
            v76 = (void *)MEMORY[0x24BDBCE70];
            objc_msgSend(v11, "allObjects");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(obj, "objectForKeyedSubscript:", v11);
            v80 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v80, "fixedSize"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(obj, "objectForKeyedSubscript:", v11);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v78, "dataSize"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(obj, "objectForKeyedSubscript:", v11);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "numberWithUnsignedLongLong:", objc_msgSend(v73, "cloneSize"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(obj, "objectForKeyedSubscript:", v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "numberWithUnsignedLongLong:", objc_msgSend(v19, "purgeableSize"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "objectForKeyedSubscript:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "vendorName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "dictionaryWithObjectsAndKeys:", v74, CFSTR("Bundles"), v13, CFSTR("fixedSize"), v15, CFSTR("dataSize"), v17, CFSTR("cloneSize"), v20, CFSTR("purgeableSize"), v22, CFSTR("vendorName"), 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v69;
            -[NSObject addObject:](v69, "addObject:", v23);

          }
          v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
        }
        while (v71);
      }

      a1 = v65;
      v5 = v66;
      v9 = v64;
    }
    else
    {
      v7 = 0;
    }
    v70 = v7;
    if (v9)
    {
      v77 = (void *)objc_opt_new();
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v81 = v9;
      v79 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      if (v79)
      {
        v75 = *(_QWORD *)v87;
        do
        {
          for (j = 0; j != v79; ++j)
          {
            if (*(_QWORD *)v87 != v75)
              objc_enumerationMutation(v81);
            v25 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j);
            +[SAUtilities breakCommaSeparatedStringToComponents:](SAUtilities, "breakCommaSeparatedStringToComponents:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "objectForKeyedSubscript:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x24BDBCE70];
            objc_msgSend(v26, "allObjects");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v27, "fixedSize"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v27, "dataSize"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v27, "cloneSize"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v27, "purgeableSize"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "vendorName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v29, CFSTR("Bundles"), v30, CFSTR("fixedSize"), v31, CFSTR("dataSize"), v32, CFSTR("cloneSize"), v33, CFSTR("purgeableSize"), v34, CFSTR("vendorName"), 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v77, "addObject:", v35);
          }
          v79 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
        }
        while (v79);
      }

      a1 = v65;
      v5 = v66;
      v7 = v70;
    }
    else
    {
      v77 = 0;
    }
    if (v67)
    {
      v36 = (void *)objc_opt_new();
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v37 = v67;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v83;
        do
        {
          for (k = 0; k != v39; ++k)
          {
            if (*(_QWORD *)v83 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
            objc_msgSend(v37, "objectForKeyedSubscript:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v43, "count"))
            {
              objc_msgSend(v42, "allObjects");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "componentsJoinedByString:", CFSTR(","));
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v37, "objectForKeyedSubscript:", v42);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v46, v45);

            }
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
        }
        while (v39);
      }

      a1 = v65;
      v5 = v66;
      v7 = v70;
    }
    else
    {
      v36 = 0;
    }
    v47 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "diskCapacity"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "diskUsed"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "totalCDAvailable"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "totalPurgeableClones"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "dictionaryWithObjectsAndKeys:", v48, CFSTR("Disk Capacity"), v49, CFSTR("Disk Used"), v50, CFSTR("TotalCDAvailable"), v51, CFSTR("TotalPurgeableClones"), v7, CFSTR("Apps Data"), v77, CFSTR("Hidden Apps Data"), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "pathsList");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributionTags");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "FSPurgeableData");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appsList");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemDetails");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v52, CFSTR("App Sizer"), v53, CFSTR("Paths List"), v54, CFSTR("Attribution Tags"), v36, CFSTR("Clones Data"), v55, CFSTR("FS Purgeable Data"), v57, CFSTR("System Details"), v56, CFSTR("Apps List"), 0);
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v60 = *(void **)(v59 + 40);
    *(_QWORD *)(v59 + 40) = v58;

    v6 = v63;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return 1;
}

+ (void)reportSnapshot:(id)a3
{
  void (**v3)(id, _QWORD);
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = (void (**)(id, _QWORD))a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__SAReporter_reportSnapshot___block_invoke;
  v4[3] = &unk_2518F3730;
  v4[4] = &v5;
  v4[5] = &v11;
  +[SAReporter collectSAFAppSizeResults:](SAReporter, "collectSAFAppSizeResults:", v4);
  if (v12[5])
    v3[2](v3, 0);
  else
    v3[2](v3, v6[5]);
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

void __29__SAReporter_reportSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

+ (void)collectSAFAppSizeResults:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2478E3000, a1, a3, "%s: Finished collecting SpaceAttributionFramework report", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)collectSAFAppSizeResults:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315394;
  *(_QWORD *)(a2 + 4) = "+[SAReporter collectSAFAppSizeResults:]";
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_4(&dword_2478E3000, a3, (uint64_t)a3, "%s: Encountered an error while collecting SpaceAttributionFramework report: %@", (uint8_t *)a2);

}

+ (void)collectSAFAppSizeResults:(os_log_t)log .cold.3(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "+[SAReporter collectSAFAppSizeResults:]";
  _os_log_error_impl(&dword_2478E3000, log, OS_LOG_TYPE_ERROR, "%s: Timeout reached while collecting SpaceAttributionFramework report", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

+ (void)collectSAFAppSizeResults:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2478E3000, a1, a3, "%s: Started to collect SpaceAttributionFramework report...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __39__SAReporter_collectSAFAppSizeResults___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "+[SAReporter collectSAFAppSizeResults:]_block_invoke";
  v7 = 2112;
  v8 = v3;
  OUTLINED_FUNCTION_4(&dword_2478E3000, a2, v4, "%s: Encountered error while running app sizer: %@", (uint8_t *)&v5);

}

@end
