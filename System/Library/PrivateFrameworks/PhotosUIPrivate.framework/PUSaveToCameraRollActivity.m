@implementation PUSaveToCameraRollActivity

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PUSaveToCameraRollActivity;
  if (-[UISaveToCameraRollActivity canPerformWithActivityItems:](&v16, sel_canPerformWithActivityItems_, a3))
  {
    -[PUSaveToCameraRollActivity itemSourceController](self, "itemSourceController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isPhotoStreamPhoto", (_QWORD)v12) & 1) == 0
            && !objc_msgSend(v10, "isCloudSharedAsset"))
          {
            LOBYTE(v7) = 0;
            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          continue;
        break;
      }
      LOBYTE(v7) = 1;
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)performActivity
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char isKindOfClass;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  dispatch_group_t group;
  id obj;
  void *v51;
  void *v52;
  _QWORD v53[5];
  _QWORD v54[4];
  id v55;
  NSObject *v56;
  uint8_t *v57;
  id v58;
  id v59;
  _QWORD block[4];
  NSObject *v61;
  uint8_t *v62;
  uint8_t buf[8];
  uint8_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _QWORD v69[4];
  NSObject *v70;
  _QWORD v71[4];
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[4];
  void *v79;
  __int16 v80;
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  -[PUSaveToCameraRollActivity itemSourceController](self, "itemSourceController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activityViewController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISaveToCameraRollActivity activityType](self, "activityType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "assetItemSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v75;
    v40 = *MEMORY[0x1E0C8A2E8];
    v41 = *MEMORY[0x1E0C89E98];
    *(_QWORD *)&v5 = 138412546;
    v38 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v75 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v7);
        objc_msgSend(v8, "asset", v38);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          dispatch_group_enter(v3);
          v10 = objc_msgSend(v9, "isStreamedVideo");
          objc_msgSend(v8, "activityViewController:itemForActivityType:", v52, v51);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((v10 & 1) != 0)
          {
            if ((isKindOfClass & 1) != 0
              && -[PUSaveToCameraRollActivity _itemIsVideoAtURL:](self, "_itemIsVideoAtURL:", v11))
            {
              *(_QWORD *)buf = 0;
              v64 = buf;
              v65 = 0x3032000000;
              v66 = __Block_byref_object_copy__82096;
              v67 = __Block_byref_object_dispose__82097;
              v13 = v11;
              v68 = v13;
              v14 = dispatch_group_create();
              dispatch_group_enter(v14);
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_133;
              block[3] = &unk_1E58AAE48;
              v62 = buf;
              v61 = v3;
              group = v14;
              dispatch_group_notify(v14, MEMORY[0x1E0C80D38], block);
              if (objc_msgSend(v9, "sourceType") == 2 && objc_msgSend(v9, "playbackStyle") == 5)
              {
                v15 = v13;
                objc_msgSend(v15, "lastPathComponent");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v15;
                objc_msgSend(v15, "URLByDeletingLastPathComponent");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("transcoded"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v45, "URLByAppendingPathComponent:", v44);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "path");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v42, "fileExistsAtPath:", v17);

                if (v18)
                {
                  v59 = 0;
                  v19 = objc_msgSend(v42, "removeItemAtURL:error:", v47, &v59);
                  v20 = v59;
                  if ((v19 & 1) == 0)
                  {
                    PLUIGetLog();
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v78 = v38;
                      v79 = v47;
                      v80 = 2112;
                      v81 = v20;
                      v22 = v21;
                      v23 = "Share Sheet: failed to delete already-existing transcoded video at url: %@, reason: %@";
                      goto LABEL_29;
                    }
                    goto LABEL_30;
                  }
                }
                else
                {
                  v58 = 0;
                  v29 = objc_msgSend(v42, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v45, 1, 0, &v58);
                  v20 = v58;
                  if ((v29 & 1) == 0)
                  {
                    PLUIGetLog();
                    v21 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v78 = v38;
                      v79 = v45;
                      v80 = 2112;
                      v81 = v20;
                      v22 = v21;
                      v23 = "Share Sheet: failed to create transcode directory at url: %@, reason: %@";
LABEL_29:
                      _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_ERROR, v23, v78, 0x16u);
                    }
LABEL_30:

                  }
                }

                objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v43);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (void *)MEMORY[0x1E0D75148];
                objc_msgSend(MEMORY[0x1E0D75140], "playbackVariationMetadataIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v9, "playbackVariation"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "addQuickTimeMetadataItemsWithIdentifier:value:toItems:", v32, v33, v30);

                objc_msgSend(v46, "metadata");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObjectsFromArray:", v34);

                v35 = (void *)MEMORY[0x1E0D71BD8];
                v54[0] = MEMORY[0x1E0C809B0];
                v54[1] = 3221225472;
                v54[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_144;
                v54[3] = &unk_1E58A78C0;
                v57 = buf;
                v36 = v43;
                v55 = v36;
                v56 = group;
                objc_msgSend(v35, "transcodeVideo:outputURL:presetName:outputFileType:metadata:completionHandler:", v46, v47, v41, v40, v30, v54);

              }
              else
              {
                dispatch_group_leave(v14);
              }

              _Block_object_dispose(buf, 8);
LABEL_22:

              goto LABEL_23;
            }
          }
          else
          {
            if ((isKindOfClass & 1) != 0)
            {
              v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v11);
              objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = MEMORY[0x1E0C809B0];
              v71[0] = MEMORY[0x1E0C809B0];
              v71[1] = 3221225472;
              v71[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke;
              v71[3] = &unk_1E58ABCA8;
              v72 = v24;
              v73 = v11;
              v69[0] = v26;
              v69[1] = 3221225472;
              v69[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_2;
              v69[3] = &unk_1E58AB060;
              v70 = v3;
              v27 = v24;
              objc_msgSend(v25, "performChanges:completionHandler:", v71, v69);

              goto LABEL_22;
            }
            PLUIGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_ERROR, "Share Sheet: did not get a URL for an in-app save", buf, 2u);
            }

          }
          dispatch_group_leave(v3);
          goto LABEL_22;
        }
LABEL_23:

        ++v7;
      }
      while (v4 != v7);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      v4 = v37;
    }
    while (v37);
  }

  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_146;
  v53[3] = &unk_1E58ABD10;
  v53[4] = self;
  dispatch_group_notify(v3, MEMORY[0x1E0C80D38], v53);

}

- (BOOL)_itemIsVideoAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  char v13;

  v3 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v13);

  v7 = 0;
  if (v6)
    v8 = v13 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v3, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeWithFilenameExtension:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v7 = objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC568]);
    else
      v7 = 0;

  }
  return v7;
}

- (PXActivityItemSourceController)itemSourceController
{
  return (PXActivityItemSourceController *)objc_loadWeakRetained((id *)&self->_itemSourceController);
}

- (void)setItemSourceController:(id)a3
{
  objc_storeWeak((id *)&self->_itemSourceController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemSourceController);
}

id __45__PUSaveToCameraRollActivity_performActivity__block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return (id)objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetFromVideoComplementBundle:");
  else
    return (id)objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetFromImageAtFileURL:", *(_QWORD *)(a1 + 40));
}

void __45__PUSaveToCameraRollActivity_performActivity__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Share Sheet: failed to save cloud shared asset to library with error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __45__PUSaveToCameraRollActivity_performActivity__block_invoke_133(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_2_134;
  v3[3] = &unk_1E58AAEB0;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "performChangesAndWait:error:", v3, 0);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __45__PUSaveToCameraRollActivity_performActivity__block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Share Sheet: failed to passthrough-transcode shared video at url: %@, reason: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __45__PUSaveToCameraRollActivity_performActivity__block_invoke_146(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 1);
}

void __45__PUSaveToCameraRollActivity_performActivity__block_invoke_2_134(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CD1448]);
  objc_msgSend(v3, "setShouldMoveFile:", 1);
  objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addResourceWithType:fileURL:options:", 2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);

}

@end
