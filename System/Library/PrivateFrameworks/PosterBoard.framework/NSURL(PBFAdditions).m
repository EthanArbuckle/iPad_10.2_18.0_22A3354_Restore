@implementation NSURL(PBFAdditions)

- (BOOL)pbf_isGallerySnapshotURL
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  _QWORD v6[5];

  +[PBFPosterSnapshotDefinition defaultPreviewDefinitions](PBFPosterSnapshotDefinition, "defaultPreviewDefinitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__NSURL_PBFAdditions__pbf_isGallerySnapshotURL__block_invoke;
  v6[3] = &unk_1E86F4D20;
  v6[4] = a1;
  objc_msgSend(v2, "bs_firstObjectPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)pbf_isConfigurationSnapshotURL
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  _QWORD v6[5];

  +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions](PBFPosterSnapshotDefinition, "defaultConfigurationDefinitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__NSURL_PBFAdditions__pbf_isConfigurationSnapshotURL__block_invoke;
  v6[3] = &unk_1E86F4D20;
  v6[4] = a1;
  objc_msgSend(v2, "bs_firstObjectPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (uint64_t)pbf_isPosterSnapshot
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("RuntimeSnapshot"));
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("SNAPSHOT")) & 1) != 0 || v3)
  {
    objc_msgSend(v2, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FCE0], "defaultFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filenameExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "caseInsensitiveCompare:", v7);

    if (v8)
    {
      v4 = 0;
    }
    else if ((v3 & 1) != 0
           || (objc_msgSend(a1, "pbf_snapshotDefinitionForPosterSnapshotURL"),
               v4 = objc_claimAutoreleasedReturnValue(),
               (id)v4,
               v4))
    {
      v4 = 1;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)pbf_snapshotDefinitionForPosterSnapshotURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PBFSnapshotDefinitionForIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pbf_displayContextForPosterSnapshotURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((objc_msgSend(a1, "pbf_isGallerySnapshotURL") & 1) != 0
    || objc_msgSend(a1, "pbf_isConfigurationSnapshotURL"))
  {
    objc_msgSend(a1, "lastPathComponent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByDeletingPathExtension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v7, "length") < 2)
    {
      v8 = 0;
    }
    else
    {
      +[PBFGenericDisplayContext displayContextForPersistenceIdentifier:](PBFGenericDisplayContext, "displayContextForPersistenceIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)pbf_snapshotURLForPath:()PBFAdditions definition:configuredProperties:context:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL_PBFAdditions.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

    if (v12)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL_PBFAdditions.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayContext"));

      if (v13)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL_PBFAdditions.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("definition"));

  if (!v14)
    goto LABEL_10;
LABEL_4:
  if (v13)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL_PBFAdditions.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredProperties"));

LABEL_5:
  objc_msgSend(v11, "instanceURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v11;
  if (objc_msgSend(v12, "shouldBePersistedOnlyTemporarily"))
  {
    objc_msgSend(v11, "identityPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99E98];
    PFTemporaryDirectory();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPath:isDirectory:", v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v16, 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "absoluteURL");
    v21 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v21;
  }
  objc_msgSend(v12, "uniqueIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pbf_displayContextPersistenceIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistenceIdentifierWithComplications:", objc_msgSend(v12, "includesComplications"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-dC(%@)-cP(%@)"), v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FCE0], "defaultFormat");
  v35 = v13;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "filenameExtension");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "URLByAppendingPathComponent:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "URLByAppendingPathExtension:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)pbf_URLIsReachableAndConformsToAttributeValues:()PBFAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  id v20;

  v6 = a3;
  if (objc_msgSend(a1, "checkResourceIsReachableAndReturnError:", a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v7, "attributesOfItemAtPath:error:", v8, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;

    if (v10)
    {
      v11 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v10);
    }
    else
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __76__NSURL_PBFAdditions__pbf_URLIsReachableAndConformsToAttributeValues_error___block_invoke;
      v13[3] = &unk_1E86F5090;
      v14 = v9;
      v15 = &v16;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
      v11 = *((_BYTE *)v17 + 24) == 0;

      _Block_object_dispose(&v16, 8);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)pbf_URLConformsToExpectedResourceValues:()PBFAdditions error:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v20 = a4;
      v10 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          v22 = 0;
          v14 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v22, v12, &v21);
          v15 = v22;
          v16 = v21;
          v17 = v16;
          if (v14)
          {
            if ((objc_msgSend(v13, "isEqual:", v15) & 1) == 0)
              goto LABEL_17;
          }
          else if (v16)
          {
            if (v20)
              *v20 = objc_retainAutorelease(v16);
LABEL_17:

            v18 = 0;
            goto LABEL_18;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
          continue;
        break;
      }
    }
    v18 = 1;
LABEL_18:

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (uint64_t)pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues:()PBFAdditions URLsNotConformingToAttributes:error:
{
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void (**v12)(void *, _QWORD);
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;
  _QWORD aBlock[5];
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__5;
  v48 = __Block_byref_object_dispose__5;
  if (a4)
  {
    v49 = (id)objc_opt_new();
    *a4 = objc_retainAutorelease((id)v45[5]);
    v10 = 1;
  }
  else
  {
    v10 = 0;
    v49 = 0;
  }
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __130__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues_URLsNotConformingToAttributes_error___block_invoke;
  aBlock[3] = &unk_1E86F50B8;
  v43 = v10;
  aBlock[4] = &v44;
  v12 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(a1, "checkResourceIsReachableAndReturnError:", a5) & 1) != 0
    && (objc_msgSend(a1, "pbf_URLIsReachableAndConformsToAttributeValues:error:", v8, a5) & 1) != 0)
  {
    v41 = 0;
    v13 = *MEMORY[0x1E0C999D0];
    v14 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v41, *MEMORY[0x1E0C999D0], a5);
    v15 = v41;
    if ((v14 & 1) != 0)
    {
      v29 = v15;
      if ((objc_msgSend(v15, "BOOLValue") & 1) != 0)
      {
        v35 = 0;
        v36 = &v35;
        v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__5;
        v39 = __Block_byref_object_dispose__5;
        v40 = 0;
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v17);

        v18 = v29;
        objc_msgSend(v16, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v11;
        v34[1] = 3221225472;
        v34[2] = __130__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues_URLsNotConformingToAttributes_error___block_invoke_2;
        v34[3] = &unk_1E86F4538;
        v34[4] = &v35;
        objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", a1, v19, 0, v34);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v31 != v23)
                objc_enumerationMutation(v21);
              v25 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
              v26 = (void *)v36[5];
              if (v26)
              {
                if (a5)
                  *a5 = objc_retainAutorelease(v26);
LABEL_24:
                v12[2](v12, v25);
                v18 = v29;
                v27 = 0;
                goto LABEL_25;
              }
              if (!objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "pbf_URLIsReachableAndConformsToAttributeValues:error:", v8, a5))goto LABEL_24;
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
            v27 = 1;
            v18 = v29;
            if (v22)
              continue;
            break;
          }
        }
        else
        {
          v27 = 1;
        }
LABEL_25:

        _Block_object_dispose(&v35, 8);
      }
      else
      {
        v27 = 1;
        v18 = v29;
      }
    }
    else
    {
      v18 = v15;
      ((void (**)(void *, void *))v12)[2](v12, a1);
      v27 = 0;
    }

  }
  else
  {
    ((void (**)(void *, void *))v12)[2](v12, a1);
    v27 = 0;
  }

  _Block_object_dispose(&v44, 8);
  return v27;
}

- (uint64_t)pbf_recursivelyUpdateFileAttributes:()PBFAdditions error:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__5;
  v21[4] = __Block_byref_object_dispose__5;
  v22 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__NSURL_PBFAdditions__pbf_recursivelyUpdateFileAttributes_error___block_invoke;
  v20[3] = &unk_1E86F4538;
  v20[4] = v21;
  objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", a1, 0, 1, v20);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "path", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v6, v12, a4);

        if ((v13 & 1) == 0)
        {
          v14 = 0;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  _Block_object_dispose(v21, 8);
  return v14;
}

- (uint64_t)pbf_updateFileAttributes:()PBFAdditions error:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "setAttributes:ofItemAtPath:error:", v7, v9, a4);

  return v10;
}

- (BOOL)pbf_URLIsReachableAndConformToResourceValues:()PBFAdditions error:
{
  id v6;
  _BOOL8 v7;
  void *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  if (objc_msgSend(a1, "checkResourceIsReachableAndReturnError:", a4))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__5;
    v19 = __Block_byref_object_dispose__5;
    v20 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__NSURL_PBFAdditions__pbf_URLIsReachableAndConformToResourceValues_error___block_invoke;
    v10[3] = &unk_1E86F50E0;
    v10[4] = a1;
    v10[5] = &v15;
    v10[6] = &v11;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = *((_BYTE *)v12 + 24) == 0;
    if (*((_BYTE *)v12 + 24))
    {
      if (a4)
      {
        v8 = (void *)v16[5];
        if (v8)
          *a4 = objc_retainAutorelease(v8);
      }
    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues:()PBFAdditions URLsNotConformingToAttributes:error:
{
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void (**v12)(void *, _QWORD);
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;
  _QWORD aBlock[5];
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__5;
  v48 = __Block_byref_object_dispose__5;
  if (a4)
  {
    v49 = (id)objc_opt_new();
    *a4 = objc_retainAutorelease((id)v45[5]);
    v10 = 1;
  }
  else
  {
    v10 = 0;
    v49 = 0;
  }
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues_URLsNotConformingToAttributes_error___block_invoke;
  aBlock[3] = &unk_1E86F50B8;
  v43 = v10;
  aBlock[4] = &v44;
  v12 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(a1, "checkResourceIsReachableAndReturnError:", a5) & 1) != 0
    && (objc_msgSend(a1, "pbf_URLIsReachableAndConformToResourceValues:error:", v8, a5) & 1) != 0)
  {
    v41 = 0;
    v13 = *MEMORY[0x1E0C999D0];
    v14 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v41, *MEMORY[0x1E0C999D0], a5);
    v15 = v41;
    if ((v14 & 1) != 0)
    {
      v29 = v15;
      if ((objc_msgSend(v15, "BOOLValue") & 1) != 0)
      {
        v35 = 0;
        v36 = &v35;
        v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__5;
        v39 = __Block_byref_object_dispose__5;
        v40 = 0;
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v17);

        v18 = v29;
        objc_msgSend(v16, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v11;
        v34[1] = 3221225472;
        v34[2] = __129__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues_URLsNotConformingToAttributes_error___block_invoke_2;
        v34[3] = &unk_1E86F4538;
        v34[4] = &v35;
        objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", a1, v19, 0, v34);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v31 != v23)
                objc_enumerationMutation(v21);
              v25 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
              v26 = (void *)v36[5];
              if (v26)
              {
                if (a5)
                  *a5 = objc_retainAutorelease(v26);
LABEL_24:
                v12[2](v12, v25);
                v18 = v29;
                v27 = 0;
                goto LABEL_25;
              }
              if (!objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "pbf_URLIsReachableAndConformToResourceValues:error:", v8, a5))goto LABEL_24;
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
            v27 = 1;
            v18 = v29;
            if (v22)
              continue;
            break;
          }
        }
        else
        {
          v27 = 1;
        }
LABEL_25:

        _Block_object_dispose(&v35, 8);
      }
      else
      {
        v27 = 1;
        v18 = v29;
      }
    }
    else
    {
      v18 = v15;
      ((void (**)(void *, void *))v12)[2](v12, a1);
      v27 = 0;
    }

  }
  else
  {
    ((void (**)(void *, void *))v12)[2](v12, a1);
    v27 = 0;
  }

  _Block_object_dispose(&v44, 8);
  return v27;
}

- (uint64_t)pbf_recursivelyUpdateResourceValues:()PBFAdditions error:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__5;
  v24[4] = __Block_byref_object_dispose__5;
  v25 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __65__NSURL_PBFAdditions__pbf_recursivelyUpdateResourceValues_error___block_invoke;
  v23[3] = &unk_1E86F4538;
  v23[4] = v24;
  objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", a1, 0, 0, v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        v18 = 0;
        v13 = objc_msgSend(v12, "setResourceValues:error:", v6, &v18);
        v14 = v18;
        v15 = v14;
        if ((v13 & 1) == 0)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v14);

          v16 = 0;
          goto LABEL_13;
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_13:

  _Block_object_dispose(v24, 8);
  return v16;
}

+ (id)pbf_dataStoreURLForBaseURL:()PBFAdditions version:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;
  void *v11;

  if (a4 > 2)
  {
    v10 = a3;
    objc_msgSend(a1, "pbf_dataStoreVersionContainingURLForBaseURL:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = a3;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("PRDataStore_%lu"), a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (uint64_t)pbf_dataStoreVersionContainingURLForBaseURL:()PBFAdditions
{
  return objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("PRBPosterExtensionDataStore"), 1);
}

+ (id)pbf_dataStoreExtensionContainerURLForBaseURL:()PBFAdditions version:
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pbf_dataStoreExtensionContainerURLForVersionDataStoreURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)pbf_dataStoreExtensionContainerURLForVersionDataStoreURL:()PBFAdditions
{
  return objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Extensions"), 1);
}

+ (id)pbf_galleryCacheURLForBaseURL:()PBFAdditions version:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("GalleryCache"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)pbf_archivedDataStoreBaseURL
{
  if (pbf_archivedDataStoreBaseURL_onceToken != -1)
    dispatch_once(&pbf_archivedDataStoreBaseURL_onceToken, &__block_literal_global_14);
  return (id)pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL;
}

+ (id)pbf_dataStoreSQLiteDatabaseURLForBaseURL:()PBFAdditions version:
{
  void *v4;
  void *v6;

  if (a4 >= 0x3C)
  {
    objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "pbf_dataStoreSQLiteDatabaseURLForDataStoreURL:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)pbf_dataStoreSQLiteDatabaseURLForDataStoreURL:()PBFAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("PBFPosterExtensionDataStoreSQLiteDatabase"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("sqlite3"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pbf_switcherConfigurationOrderingURLForBaseURL:()PBFAdditions version:
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pbf_switcherConfigurationOrderingURLForDataStoreURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pbf_switcherConfigurationOrderingURLForDataStoreURL:()PBFAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("SwitcherConfigurationOrdering"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pbf_switcherSelectedConfigurationURLForBaseURL:()PBFAdditions version:
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pbf_dataStoreURLForBaseURL:version:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pbf_switcherSelectedConfigurationURLForDataStoreURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pbf_switcherSelectedConfigurationURLForDataStoreURL:()PBFAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("SelectedConfigurationIdentifier"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pbf_URLsMatchingFileName:()PBFAdditions beneathURL:error:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v24 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v6;
  objc_msgSend(v6, "URLByStandardizingPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C999D0];
  v31[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v10, 16, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v25 = 0;
        objc_msgSend(v17, "getResourceValue:forKey:error:", &v25, v9, 0);
        v18 = v25;
        if ((objc_msgSend(v18, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v17, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v5);

          if (v20)
            objc_msgSend(v24, "addObject:", v17);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(v24, "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
