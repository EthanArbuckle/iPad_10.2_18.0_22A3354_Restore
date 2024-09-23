@implementation RCCompositionComposedAssetWriter

- (RCCompositionComposedAssetWriter)initWithComposition:(id)a3
{
  id v5;
  RCCompositionComposedAssetWriter *v6;
  RCCompositionComposedAssetWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCCompositionComposedAssetWriter;
  v6 = -[RCCompositionComposedAssetWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_composition, a3);

  return v7;
}

- (void)cancel
{
  -[AVAssetExportSession cancelExport](self->_exportSession, "cancelExport");
}

- (float)progress
{
  AVAssetExportSession *exportSession;
  float result;

  exportSession = self->_exportSession;
  if (!exportSession)
    return 0.0;
  -[AVAssetExportSession progress](exportSession, "progress");
  return result;
}

- (void)writeCompositionWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  RCComposition *composition;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  id v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  _QWORD v34[4];
  id v35;
  RCCompositionComposedAssetWriter *v36;
  id v37;
  id v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCCompositionComposedAssetWriter.m"), 51, CFSTR("invalid parameter"));

  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__4;
  v54 = __Block_byref_object_dispose__4;
  v55 = 0;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke;
  v47[3] = &unk_1E769C998;
  v31 = v4;
  v48 = v31;
  v49 = &v50;
  v32 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B76918](v47);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[RCComposition composedFragments](self->_composition, "composedFragments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v6)
  {
    v30 = 1634492771;
    v7 = *(_QWORD *)v44;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v44 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v8), "AVOutputURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc(MEMORY[0x1E0C89A98]);
        v42 = 0;
        v11 = (void *)objc_msgSend(v10, "initForReading:error:", v9, &v42);
        v12 = v42;
        if (v11)
        {
          if (objc_msgSend(v11, "rc_audioFormat") == 1634492771)
          {

            goto LABEL_17;
          }
        }
        else
        {
          OSLogForCategory(CFSTR("Default"));
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v57 = "-[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:]";
            v58 = 2112;
            v59 = v12;
            _os_log_error_impl(&dword_1BD830000, v13, OS_LOG_TYPE_ERROR, "%s -- readError = %@", buf, 0x16u);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v6);
  }
  v30 = 1633772320;
LABEL_17:

  -[RCComposition composedAVURL](self->_composition, "composedAVURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v15, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v14, 1, &v41);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v41;
  v18 = (void *)v51[5];
  v51[5] = v16;

  if (v51[5])
  {
    -[RCComposition savedRecordingUUID](self->_composition, "savedRecordingUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend((id)v51[5], "URLByAppendingPathComponent:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLByAppendingPathExtension:", CFSTR("m4a"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      composition = self->_composition;
      v40 = 0;
      -[RCComposition compositionAssetForExport:](composition, "compositionAssetForExport:", &v40);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v40;
      v25 = v24;
      if (v23)
      {
        objc_msgSend(v14, "pathExtension");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_13;
        v34[3] = &unk_1E769C9E8;
        v35 = v14;
        v36 = self;
        v37 = v23;
        v38 = v21;
        v39 = v32;
        +[RCCaptureFormat AVAssetExportDetermineSettingsForExportingAsset:inputFormat:preferredOutputExtension:preferredFormat:completionHandler:](RCCaptureFormat, "AVAssetExportDetermineSettingsForExportingAsset:inputFormat:preferredOutputExtension:preferredFormat:completionHandler:", v37, v30, v26, v30, v34);

        v27 = v35;
      }
      else
      {
        RCGenericErrorWithUnderlyingError(v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v32)[2](v32, 0, v27);
      }

    }
    else
    {
      RCGenericErrorWithUnderlyingError(0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v32)[2](v32, 0, v21);
    }

  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:].cold.1();

    RCGenericErrorWithUnderlyingError(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v32)[2](v32, 0, v19);
  }

  _Block_object_dispose(&v50, 8);
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("RCSlowComposeDelay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v7, "sleepForTimeInterval:");
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v10);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);

  }
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[3];
  char v30;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC0]), "initWithAsset:presetName:", *(_QWORD *)(a1 + 48), v9);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 8);
    *(_QWORD *)(v13 + 8) = v12;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setOutputFileType:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setOutputURL:", *(_QWORD *)(a1 + 56));
    +[RCCaptureFormat AVAssetAuthoringMetadataWithComposition:](RCCaptureFormat, "AVAssetAuthoringMetadataWithComposition:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setMetadata:", v15);

  }
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(void **)(v16 + 8);
  if (v17)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__4;
    v27[4] = __Block_byref_object_dispose__4;
    v28 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_15;
    v21[3] = &unk_1E769C9C0;
    v21[4] = v16;
    v25 = v29;
    v26 = v27;
    v22 = *(id *)(a1 + 56);
    v23 = *(id *)(a1 + 32);
    v24 = *(id *)(a1 + 64);
    objc_msgSend(v17, "exportAsynchronouslyWithCompletionHandler:", v21);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);
  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_13_cold_1(v18);

    v19 = *(_QWORD *)(a1 + 64);
    RCGenericErrorWithUnderlyingError(0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);

  }
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_15(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  void (*v12)(void);
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;

  v2 = (uint64_t)(a1 + 4);
  if (objc_msgSend(*(id *)(a1[4] + 8), "status") == 4)
  {
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1[4] + 8), "error");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[9] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    OSLogForCategory(CFSTR("Default"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_15_cold_2(v2, (uint64_t)(a1 + 9), v6);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)v2 + 8), "status") == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[5];
    v9 = a1[6];
    v16 = 0;
    v10 = objc_msgSend(v7, "moveItemAtURL:toURL:error:", v8, v9, &v16);
    v11 = v16;

    if ((v10 & 1) != 0)
    {
      v12 = *(void (**)(void))(a1[7] + 16);
    }
    else
    {
      OSLogForCategory(CFSTR("Default"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_15_cold_1();

      v12 = *(void (**)(void))(a1[7] + 16);
    }
    v12();
  }
  else
  {
    v13 = a1[7];
    objc_msgSend(*(id *)(a1[4] + 8), "error");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    RCGenericErrorWithUnderlyingError(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
}

- (RCComposition)composition
{
  return self->_composition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_exportSession, 0);
}

- (void)writeCompositionWithCompletionBlock:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1BD830000, v0, OS_LOG_TYPE_FAULT, "%s -- ERROR: Unable to create temporary directory URLForDirectory error = %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_13_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:]_block_invoke";
  _os_log_error_impl(&dword_1BD830000, log, OS_LOG_TYPE_ERROR, "%s -- ERROR: Unable to compose recording - there was a problem determining export settings", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_15_cold_1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BD830000, v0, OS_LOG_TYPE_ERROR, "%s -- ERROR: moveError = %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __72__RCCompositionComposedAssetWriter_writeCompositionWithCompletionBlock___block_invoke_15_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v5 = 136315650;
  v6 = "-[RCCompositionComposedAssetWriter writeCompositionWithCompletionBlock:]_block_invoke";
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_1BD830000, log, OS_LOG_TYPE_ERROR, "%s -- ERROR: Unable to compose recording - _exportSession = %@, underlying error = %@", (uint8_t *)&v5, 0x20u);
}

@end
