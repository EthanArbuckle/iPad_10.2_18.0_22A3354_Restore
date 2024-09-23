@implementation SUISRadarUtilities

+ (void)fileRadarWithCommand:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v24;
  void *v25;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v48[8];

  v48[7] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1838];
  v4 = a3;
  objc_msgSend(v4, "componentName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryItemWithName:value:", CFSTR("ComponentName"), v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v45;
  v5 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v4, "componentVersion");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItemWithName:value:", CFSTR("ComponentVersion"), v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v43;
  v6 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "componentID"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringValue");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("ComponentID"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v40;
  v7 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v4, "classification");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("Classification"), v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v8;
  v9 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v4, "reproducibility");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryItemWithName:value:", CFSTR("Reproducibility"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v11;
  v12 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v4, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryItemWithName:value:", CFSTR("Title"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v14;
  v15 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v4, "problemDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queryItemWithName:value:", CFSTR("Description"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v4, "extensionIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ExtensionIdentifiers"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v22);

  objc_msgSend(v4, "sections");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logResultSectionsWithSections:rankingManager:", v23, v24);

  objc_msgSend(v4, "sections");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "logRankingDiagnosticsWithSections:", v25);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resultSectionsFilePath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "path");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v28);

  objc_msgSend(a1, "rankingDiagnosticsFilePath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "path");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v30);

  +[SUISRadarUtilities filePathForCapturedScreenshot](SUISRadarUtilities, "filePathForCapturedScreenshot");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v26, "addObject:", v31);
  objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Attachments"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v33);

  v34 = (void *)objc_opt_new();
  objc_msgSend(v34, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v34, "setHost:", CFSTR("new"));
  objc_msgSend(v34, "setQueryItems:", v19);
  v35 = (void *)MEMORY[0x24BE85288];
  v36 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(v34, "URL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "punchoutWithURL:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "openPunchout:", v38);

}

+ (void)logResultSectionsWithSections:(id)a3 rankingManager:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  id obj;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v25 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", CFSTR("Results:\n"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v7)
  {
    v8 = v7;
    v27 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v6, "appendString:", CFSTR("\n"));
        objc_msgSend(v10, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("%@ <%@> maxInitiallyVisibleResults: %lu, isInitiallyHidden; %d\n"),
          v11,
          v12,
          objc_msgSend(v10, "maxInitiallyVisibleResults"),
          objc_msgSend(v10, "isInitiallyHidden"));

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v10, "results");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v30 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "ttrDescription");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendFormat:", CFSTR("\t%@"), v18);

              objc_msgSend(v6, "appendString:", CFSTR("\n"));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v15);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v8);
  }

  objc_msgSend(v25, "CEPValuesForTTR");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v19);

  SSDefaultsGetResources();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "getTTRLogs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v21);

  objc_msgSend(a1, "resultSectionsFilePath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v6, "writeToURL:atomically:encoding:error:", v22, 1, 10, &v28);
  v23 = v28;

  if (v23)
    NSLog(CFSTR("%@"), v23);

}

+ (void)logRankingDiagnosticsWithSections:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  id v45;
  id obj;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v60 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v10, "results");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v56 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "rankingItem");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pathToSpotlightFiles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "path");
  v19 = objc_claimAutoreleasedReturnValue();

  v43 = (void *)v19;
  v44 = v17;
  objc_msgSend(v17, "contentsOfDirectoryAtPath:error:", v19, 0);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(v45);
        v24 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
        objc_msgSend(a1, "rankingDiagnosticsFilePath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "pathComponents");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v24, "isEqualToString:", v27);

        if (v28)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v43, v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "removeItemAtPath:error:", v29, 0);

        }
      }
      v21 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    }
    while (v21);
  }
  objc_msgSend(a1, "rankingDiagnosticsFilePath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v31, "length"))
    {
      objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      v32 = json_writer_create_with_path();
      if (v32)
      {
        v33 = v32;
        json_writer_begin_array();
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v34 = v5;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v48;
          do
          {
            for (m = 0; m != v36; ++m)
            {
              if (*(_QWORD *)v48 != v37)
                objc_enumerationMutation(v34);
              v39 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * m);
              objc_msgSend(v39, "identifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "L2FeatureVector");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v40, "length"))
                v42 = v41 == 0;
              else
                v42 = 1;
              if (!v42)
              {
                json_writer_begin_dictionary();
                json_writer_add_key();
                objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
                json_writer_add_string();
                objc_msgSend(v41, "serializeToJSON:options:", v33, 2);
                json_writer_end_dictionary();
              }

            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
          }
          while (v36);
        }

        json_writer_end_array();
        json_writer_dispose();
      }
    }
  }

}

+ (id)pathToSpotlightFiles
{
  if (pathToSpotlightFiles_onceToken != -1)
    dispatch_once(&pathToSpotlightFiles_onceToken, &__block_literal_global_1);
  return (id)pathToSpotlightFiles_pathToSpotlightFiles;
}

void __42__SUISRadarUtilities_pathToSpotlightFiles__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(CFSTR("~/Library/Application Support/com.apple.spotlight/"), "stringByExpandingTildeInPath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:isDirectory:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)pathToSpotlightFiles_pathToSpotlightFiles;
  pathToSpotlightFiles_pathToSpotlightFiles = v1;

}

+ (id)rankingDiagnosticsFilePath
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUISRadarUtilities_rankingDiagnosticsFilePath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (rankingDiagnosticsFilePath_onceToken != -1)
    dispatch_once(&rankingDiagnosticsFilePath_onceToken, block);
  return (id)rankingDiagnosticsFilePath_rankingDiagnosticsFilePath;
}

void __48__SUISRadarUtilities_rankingDiagnosticsFilePath__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pathToSpotlightFiles");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Spotlight_Ranking_Diagnostic_Log.txt"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)rankingDiagnosticsFilePath_rankingDiagnosticsFilePath;
  rankingDiagnosticsFilePath_rankingDiagnosticsFilePath = v1;

}

+ (id)resultSectionsFilePath
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUISRadarUtilities_resultSectionsFilePath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (resultSectionsFilePath_onceToken != -1)
    dispatch_once(&resultSectionsFilePath_onceToken, block);
  return (id)resultSectionsFilePath_resultSectionsFilePath;
}

void __44__SUISRadarUtilities_resultSectionsFilePath__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pathToSpotlightFiles");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Spotlight_Result_Sections_Log.txt"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)resultSectionsFilePath_resultSectionsFilePath;
  resultSectionsFilePath_resultSectionsFilePath = v1;

}

+ (id)filePathForWrittenData:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v15;

  v5 = a4;
  v6 = a3;
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v6, "writeToURL:options:error:", v9, 1, &v15);

  v11 = v15;
  objc_msgSend(v9, "path");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if ((v10 & 1) == 0)
  {
    NSLog(CFSTR("Failed to write data to file %@ with error %@"), v12, v11);

    v13 = 0;
  }

  return v13;
}

+ (id)filePathForCapturedScreenshot
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  UIImage *v7;
  void *v8;
  void *v9;
  CGSize v11;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotViewAfterScreenUpdates:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frame");
  v11.width = v5;
  v11.height = v6;
  UIGraphicsBeginImageContextWithOptions(v11, 1, 0.0);
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  UIImagePNGRepresentation(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filePathForWrittenData:to:", v8, CFSTR("Spotlight-Tap-To-Radar-Screenshot.png"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)internalReleaseAgreementText
{
  return CFSTR("I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the images that I am providing with this bug report (“Images”), for the purpose of improving the machine vision capabilities of Apple products. Apple may not use the Images in any other fashion than as provided herein.  Please do not provide any images that contain third parties or for which you do not have sufficient rights.\n\nI represent that the Images are original to and/or owned by me and that I have the rights necessary to grant to Apple the rights provided herein.  I release Apple, its agents, employees, licensees and assigns from any and all claims I may have now or in the future for invasion of privacy, right of publicity, trademark infringement, copyright infringement, defamation or any other cause of action arising out of the use or reproduction of the Images.\n\nI have read and fully understand the foregoing and hereby acknowledge my agreement to its terms.");
}

+ (id)filePathForCapturedPhotosIndexInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD17D8]);
  objc_msgSend(v3, "setLaunchPath:", CFSTR("/bin/bash"));
  objc_msgSend(v3, "setArguments:", &unk_24E7449E0);
  objc_msgSend(MEMORY[0x24BDD1740], "pipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStandardOutput:", v4);
  objc_msgSend(v3, "launch");
  objc_msgSend(v3, "waitUntilExit");
  objc_msgSend(v4, "fileHandleForReading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readDataToEndOfFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "filePathForWrittenData:to:", v6, CFSTR("search_photos_index_status.txt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
