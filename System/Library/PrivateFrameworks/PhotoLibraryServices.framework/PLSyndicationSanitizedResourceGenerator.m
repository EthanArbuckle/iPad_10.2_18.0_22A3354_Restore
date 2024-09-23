@implementation PLSyndicationSanitizedResourceGenerator

- (PLSyndicationSanitizedResourceGenerator)initWithDelegate:(id)a3
{
  id v5;
  PLSyndicationSanitizedResourceGenerator *v6;
  PLSyndicationSanitizedResourceGenerator *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSyndicationSanitizedResourceGenerator.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v10.receiver = self;
  v10.super_class = (Class)PLSyndicationSanitizedResourceGenerator;
  v6 = -[PLSyndicationSanitizedResourceGenerator init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_delegate, v5);

  return v7;
}

- (BOOL)_handleGenerateCompletionWithGenerateError:(id)a3 storedRecipes:(id)a4 sourceMetadata:(id)a5 targetRecipe:(id)a6 assetObjectID:(id)a7 managedObjectContext:(id)a8 timeZoneLookup:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  int v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  char v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  NSObject *v74;
  void *v75;
  id WeakRetained;
  void *v77;
  double v78;
  double v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  void *v90;
  const char *v91;
  void *v92;
  void *v93;
  void *v94;
  BOOL v95;
  int v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD v109[5];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  _BYTE v115[128];
  _BYTE buf[12];
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  uint64_t v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v97 = a9;
  if (v16)
  {
    v22 = v16;
    PLSyndicationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "[sync.resource] conversion service returned error: %@", buf, 0xCu);
    }
    v104 = v22;
    goto LABEL_8;
  }
  if ((objc_msgSend(v17, "containsObject:", v19) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requested recipe %@ was not stored"), v19);
    v23 = objc_claimAutoreleasedReturnValue();
    v104 = (id)PLErrorCreate();
LABEL_8:

    v24 = 0;
    goto LABEL_9;
  }
  v104 = 0;
  v24 = 1;
LABEL_9:
  v114 = 0;
  objc_msgSend(v21, "existingObjectWithID:error:", v20, &v114);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v114;
  v108 = v25;
  v101 = v18;
  v99 = v20;
  v100 = v19;
  v98 = v21;
  if (!v24 || v25)
  {
    if (!v24)
    {
      v28 = (uint64_t)v104;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLForKey:", CFSTR("PADisablePhotosBlastDoorProcessing"));

    if ((v30 & 1) == 0)
    {
      v31 = PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v25);
      if (!v18)
      {
        if (v31)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing blastdoor source metadata"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
    }
    objc_msgSend(v25, "syndicationOriginalResource");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = v49;
      objc_msgSend(v49, "fileURL");
      v102 = v50;
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      if (v107)
      {
        v96 = objc_msgSend(v25, "isPhotoIris");
        if (!v96)
        {
          v106 = 0;
LABEL_56:
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "BOOLForKey:", CFSTR("PADisablePhotosBlastDoorProcessing"));

          if ((v64 & 1) != 0 || !PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v25))
          {
            PLSyndicationGetLog();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v25, "uuid");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v75;
              _os_log_impl(&dword_199541000, v74, OS_LOG_TYPE_DEFAULT, "[sync.resource] setting properties via direct access to the original file: %{public}@", buf, 0xCu);

            }
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            v73 = v107;
            objc_msgSend(WeakRetained, "metadataForResourceGenerator:fromFileURL:", self, v107);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            v72 = v77;
            v69 = v72;
          }
          else
          {
            PLSyndicationGetLog();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v25, "uuid");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v66;
              _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_DEFAULT, "[sync.resource] setting properties via blastdoor metadata: %{public}@", buf, 0xCu);

            }
            v67 = objc_alloc(MEMORY[0x1E0D75140]);
            objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D47C90]);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (void *)objc_msgSend(v67, "initWithSyndicationProperties:", v68);

            v70 = objc_alloc(MEMORY[0x1E0D75140]);
            objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D47C98]);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = (id)objc_msgSend(v70, "initWithSyndicationProperties:", v71);

            v73 = v107;
          }
          objc_msgSend(v25, "setSyndicationAttributesFromMainFileURL:metadata:", v73, v69);
          if (v96)
            objc_msgSend(v25, "setSyndicationLivePhotoAttributesFromMainFileURL:metadata:videoComplementFileURL:", v73, v72, v106);
          objc_msgSend(v69, "exifPixelSize");
          objc_msgSend(v102, "setUnorientedWidth:", (uint64_t)v78);
          objc_msgSend(v69, "exifPixelSize");
          objc_msgSend(v102, "setUnorientedHeight:", (uint64_t)v79);
          objc_msgSend(v102, "setDataLength:", objc_msgSend(v69, "fileSize"));
          PLSyndicationGetLog();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            v81 = objc_msgSend(v102, "unorientedWidth");
            v82 = objc_msgSend(v102, "unorientedHeight");
            v83 = objc_msgSend(v102, "orientation");
            v84 = objc_msgSend(v102, "dataLength");
            *(_DWORD *)buf = 134349824;
            *(_QWORD *)&buf[4] = v81;
            v117 = 2050;
            v118 = v82;
            v119 = 2050;
            v120 = v83;
            v121 = 2050;
            v122 = v84;
            _os_log_impl(&dword_199541000, v80, OS_LOG_TYPE_DEFAULT, "[sync.resource] setting original resource dimensions (%{public}lu, %{public}lu), orientation: %{public}lu, filesize: %{public}lu", buf, 0x2Au);
          }

          objc_msgSend(v108, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, 0, 0);
          v32 = v108;

          v95 = 1;
          goto LABEL_21;
        }
        objc_msgSend(v25, "syndicationOriginalVideoComplementResource");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
        {
          objc_msgSend(v51, "fileURL");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          if (v106)
          {

            goto LABEL_56;
          }
          objc_msgSend(v52, "setSyndicationLocalAvailabilityWithAvailable:", 0);
          v92 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v25, "uuid");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "stringWithFormat:", CFSTR("missing video complement file url for live photo asset: %@"), v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = PLErrorCreate();

          PLSyndicationGetLog();
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v108, "uuid");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v90;
            v91 = "[sync.resource] missing video complement file url for live photo asset: %{public}@";
            goto LABEL_73;
          }
        }
        else
        {
          v85 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v25, "uuid");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "stringWithFormat:", CFSTR("missing video complement resource for asset: %@"), v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = PLErrorCreate();

          PLSyndicationGetLog();
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v108, "uuid");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v90;
            v91 = "[sync.resource] missing video complement resource for asset: %{public}@";
LABEL_73:
            _os_log_impl(&dword_199541000, v89, OS_LOG_TYPE_ERROR, v91, buf, 0xCu);

          }
        }

        v95 = 0;
        v104 = (id)v88;
        v32 = v108;
        goto LABEL_21;
      }
      objc_msgSend(v50, "setSyndicationLocalAvailabilityWithAvailable:", 0);
      v58 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v25, "uuid");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("missing original file url for asset: %@"), v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = PLErrorCreate();

      PLSyndicationGetLog();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v25, "uuid");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v62;
        _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "[sync.resource] missing original file url for asset: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v53 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v25, "uuid");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringWithFormat:", CFSTR("missing original resource for asset: %@"), v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = PLErrorCreate();

      PLSyndicationGetLog();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v25, "uuid");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v57;
        _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_ERROR, "[sync.resource] missing original resource for asset: %{public}@", buf, 0xCu);

      }
      v102 = 0;
    }
    v32 = v25;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("did not find existing asset with object ID: %@"), v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v27 = PLErrorCreate();

  v28 = v27;
LABEL_19:
  v32 = v25;
  objc_msgSend(v25, "syndicationOriginalResource");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  v104 = (id)v28;
  objc_msgSend(v32, "isPhotoIris");
  v95 = 0;
LABEL_21:
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v33 = v17;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
  if (!v34)
    goto LABEL_39;
  v35 = v34;
  v36 = *(_QWORD *)v111;
  v37 = MEMORY[0x1E0C809B0];
  do
  {
    v38 = 0;
    v105 = v35;
    do
    {
      if (*(_QWORD *)v111 != v36)
        objc_enumerationMutation(v33);
      v39 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v38);
      v109[0] = v37;
      v109[1] = 3221225472;
      v109[2] = __184__PLSyndicationSanitizedResourceGenerator__handleGenerateCompletionWithGenerateError_storedRecipes_sourceMetadata_targetRecipe_assetObjectID_managedObjectContext_timeZoneLookup_error___block_invoke;
      v109[3] = &unk_1E366AB58;
      v109[4] = v39;
      objc_msgSend(v32, "firstPersistedResourceMatching:", v109);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (!v40)
      {
        PLSyndicationGetLog();
        v44 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          goto LABEL_37;
        objc_msgSend(v32, "uuid");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v39;
        v117 = 2114;
        v118 = (uint64_t)v46;
        _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "[sync.resource] generated and stored recipe %{public}@ for asset %{public}@, but no stored resource found", buf, 0x16u);

LABEL_36:
        v32 = v108;
        goto LABEL_37;
      }
      objc_msgSend(v40, "fileURL");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      PLSyndicationGetLog();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (!v42)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v108, "uuid");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v39;
          v117 = 2114;
          v118 = (uint64_t)v47;
          _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "[sync.resource] generated and stored recipe %{public}@ for asset %{public}@, but resource missing file url", buf, 0x16u);

          v32 = v108;
          v35 = v105;
          goto LABEL_37;
        }
        goto LABEL_36;
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v108, "uuid");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v39;
        v117 = 2114;
        v118 = (uint64_t)v45;
        _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "[sync.resource] setting cache delete flags on generated derivative resource with recipe: %{public}@ for asset %{public}@", buf, 0x16u);

      }
      objc_msgSend(v41, "fileURL");
      v44 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v32 = v108;
      if (+[PLCacheDeleteSupport markPurgeableForFileAtURL:withUrgency:outInode:](PLCacheDeleteSupport, "markPurgeableForFileAtURL:withUrgency:outInode:", v44, 0, buf))
      {
        objc_msgSend(v41, "setFileID:", *(_QWORD *)buf);
      }
LABEL_37:

      ++v38;
    }
    while (v35 != v38);
    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
  }
  while (v35);
LABEL_39:

  if (a10)
    *a10 = objc_retainAutorelease(v104);

  return v95;
}

- (void)_generateAndStoreDerivativeResourcesForSyndicationResource:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, uint64_t);
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  void (**v34)(id, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstPersistedResourceMatching:", &__block_literal_global_7744);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isLocallyAvailable")
    && objc_msgSend(v7, "effectiveThumbnailIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    PLSyndicationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "[sync] medium image is already locally available", buf, 2u);
    }

    objc_msgSend(v6, "managedObjectContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, 1);
  }
  else
  {
    objc_msgSend(v7, "objectID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PLSyndicationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[sync] generating medium image for %{public}@", buf, 0xCu);

    }
    v26 = v8;

    v11 = v6;
    if (PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v7))
    {
      v35 = *MEMORY[0x1E0D47D80];
      v36 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    v12 = PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v7);
    v13 = CFSTR("Syndication sans Blast Door");
    if (v12)
      v13 = CFSTR("Blast Door");
    v14 = v13;
    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65741);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "imageConversionClientForResourceGenerator:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v18, "videoConversionClientForResourceGenerator:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __113__PLSyndicationSanitizedResourceGenerator__generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke_47;
    v29[3] = &unk_1E3662418;
    v29[4] = self;
    v30 = v15;
    v31 = v25;
    v32 = v11;
    v33 = v23;
    v34 = v28;
    v24 = v23;
    v20 = v25;
    v21 = v15;
    objc_msgSend(v21, "generateAndStoreForAsset:version:imageConversionClient:videoConversionClient:conversionServiceOptions:deferredPhotoFinalizer:progress:reason:completion:", v7, 0, v17, v19, v27, 0, 0, v14, v29);

    v6 = v11;
    v8 = v26;
  }

}

- (void)generateAndStoreDerivativeResourcesForSyndicationResource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __112__PLSyndicationSanitizedResourceGenerator_generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke;
  v8[3] = &unk_1E3661F90;
  v9 = v6;
  v7 = v6;
  -[PLSyndicationSanitizedResourceGenerator _generateAndStoreDerivativeResourcesForSyndicationResource:completion:](self, "_generateAndStoreDerivativeResourcesForSyndicationResource:completion:", a3, v8);

}

- (PLSyndicationSanitizedResourceGeneratorDelegate)delegate
{
  return (PLSyndicationSanitizedResourceGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __112__PLSyndicationSanitizedResourceGenerator_generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __113__PLSyndicationSanitizedResourceGenerator__generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke_47(_QWORD *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = (void *)a1[4];
  v26 = a1[5];
  v12 = a1[6];
  v13 = (void *)a1[7];
  v14 = a6;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v13, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "libraryBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeZoneLookup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v11, "_handleGenerateCompletionWithGenerateError:storedRecipes:sourceMetadata:targetRecipe:assetObjectID:managedObjectContext:timeZoneLookup:error:", v16, v15, v14, v26, v12, v10, v19, &v28);

  v20 = v28;
  v21 = a1[8];
  v27 = 0;
  objc_msgSend(v10, "existingObjectWithID:error:", v21, &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v27;
  if (!v22)
  {
    PLSyndicationGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = a1[8];
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "[sync] failed to fetch resource to clear sanitization flag with objectID: %{public}@, error %@", buf, 0x16u);
    }

    if (!v20)
      v20 = v23;
  }
  (*(void (**)(void))(a1[9] + 16))();

}

BOOL __113__PLSyndicationSanitizedResourceGenerator__generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "recipeID") == 65741
    && !objc_msgSend(v2, "version")
    && objc_msgSend(v2, "resourceType") == 0;

  return v3;
}

BOOL __184__PLSyndicationSanitizedResourceGenerator__handleGenerateCompletionWithGenerateError_storedRecipes_sourceMetadata_targetRecipe_assetObjectID_managedObjectContext_timeZoneLookup_error___block_invoke(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "recipeID");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "recipeID");
}

@end
