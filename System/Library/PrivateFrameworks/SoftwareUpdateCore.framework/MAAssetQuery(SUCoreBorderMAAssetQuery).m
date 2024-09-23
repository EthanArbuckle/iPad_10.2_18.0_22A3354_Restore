@implementation MAAssetQuery(SUCoreBorderMAAssetQuery)

- (void)SUCoreBorder_queryMetaDataWithError:()SUCoreBorderMAAssetQuery
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "begin:atFunction:", CFSTR("ma"), CFSTR("queryMetaDataWithError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4E050], "_SUCoreBorder_MAQueryResultAtBegin:withCompletion:", v6, v4);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__MAAssetQuery_SUCoreBorderMAAssetQuery__SUCoreBorder_queryMetaDataWithError___block_invoke;
    v7[3] = &unk_1EA877F98;
    v8 = v4;
    objc_msgSend(a1, "queryMetaDataWithError:", v7);

  }
}

- (id)SUCoreBorder_results
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "begin:atFunction:", CFSTR("ma"), CFSTR("results"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "_SUCoreBorder_results:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "end:atFunction:", CFSTR("ma"), CFSTR("results"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(a1, "_SUCoreBorder_results:", v6);
    else
      objc_msgSend(a1, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (void)_SUCoreBorder_MAQueryResultAtBegin:()SUCoreBorderMAAssetQuery withCompletion:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "simAction");
  if (v7 == 3)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 3;
      objc_msgSend(v8, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_MAQueryResultAtBegin"), CFSTR("com.apple.MobileAssetError.Query"), 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v5);
      objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAQueryResultAtBegin"), v11, 8113, 0);

      v10 = 0;
      v9 = 12;
    }

  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "completionQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__MAAssetQuery_SUCoreBorderMAAssetQuery___SUCoreBorder_MAQueryResultAtBegin_withCompletion___block_invoke;
  block[3] = &unk_1EA878010;
  v18 = v6;
  v19 = v9;
  v17 = v10;
  v14 = v10;
  v15 = v6;
  dispatch_async(v13, block);

}

+ (void)_SUCoreBorder_MAQueryResultAtEnd:()SUCoreBorderMAAssetQuery withResult:withError:withCompletion:
{
  id v9;
  void (**v10)(id, uint64_t, void *);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a5;
  v10 = a6;
  v11 = objc_msgSend(v15, "simAction");
  if (v11 == 3)
  {
    a4 = 0;
    v13 = 0;
    v12 = v9;
  }
  else
  {
    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DA8988], "sharedSimulator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = 3;
      objc_msgSend(v12, "generateError:ofDomain:withCode:", CFSTR("_SUCoreBorder_MAQueryResultAtEnd"), CFSTR("com.apple.MobileAssetError.Query"), 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v15);
      objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_MAQueryResultAtEnd"), v14, 8113, 0);
      v13 = v9;
    }

  }
  v10[2](v10, a4, v13);

}

- (id)_SUCoreBorder_results:()SUCoreBorderMAAssetQuery
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "simAction");
  if (v5 == 1)
    goto LABEL_5;
  if (v5 != 3)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v4);
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("_SUCoreBorder_results"), v8, 8113, 0);

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  objc_msgSend(a1, "_getQueryResultsForEvent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

- (id)_getQueryResultsForEvent:()SUCoreBorderMAAssetQuery
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  int isUpdateBrainAssetType;
  uint64_t v68;
  void *v69;

  v4 = a3;
  objc_msgSend(v4, "assetBuildVersions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "assetProductVersions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 == v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "_getQueryParamsForKey:", CFSTR("SUDocumentationID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_getQueryParamsForKey:", CFSTR("PrerequisiteBuild"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_getQueryParamsForKey:", CFSTR("PrerequisiteOSVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_getQueryParamsForKey:", CFSTR("ReleaseType"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "count");
    v60 = v10;
    if (v13 != objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("prerequisite Build/ProductVersion counts do not match (found build:%lu and product:%lu)"), objc_msgSend(v11, "count"), objc_msgSend(v12, "count"));
      objc_msgSend(v16, "trackAnomaly:forReason:withResult:withError:", CFSTR("_getQueryResultsForEvent"), v17, 8113, 0);
      v15 = 0;
      v18 = 0;
LABEL_46:

      goto LABEL_47;
    }
    v59 = v12;
    v68 = objc_msgSend(v10, "count");
    v14 = v11;
    if (v68)
    {
      objc_msgSend(MEMORY[0x1E0D4E050], "_getFirstNSStringEntryFromArray:", v10);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = 0;
    }
    objc_msgSend(a1, "assetType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    isUpdateBrainAssetType = _isUpdateBrainAssetType(v19);

    v11 = v14;
    if (objc_msgSend(v14, "count") == 1)
    {
      if (objc_msgSend(MEMORY[0x1E0D4E050], "_arrayContainsNSNull:", v14)
        && (objc_msgSend(MEMORY[0x1E0D4E050], "_arrayContainsNSNull:", v12) & 1) != 0)
      {
        v62 = 0;
        v63 = 0;
        HIDWORD(v65) = 0;
LABEL_16:
        LODWORD(v65) = 1;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0D4E050], "_getFirstNSStringEntryFromArray:", v14);
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4E050], "_getFirstNSStringEntryFromArray:", v12);
      v23 = objc_claimAutoreleasedReturnValue();
      v62 = (void *)v22;
      v63 = (void *)v23;
      if (v22 && v23)
      {
        v65 = 0x100000000;
LABEL_26:
        v58 = v11;
        if (v61 && objc_msgSend(v61, "count"))
        {
          objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v66 = 0;
        }
        objc_msgSend(v4, "assetBuildVersions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (v27)
        {
          v28 = 0;
          v18 = 0;
          v69 = v9;
          do
          {
            if ((_DWORD)v65)
            {
              objc_msgSend(a1, "assetType");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "assetBuildVersions");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectAtIndexedSubscript:", v28);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "assetProductVersions");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectAtIndexedSubscript:", v28);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              _getNewSoftwareUpdateMAAssetAttributesDictionary(v29, v31, v33, v66, 0, 0, 0);
              v34 = objc_claimAutoreleasedReturnValue();

              v9 = v69;
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E038]), "initWithAttributes:", v34);
              objc_msgSend(v69, "addObject:", v35);

              v18 = (void *)v34;
            }
            if (HIDWORD(v65))
            {
              objc_msgSend(a1, "assetType");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "assetBuildVersions");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectAtIndexedSubscript:", v28);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "assetProductVersions");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectAtIndexedSubscript:", v28);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              _getNewSoftwareUpdateMAAssetAttributesDictionary(v36, v38, v40, v66, v62, v63, 0);
              v41 = objc_claimAutoreleasedReturnValue();

              v9 = v69;
              v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E038]), "initWithAttributes:", v41);
              objc_msgSend(v69, "addObject:", v42);

              v18 = (void *)v41;
            }
            if (v68)
            {
              objc_msgSend(a1, "assetType");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "assetBuildVersions");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objectAtIndexedSubscript:", v28);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "assetProductVersions");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectAtIndexedSubscript:", v28);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              _getNewDocumentationMAAssetAttributesDictionary(v43, v45, v47, v64, 0);
              v48 = objc_claimAutoreleasedReturnValue();

              v9 = v69;
              v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E038]), "initWithAttributes:", v48);
              objc_msgSend(v69, "addObject:", v49);

              v18 = (void *)v48;
            }
            if (isUpdateBrainAssetType)
            {
              objc_msgSend(a1, "assetType");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "assetBuildVersions");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "objectAtIndexedSubscript:", v28);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              _getNewUpdateBrainMAAssetAttributesDictionary(v50, v52, 0);
              v53 = objc_claimAutoreleasedReturnValue();

              v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E038]), "initWithAttributes:", v53);
              objc_msgSend(v9, "addObject:", v54);

              v18 = (void *)v53;
            }
            ++v28;
            objc_msgSend(v4, "assetBuildVersions");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "count");

          }
          while (v28 < v56);
        }
        else
        {
          v18 = 0;
        }
        v15 = v9;

        v11 = v58;
        goto LABEL_44;
      }
    }
    else
    {
      if (objc_msgSend(v14, "count") != 2)
      {
        if (v68)
          v25 = 1;
        else
          v25 = isUpdateBrainAssetType;
        if ((v25 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No indication as to which simulated assets should be created"));
          objc_msgSend(v17, "trackAnomaly:forReason:withResult:withError:", CFSTR("_getQueryResultsForEvent"));
          v15 = 0;
          v18 = 0;
          goto LABEL_45;
        }
        v62 = 0;
        v63 = 0;
        v65 = 0;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0D4E050], "_getFirstNSStringEntryFromArray:", v14);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4E050], "_getFirstNSStringEntryFromArray:", v12);
      v21 = objc_claimAutoreleasedReturnValue();
      v62 = (void *)v20;
      v63 = (void *)v21;
      if (v20 && v21)
      {
        HIDWORD(v65) = 1;
        goto LABEL_16;
      }
    }
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trackAnomaly:forReason:withResult:withError:", CFSTR("_getQueryResultsForEvent"), CFSTR("prerequisite build/product version array contains invalid values"), 8113, 0);

    v15 = 0;
    v18 = 0;
LABEL_44:
    v17 = v62;
LABEL_45:

    v12 = v59;
    v16 = v64;
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("_getQueryResultsForEvent"), CFSTR("asset BuildVersions/ProductVersions must have the same count (please file a radar; the event should not have been created)"),
    8113,
    0);
  v15 = 0;
LABEL_47:

  return v15;
}

- (id)_getQueryParamsForKey:()SUCoreBorderMAAssetQuery
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "queryParams", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        if (v4)
        {
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "safeStringForKey:", CFSTR("queryKey"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if (v11)
          {
            objc_msgSend(v9, "safeObjectForKey:ofClass:", CFSTR("queryValue"), objc_opt_class());
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

+ (uint64_t)_arrayContainsNSNull:()SUCoreBorderMAAssetQuery
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)_getFirstNSStringEntryFromArray:()SUCoreBorderMAAssetQuery
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (__CFString)_translateBuildVersionToRestoreVersionTuple:()SUCoreBorderMAAssetQuery
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  uint64_t v27;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([0-9]+)([A-Z]{1})([0-9]+)([a-z]?)"), 0, &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = &stru_1EA87A8E8;
  if (!v6 && v8)
  {
    v11 = objc_msgSend(v8, "rangeAtIndex:", 1);
    objc_msgSend(v3, "substringWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = objc_msgSend(v9, "rangeAtIndex:", 2);
    objc_msgSend(v3, "substringWithRange:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%i"), objc_msgSend(v17, "characterAtIndex:", 0) - 64);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v9, "rangeAtIndex:", 3);
    objc_msgSend(v3, "substringWithRange:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v9, "rangeAtIndex:", 4);
    objc_msgSend(v3, "substringWithRange:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "isEqualToString:", &stru_1EA87A8E8) & 1) != 0)
    {
      v25 = CFSTR("0");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), objc_msgSend(v24, "characterAtIndex:", 0) - 96);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@.0.%@,0"), v13, v18, v21, v25);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

@end
