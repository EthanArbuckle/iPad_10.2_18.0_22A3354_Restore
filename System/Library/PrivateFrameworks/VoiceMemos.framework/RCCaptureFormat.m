@implementation RCCaptureFormat

+ (id)fileExtensionsSupported
{
  return &unk_1E76A9560;
}

+ (id)fileExtensionForIntermediateAssetCapture
{
  return CFSTR("m4a");
}

+ (id)fileExtensionForAssetExport
{
  return CFSTR("m4a");
}

+ (id)fileFormatsDirectlyImportable
{
  return &unk_1E76A9578;
}

+ (id)AVFileTypeUTIForFileExtension:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithTag:tagClass:conformingToType:", v5, *MEMORY[0x1E0CEC400], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RCCaptureFormat.m"), 46, CFSTR("unsupported file extension: %@"), v5);

  }
  return v7;
}

+ (id)AVMediaTypeForFileExtension:(id)a3
{
  uint64_t v3;
  id v4;
  int v5;
  id *v6;

  v3 = AVMediaTypeForFileExtension__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&AVMediaTypeForFileExtension__onceToken, &__block_literal_global_18);
  v5 = objc_msgSend((id)AVMediaTypeForFileExtension__videoTypes, "containsObject:", v4);

  v6 = (id *)MEMORY[0x1E0C8A808];
  if (!v5)
    v6 = (id *)MEMORY[0x1E0C8A7A0];
  return *v6;
}

void __47__RCCaptureFormat_AVMediaTypeForFileExtension___block_invoke()
{
  void *v0;

  v0 = (void *)AVMediaTypeForFileExtension__videoTypes;
  AVMediaTypeForFileExtension__videoTypes = (uint64_t)&unk_1E76A9590;

}

+ (id)AVAssetExportPresetForExportingToExtension:(id)a3 preferredFormat:(unsigned int)a4
{
  id *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("m4a")))
  {
    v5 = (id *)MEMORY[0x1E0C89EB0];
    if (a4 != 1634492771)
      v5 = (id *)MEMORY[0x1E0C89E18];
  }
  else
  {
    v5 = (id *)MEMORY[0x1E0C89E28];
  }
  return *v5;
}

+ (void)AVAssetExportDetermineSettingsForExportingAsset:(id)a3 inputFormat:(unsigned int)a4 preferredOutputExtension:(id)a5 preferredFormat:(unsigned int)a6 completionHandler:(id)a7
{
  uint64_t v8;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a4;
  v17 = a3;
  v12 = a5;
  v13 = a7;
  objc_msgSend(a1, "fileExtensionsSupported");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(a1, "fileExtensionForAssetExport");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObject:", v16);
  objc_msgSend(v15, "insertObject:atIndex:", v16, 0);
  if (objc_msgSend(v12, "length") && (objc_msgSend(v16, "isEqual:", v12) & 1) == 0)
  {
    objc_msgSend(v15, "removeObject:", v12);
    objc_msgSend(v15, "insertObject:atIndex:", v12, 0);
  }
  objc_msgSend(a1, "_AVAssetExportDetermineSettingsForExportingAsset:inputFormat:outputExtensionWithFallbacks:preferredFormat:completionHandler:", v17, v10, v15, v8, v13);

}

+ (void)_AVAssetExportDetermineSettingsForExportingAsset:(id)a3 inputFormat:(unsigned int)a4 outputExtensionWithFallbacks:(id)a5 preferredFormat:(unsigned int)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unsigned int v29;
  unsigned int v30;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "AVFileTypeUTIForFileExtension:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectAtIndex:", 0);
    v17 = (void *)MEMORY[0x1E0C8AFC0];
    v18 = *MEMORY[0x1E0C89E98];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __143__RCCaptureFormat__AVAssetExportDetermineSettingsForExportingAsset_inputFormat_outputExtensionWithFallbacks_preferredFormat_completionHandler___block_invoke;
    v22[3] = &unk_1E769D868;
    v29 = a4;
    v30 = a6;
    v27 = v14;
    v23 = v15;
    v24 = v16;
    v25 = v12;
    v28 = a1;
    v26 = v13;
    v19 = v16;
    v20 = v15;
    objc_msgSend(v17, "determineCompatibilityOfExportPreset:withAsset:outputFileType:completionHandler:", v18, v25, v19, v22);

  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[RCCaptureFormat _AVAssetExportDetermineSettingsForExportingAsset:inputFormat:outputExtensionWithFallbacks:preferredFormat:completionHandler:].cold.1((uint64_t)v12, v21);

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 0, 0, 0);
  }

}

void __143__RCCaptureFormat__AVAssetExportDetermineSettingsForExportingAsset_inputFormat_outputExtensionWithFallbacks_preferredFormat_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;

  if ((a2 & 1) != 0)
  {
    v3 = *(unsigned int *)(a1 + 84);
    if (*(_DWORD *)(a1 + 80) == (_DWORD)v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      return;
    }
  }
  else
  {
    v3 = *(unsigned int *)(a1 + 84);
  }
  +[RCCaptureFormat AVAssetExportPresetForExportingToExtension:preferredFormat:](RCCaptureFormat, "AVAssetExportPresetForExportingToExtension:preferredFormat:", *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C8AFC0];
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __143__RCCaptureFormat__AVAssetExportDetermineSettingsForExportingAsset_inputFormat_outputExtensionWithFallbacks_preferredFormat_completionHandler___block_invoke_2;
  v9[3] = &unk_1E769D840;
  v15 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v4;
  v16 = *(_QWORD *)(a1 + 72);
  v13 = *(id *)(a1 + 48);
  v17 = *(_DWORD *)(a1 + 80);
  v14 = *(id *)(a1 + 56);
  v18 = *(_DWORD *)(a1 + 84);
  v8 = v4;
  objc_msgSend(v5, "determineCompatibilityOfExportPreset:withAsset:outputFileType:completionHandler:", v8, v7, v6, v9);

}

uint64_t __143__RCCaptureFormat__AVAssetExportDetermineSettingsForExportingAsset_inputFormat_outputExtensionWithFallbacks_preferredFormat_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 80), "_AVAssetExportDetermineSettingsForExportingAsset:inputFormat:outputExtensionWithFallbacks:preferredFormat:completionHandler:", *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 92), *(_QWORD *)(a1 + 72));
}

+ (id)AVAssetAuthoringMetadataWithCreationDate:(id)a3 title:(id)a4 uniqueID:(id)a5 musicMemoMetadata:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void **v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  RCNonUserGeneratedDeviceName();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  RCOperatingSystemVersionString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)*MEMORY[0x1E0C8A9F8];
  v17 = (void *)*MEMORY[0x1E0C8AB00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.VoiceMemos (%@ %@)"), v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = appendMDItem(v13, v16, v17, v18);

  if (v9)
    v20 = appendMDItem(v13, (void *)*MEMORY[0x1E0C8A9E0], (void *)*MEMORY[0x1E0C8A920], v9);
  if (v10)
    v21 = appendMDItem(v13, v16, (void *)*MEMORY[0x1E0C8AB18], v10);
  v22 = (void **)MEMORY[0x1E0C8AA00];
  if (v11)
    v23 = appendMDItem(v13, (void *)*MEMORY[0x1E0C8AA00], CFSTR("com.apple.iTunes.voice-memo-uuid"), v11);
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("musicMemoTextNote"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && objc_msgSend(v24, "length"))
      v26 = appendMDItem(v13, *v22, CFSTR("com.apple.iTunes.music-memo-note"), v25);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("musicMemoStarRating"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      v28 = appendMDItem(v13, *v22, CFSTR("com.apple.iTunes.music-memo-rating"), v27);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("musicMemoTags"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29 && objc_msgSend(v29, "length"))
      v31 = appendMDItem(v13, (void *)*MEMORY[0x1E0C8AA00], CFSTR("com.apple.iTunes.music-memo-tags"), v30);

  }
  return v13;
}

+ (id)AVAssetAuthoringMetadataWithCreationDate:(id)a3 title:(id)a4 uniqueID:(id)a5
{
  return (id)objc_msgSend(a1, "AVAssetAuthoringMetadataWithCreationDate:title:uniqueID:musicMemoMetadata:", a3, a4, a5, 0);
}

+ (id)AVAssetAuthoringMetadataWithComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "savedRecordingUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "musicMemoMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "AVAssetAuthoringMetadataWithCreationDate:title:uniqueID:musicMemoMetadata:", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)AVAssetAuthoringMetadataWithRecordingMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCCaptureFormat AVAssetAuthoringMetadataWithCreationDate:title:uniqueID:musicMemoMetadata:](RCCaptureFormat, "AVAssetAuthoringMetadataWithCreationDate:title:uniqueID:musicMemoMetadata:", v4, v5, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)_AVAssetExportDetermineSettingsForExportingAsset:(uint64_t)a1 inputFormat:(NSObject *)a2 outputExtensionWithFallbacks:preferredFormat:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "+[RCCaptureFormat _AVAssetExportDetermineSettingsForExportingAsset:inputFormat:outputExtensionWithFallbacks:prefe"
       "rredFormat:completionHandler:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1BD830000, a2, OS_LOG_TYPE_ERROR, "%s -- Unable to determine any output settings for asset %@", (uint8_t *)&v2, 0x16u);
}

@end
