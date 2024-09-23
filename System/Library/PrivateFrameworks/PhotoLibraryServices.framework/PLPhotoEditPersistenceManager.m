@implementation PLPhotoEditPersistenceManager

- (id)loadCompositionFrom:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 sidecarData:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id obj;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE buf[24];
  uint64_t v72;
  __int16 v73;
  void *v74;
  const __CFString *v75;
  NSObject *v76;
  _BYTE v77[128];
  uint64_t v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v13 = a4;
  v14 = a5;
  v58 = a6;
  v59 = a7;
  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoEditPersistenceManager.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v61 = v14;
  v62 = v13;
  if ((objc_msgSend(getPIPhotoEditHelperClass_62012(), "canInterpretDataWithFormatIdentifier:formatVersion:", v13, v14) & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v15 = (id *)getPIPhotoEditFormatIdentifierVideoSloMoSymbolLoc_ptr;
    v72 = getPIPhotoEditFormatIdentifierVideoSloMoSymbolLoc_ptr;
    if (!getPIPhotoEditFormatIdentifierVideoSloMoSymbolLoc_ptr)
    {
      v16 = PhotoImagingLibrary_61971();
      v15 = (id *)dlsym(v16, "PIPhotoEditFormatIdentifierVideoSloMo");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v15;
      getPIPhotoEditFormatIdentifierVideoSloMoSymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(buf, 8);
    if (v15)
    {
      v17 = *v15;
      if (objc_msgSend(v13, "isEqualToString:", v17))
      {

LABEL_14:
        v25 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0D76620], "deserialize:originator:format:formatVersion:error:", v60, *MEMORY[0x1E0D76598], v13, v14, v59);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v57, "adjustmentStack");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "adjustments");
        obj = (id)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
        if (!v27)
          goto LABEL_34;
        v28 = *(_QWORD *)v68;
        v29 = *MEMORY[0x1E0D765F0];
        v30 = *MEMORY[0x1E0D76610];
        v64 = *MEMORY[0x1E0D765E8];
        v65 = *MEMORY[0x1E0D765E0];
        v63 = *MEMORY[0x1E0D76608];
        while (1)
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v68 != v28)
              objc_enumerationMutation(obj);
            v32 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v31);
            objc_msgSend(v32, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isEqualToString:", v29);

            if (v34)
            {
              v35 = objc_opt_new();
              -[NSObject setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", CFSTR("SlowMotion"), CFSTR("identifier"));
              objc_msgSend(v32, "settings");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v36, CFSTR("settings"));

              -[NSObject setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
              objc_msgSend(v25, "addObject:", v35);
            }
            else
            {
              objc_msgSend(v32, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "isEqualToString:", v30);

              if (v38)
              {
                v35 = objc_opt_new();
                objc_msgSend(v32, "identifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v39, CFSTR("identifier"));

                objc_msgSend(v32, "settings");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v40, CFSTR("settings"));

                -[NSObject setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
                objc_msgSend(v25, "addObject:", v35);
              }
              else
              {
                objc_msgSend(v32, "identifier");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v41, "isEqualToString:", v65);

                if (!v42)
                  goto LABEL_29;
                objc_msgSend(v32, "settings");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "objectForKeyedSubscript:", v64);
                v35 = objc_claimAutoreleasedReturnValue();
                if (v35)
                {

                }
                else
                {
                  objc_msgSend(v32, "settings");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "objectForKeyedSubscript:", v63);
                  v35 = objc_claimAutoreleasedReturnValue();

                  if (!v35)
                  {
                    PLBackendGetLog();
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v32, "identifier");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "version");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "settings");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413058;
                      *(_QWORD *)&buf[4] = v62;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v47;
                      *(_WORD *)&buf[22] = 2112;
                      v72 = (uint64_t)v48;
                      v73 = 2112;
                      v74 = v49;
                      _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "PosterFrame adjustment has unexpected format, will not migrate: %@, %@, %@, %@", buf, 0x2Au);

                    }
                    goto LABEL_28;
                  }
                }
                v45 = (void *)objc_opt_new();
                objc_msgSend(v45, "setObject:forKeyedSubscript:", CFSTR("VideoPosterFrame"), CFSTR("identifier"));
                v75 = CFSTR("time");
                v76 = v35;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, CFSTR("settings"));

                objc_msgSend(v45, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
                objc_msgSend(v25, "addObject:", v45);

              }
            }
LABEL_28:

LABEL_29:
            ++v31;
          }
          while (v27 != v31);
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
          v27 = v50;
          if (!v50)
          {
LABEL_34:

            objc_msgSend(getPICompositionSerializerClass(), "deserializeCompositionFromAdjustments:metadata:formatIdentifier:formatVersion:error:", v25, MEMORY[0x1E0C9AA70], v62, v61, v59);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_36;
          }
        }
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v22 = (_QWORD *)getPIPhotoEditFormatIdentifierVideoSymbolLoc_ptr;
      v72 = getPIPhotoEditFormatIdentifierVideoSymbolLoc_ptr;
      if (!getPIPhotoEditFormatIdentifierVideoSymbolLoc_ptr)
      {
        v23 = PhotoImagingLibrary_61971();
        v22 = dlsym(v23, "PIPhotoEditFormatIdentifierVideo");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v22;
        getPIPhotoEditFormatIdentifierVideoSymbolLoc_ptr = (uint64_t)v22;
      }
      _Block_object_dispose(buf, 8);
      if (v22)
      {
        v24 = objc_msgSend(v13, "isEqualToString:", *v22);

        if (!v24)
        {
          objc_msgSend(getPICompositionSerializerClass(), "deserializeCompositionFromData:formatIdentifier:formatVersion:sidecarData:error:", v60, v13, v14, v58, a7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPIPhotoEditFormatIdentifierVideo(void)");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("PLPhotoEditPersistenceManager.m"), 45, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPIPhotoEditFormatIdentifierVideoSloMo(void)");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("PLPhotoEditPersistenceManager.m"), 43, CFSTR("%s"), dlerror());

    }
    __break(1u);
  }
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v78 = *MEMORY[0x1E0CB2D68];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot interpret adjustment data: %@ %@"), v13, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PLPhotoEditPersistenceManagerDomain"), 0, v20);
  *a7 = (id)objc_claimAutoreleasedReturnValue();

  v21 = 0;
LABEL_36:

  return v21;
}

- (id)loadPhotoEditData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 importProperties:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;

  v12 = a6;
  -[PLPhotoEditPersistenceManager loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:](self, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", a3, a4, a5, 0, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)objc_msgSend(getPIPhotoEditHelperClass_62012(), "newCompositionControllerWithComposition:", v13);
    objc_msgSend(v14, "setImageOrientation:", objc_msgSend(v12, "baseEXIFOrientation"));
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)loadMasterDimensionsFromPhotoEditData:(id)a3 outMasterWidth:(int64_t *)a4 outMasterHeight:(int64_t *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  *a4 = 0;
  *a5 = 0;
  v7 = a3;
  v14 = 0;
  objc_msgSend(getPICompositionSerializerClass(), "deserializeDictionaryFromData:error:", v7, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("masterWidth"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("masterHeight"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11 && v12)
      {
        *a4 = objc_msgSend(v11, "integerValue");
        *a5 = objc_msgSend(v13, "integerValue");
      }

    }
  }

}

- (id)debugDescriptionForAdjustmentData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v8;
  id v9;

  v3 = a3;
  if (v3)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0D76618], "decompressData:error:", v3, &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v4)
    {
      v8 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)debugDescriptionForPhotoEditData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  id v22;
  _QWORD v23[3];
  _QWORD v24[3];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(getPICompositionSerializerClass(), "canInterpretDataWithFormatIdentifier:formatVersion:", v8, v9))
  {
    v22 = 0;
    objc_msgSend(getPICompositionSerializerClass(), "deserializeCompositionFromData:formatIdentifier:formatVersion:error:", v7, v8, v9, &v22);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = v22;
    if (v10)
    {
      v25 = CFSTR("composition");
      v26[0] = v10;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = v22;
      objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v22;
      v21 = 0;
      objc_msgSend(getPICompositionSerializerClass(), "deserializeDictionaryFromData:error:", v7, &v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = CFSTR("error_specific");
      v18 = v21;
      objc_msgSend(v16, "debugDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v19;
      v24[1] = CFSTR("Failed to deserialize composition\n");
      v23[1] = CFSTR("error");
      v23[2] = CFSTR("envelopeDictionary");
      v24[2] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)dataFromCompositionController:(id)a3 outFormatIdentifier:(id *)a4 outFormatVersion:(id *)a5 exportProperties:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v8 = a6;
  objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleVersion"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_1E36789C0;
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  v35[0] = CFSTR("platform");
  v35[1] = CFSTR("buildNumber");
  v36[0] = CFSTR("iOS");
  v36[1] = v28;
  v35[2] = CFSTR("appVersion");
  v35[3] = CFSTR("schemaRevision");
  v36[2] = v14;
  v36[3] = &unk_1E375FA80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCompositionHelper validatedCompositionCopyFor:](PLCompositionHelper, "validatedCompositionCopyFor:", v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v17 = (void *)getPICompositionSerializerMetadataClass_softClass;
  v34 = getPICompositionSerializerMetadataClass_softClass;
  if (!getPICompositionSerializerMetadataClass_softClass)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __getPICompositionSerializerMetadataClass_block_invoke;
    v30[3] = &unk_1E3677580;
    v30[4] = &v31;
    __getPICompositionSerializerMetadataClass_block_invoke((uint64_t)v30);
    v17 = (void *)v32[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v31, 8);
  v19 = objc_alloc_init(v18);
  objc_msgSend(v19, "setWidth:", objc_msgSend(v8, "imageWidth"));
  objc_msgSend(v19, "setHeight:", objc_msgSend(v8, "imageHeight"));
  objc_msgSend(v19, "setOrientation:", objc_msgSend(v8, "baseEXIFOrientation"));
  v29 = 0;
  objc_msgSend(getPICompositionSerializerClass(), "serializeComposition:versionInfo:serializerMetadata:error:", v16, v15, v19, &v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v29;
  objc_msgSend(v20, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(v20, "formatIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v23, "copy");

  }
  if (a5)
  {
    objc_msgSend(v20, "formatVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = (id)objc_msgSend(v24, "copy");

  }
  return v22;
}

+ (BOOL)validateAdjustmentData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  PLPhotoEditPersistenceManager *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  char v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(PLPhotoEditPersistenceManager);
  -[PLPhotoEditPersistenceManager loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:](v12, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", v9, v10, v11, 0, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v14 = (void *)getNUSourceClass_softClass;
    v24 = getNUSourceClass_softClass;
    if (!getNUSourceClass_softClass)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __getNUSourceClass_block_invoke;
      v20[3] = &unk_1E3677580;
      v20[4] = &v21;
      __getNUSourceClass_block_invoke((uint64_t)v20);
      v14 = (void *)v22[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v21, 8);
    v16 = objc_alloc_init(v15);
    objc_msgSend(v16, "setAssetIdentifier:", CFSTR("validate"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("source"));
    objc_msgSend(v13, "schema");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "validateComposition:error:", v13, a6);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (unsigned)renderTypeForAdjustmentData:(id)a3 formatIdentifier:(id)a4 formatVersion:(id)a5
{
  id v7;
  id v8;
  id v9;
  PLPhotoEditPersistenceManager *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  unsigned __int8 v37;
  char v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t i;
  char v55;
  unsigned __int8 v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  PLPhotoEditPersistenceManager *v66;
  id v67;
  id v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PLPhotoEditPersistenceManager);
  v74 = 0;
  -[PLPhotoEditPersistenceManager loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:](v10, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", v7, v8, v9, 0, &v74);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v74;
  if (v11)
  {
    v67 = v9;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("autoLoop"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v64 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("enabled"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("flavor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
      {
        v19 = objc_msgSend(v17, "isEqualToString:", CFSTR("AutoLoop"));
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("LongExposure")))
          v19 |= 4u;
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("Mirror")))
          LODWORD(v14) = v19 | 8;
        else
          LODWORD(v14) = v19;
      }
      else
      {
        LODWORD(v14) = 0;
      }

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("depthEffect"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v20;
    if (v20)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("enabled"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      if (v22)
        LODWORD(v14) = v14 | 2;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("portraitVideo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v23;
    if (v23)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("enabled"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "BOOLValue");

      if (v25)
        LODWORD(v14) = v14 | 2;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("smartTone"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("smartColor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("whiteBalance"));
    v27 = objc_claimAutoreleasedReturnValue();
    v68 = v8;
    v65 = v12;
    v66 = v10;
    v59 = (void *)v27;
    if (v26 || v69 || v27)
    {
      v28 = (void *)v27;
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("enabled"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v29, "BOOLValue");

      objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("enabled"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v30, "BOOLValue");

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("enabled"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v31, "BOOLValue");

      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("auto"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "BOOLValue");

      objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("auto"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "BOOLValue");

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("auto"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "BOOLValue");

      if ((v60 ^ 1 | v33) == 1 && v57 ^ 1 | v35)
      {
        if (((v56 ^ 1 | v37) & 1) != 0)
          LODWORD(v14) = v14 | 0x100;
        v38 = (v56 ^ 1 | v37) ^ 1;
      }
      else
      {
        v38 = 1;
      }
      v55 = v38;
    }
    else
    {
      v55 = 0;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cropStraighten"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v39;
    if (v39)
    {
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("enabled"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "BOOLValue");

      if (v41)
        LODWORD(v14) = v14 | 0x200;
    }
    v61 = v26;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("effect"));
    v42 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("effect3D"));
    v43 = objc_claimAutoreleasedReturnValue();
    if (v42 | v43)
    {
      objc_msgSend((id)v42, "objectForKeyedSubscript:", CFSTR("enabled"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "BOOLValue");

      objc_msgSend((id)v43, "objectForKeyedSubscript:", CFSTR("enabled"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v44) = objc_msgSend(v46, "BOOLValue");

      if (v45 | v44)
        LODWORD(v14) = v14 | 0x400;
    }
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v11, "contents");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "allKeys");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v71;
      while (2)
      {
        v52 = v7;
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v71 != v51)
            objc_enumerationMutation(v48);
          if (!objc_msgSend(&unk_1E3763D70, "containsObject:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i)))
          {

            v7 = v52;
            goto LABEL_46;
          }
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
        v7 = v52;
        if (v50)
          continue;
        break;
      }
    }

    if ((v55 & 1) == 0)
      LODWORD(v14) = v14 | 0x800;
LABEL_46:

    v9 = v67;
    v8 = v68;
    v12 = v65;
    v10 = v66;
  }
  else
  {
    LODWORD(v14) = 0;
  }

  return v14;
}

@end
