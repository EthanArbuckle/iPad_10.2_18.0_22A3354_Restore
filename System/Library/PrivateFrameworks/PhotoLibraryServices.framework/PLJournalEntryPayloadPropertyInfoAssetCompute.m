@implementation PLJournalEntryPayloadPropertyInfoAssetCompute

- (PLJournalEntryPayloadPropertyInfoAssetCompute)initWithAnalysisStage:(signed __int16)a3 versionType:(int64_t)a4
{
  PLJournalEntryPayloadPropertyInfoAssetCompute *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLJournalEntryPayloadPropertyInfoAssetCompute;
  result = -[PLJournalEntryPayloadPropertyInfoAssetCompute init](&v7, sel_init);
  if (result)
  {
    result->_stage = a3;
    result->_versionType = a4;
  }
  return result;
}

- (PLJournalEntryPayloadPropertyInfoAssetCompute)initWithAnalysisStage:(signed __int16)a3
{
  return -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:](self, "initWithAnalysisStage:versionType:", a3, 0);
}

- (PLJournalEntryPayloadPropertyInfoAssetCompute)initWithAsset:(id)a3
{
  id v4;
  PLJournalEntryPayloadPropertyInfoAssetCompute *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  v5 = -[PLJournalEntryPayloadPropertyInfoAssetCompute initWithAnalysisStage:versionType:](self, "initWithAnalysisStage:versionType:", 0, 0);
  if (v5)
  {
    objc_msgSend(v4, "additionalAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sceneAnalysisVersion = (int)objc_msgSend(v6, "sceneAnalysisVersion");

    objc_msgSend(v4, "additionalAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_faceAnalysisVersion = (int)objc_msgSend(v7, "faceAnalysisVersion");

    objc_msgSend(v4, "mediaAnalysisAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mediaAnalysisVersion = objc_msgSend(v8, "mediaAnalysisVersion");

    objc_msgSend(v4, "mediaAnalysisAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mediaAnalysisImageVersion = (int)objc_msgSend(v9, "mediaAnalysisImageVersion");

    objc_msgSend(v4, "mediaAnalysisAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "characterRecognitionAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_characterRecognitionVersion = (int)objc_msgSend(v11, "algorithmVersion");

    objc_msgSend(v4, "mediaAnalysisAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "visualSearchAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_visualSearchVersion = (int)objc_msgSend(v13, "algorithmVersion");

    if (objc_msgSend(v4, "isPhoto"))
      v14 = objc_msgSend(v4, "isPhotoIris") ^ 1;
    else
      v14 = 0;
    v5->_isStillImage = v14;
  }

  return v5;
}

- (BOOL)validForPersistenceWithPayloadProperty:(id)a3 andValue:(id)a4 stop:(BOOL *)a5
{
  id v8;
  id v9;
  int v10;
  int v11;
  BOOL v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend((id)objc_opt_class(), "shouldExcludeDetectedFaces")
    && ((objc_msgSend(v8, "isEqualToKey:", CFSTR("detectedFaces")) & 1) != 0
     || (objc_msgSend(v8, "isEqualToKey:", CFSTR("temporalDetectedFaces")) & 1) != 0))
  {
    goto LABEL_11;
  }
  if ((objc_msgSend(v8, "isEqualToKey:", CFSTR("sceneClassifications")) & 1) != 0
    || objc_msgSend(v8, "isEqualToKey:", CFSTR("temporalSceneClassifications")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "classificationType");
      v11 = -[PLJournalEntryPayloadPropertyInfoAssetCompute stage](self, "stage");
      switch(v11)
      {
        case 100:
          goto LABEL_10;
        case 900:
          v12 = (v10 & 0xFFFFFFFD) == 0 || v10 == 3;
          goto LABEL_24;
        case 200:
LABEL_10:
          v12 = v10 == 0;
LABEL_24:
          v13 = v12;
          goto LABEL_27;
      }
LABEL_11:
      v13 = 0;
      goto LABEL_27;
    }
  }
  if (objc_msgSend(v8, "type") == 1000 && (unint64_t)objc_msgSend(v9, "length") > 0x100000)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v15;
      v22 = 2048;
      v23 = objc_msgSend(v9, "length");
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "[CCSS] Compute sync payload property value for %{public}@ exceeds size limit, value length: %lu", (uint8_t *)&v20, 0x16u);

    }
    v13 = 0;
    *a5 = 1;
  }
  else
  {
    objc_msgSend(v8, "info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v8, "info");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "stage");
      v13 = v18 <= -[PLJournalEntryPayloadPropertyInfoAssetCompute stage](self, "stage");

    }
    else
    {
      v13 = 1;
    }

  }
LABEL_27:

  return v13;
}

- (BOOL)shouldApplyWithPayloadProperty:(id)a3 andPayload:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  int64_t v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v6 = a4;
  objc_msgSend(a3, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v7)
  {
    switch(objc_msgSend(v7, "versionType"))
    {
      case 1:
        v9 = objc_msgSend(v8, "sceneAnalysisVersion");
        v10 = -[PLJournalEntryPayloadPropertyInfoAssetCompute sceneAnalysisVersion](self, "sceneAnalysisVersion");
        goto LABEL_13;
      case 2:
        v9 = objc_msgSend(v8, "faceAnalysisVersion");
        v10 = -[PLJournalEntryPayloadPropertyInfoAssetCompute faceAnalysisVersion](self, "faceAnalysisVersion");
        goto LABEL_13;
      case 3:
        objc_msgSend(v8, "mediaAnalysisImageVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (-[PLJournalEntryPayloadPropertyInfoAssetCompute isStillImage](self, "isStillImage")
            || (v13 = objc_msgSend(v8, "mediaAnalysisVersion"),
                v13 > -[PLJournalEntryPayloadPropertyInfoAssetCompute mediaAnalysisVersion](self, "mediaAnalysisVersion")))
          {
            objc_msgSend(v8, "mediaAnalysisImageVersion");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "integerValue");
            v11 = v15 > -[PLJournalEntryPayloadPropertyInfoAssetCompute mediaAnalysisImageVersion](self, "mediaAnalysisImageVersion");

          }
          else
          {
            v11 = 0;
          }
        }
        else
        {
          v9 = objc_msgSend(v8, "mediaAnalysisVersion");
          v10 = -[PLJournalEntryPayloadPropertyInfoAssetCompute mediaAnalysisVersion](self, "mediaAnalysisVersion");
LABEL_13:
          v11 = v9 > v10;
        }
        break;
      case 4:
        v9 = objc_msgSend(v8, "characterRecognitionVersion");
        v10 = -[PLJournalEntryPayloadPropertyInfoAssetCompute characterRecognitionVersion](self, "characterRecognitionVersion");
        goto LABEL_13;
      case 5:
        v9 = objc_msgSend(v8, "visualSearchVersion");
        v10 = -[PLJournalEntryPayloadPropertyInfoAssetCompute visualSearchVersion](self, "visualSearchVersion");
        goto LABEL_13;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v11 = 1;
  }

  return v11;
}

- (signed)stage
{
  return self->_stage;
}

- (int64_t)versionType
{
  return self->_versionType;
}

- (int64_t)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (int64_t)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (int64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (int64_t)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (int64_t)characterRecognitionVersion
{
  return self->_characterRecognitionVersion;
}

- (int64_t)visualSearchVersion
{
  return self->_visualSearchVersion;
}

- (BOOL)isStillImage
{
  return self->_isStillImage;
}

+ (BOOL)shouldExcludeDetectedFaces
{
  if ((MEMORY[0x19AEC0720](a1, a2) & 1) == 0 && shouldExcludeDetectedFaces_onceToken != -1)
    dispatch_once(&shouldExcludeDetectedFaces_onceToken, &__block_literal_global_41351);
  return shouldExcludeDetectedFaces;
}

+ (void)setShouldExcludeDetectedFaces:(BOOL)a3
{
  if (MEMORY[0x19AEC0720](a1, a2))
    shouldExcludeDetectedFaces = a3;
}

void __75__PLJournalEntryPayloadPropertyInfoAssetCompute_shouldExcludeDetectedFaces__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  shouldExcludeDetectedFaces = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLExcludeDetectedFaceFromComputeSyncPayload"));

}

@end
