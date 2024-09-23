@implementation PLResourceChooser

- (PLResourceChooser)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLResourceChooser;
  return -[PLResourceChooser init](&v3, sel_init);
}

+ (id)_chooseFileReservationForLargeDisplayableImageFileForAsset:(id)a3 format:(id)a4 forceLarge:(BOOL)a5 allowMetadataSnapshot:(BOOL)a6 outFilePath:(id *)a7 outImageType:(int64_t *)a8
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  uint64_t *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  BOOL v38;
  _QWORD v39[7];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v12 = a3;
  v13 = a4;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__45157;
  v54 = __Block_byref_object_dispose__45158;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__45157;
  v48 = __Block_byref_object_dispose__45158;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke;
  v39[3] = &unk_1E366A920;
  v39[4] = &v50;
  v39[5] = &v44;
  v39[6] = &v40;
  v15 = (void *)MEMORY[0x19AEC174C](v39);
  v29 = v14;
  v30 = 3221225472;
  v31 = __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_2;
  v32 = &unk_1E366A948;
  v35 = &v50;
  v16 = v12;
  v33 = v16;
  v17 = v15;
  v38 = a5;
  v34 = v17;
  v36 = &v44;
  v37 = &v40;
  v18 = (void (**)(_QWORD))MEMORY[0x19AEC174C](&v29);
  if (!objc_msgSend(v16, "isOriginalSRGB", v29, v30, v31, v32)
    || objc_msgSend(v16, "isRAW"))
  {
    v18[2](v18);
  }
  v19 = v51;
  if (!v51[5])
  {
    if (v13)
    {
      v20 = objc_msgSend(v13, "isAlwaysFullScreen");
      v19 = v51;
      if ((v20 & 1) == 0 && !v51[5])
      {
        objc_msgSend(v16, "pathForLargeThumbnailFile");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, uint64_t))v17 + 2))(v17, v21, 9);

        v19 = v51;
      }
    }
    if (!v19[5])
    {
      objc_msgSend(v16, "pathForFullsizeRenderImageFile");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, uint64_t))v17 + 2))(v17, v22, 5);

      if (!v51[5])
      {
        objc_msgSend(v16, "pathForSubstandardFullsizeRenderImageFile");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, uint64_t))v17 + 2))(v17, v23, 7);

        if (!v51[5] && (objc_msgSend(v16, "hasAdjustments") & 1) == 0)
        {
          objc_msgSend(v16, "pathForNonAdjustedFullsizeImageFile");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, uint64_t))v17 + 2))(v17, v24, 3);

          if (!v51[5]
            && (objc_msgSend(v16, "isVideo") & 1) == 0
            && __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_61(v16, 0))
          {
            objc_msgSend(v16, "pathForOriginalFile");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *, uint64_t))v17 + 2))(v17, v25, 1);

          }
        }
      }
    }
  }
  if (!v51[5])
  {
    v18[2](v18);
    if (!v51[5]
      && (objc_msgSend(v16, "isVideo") & 1) == 0
      && __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_61(v16, 1)&& (objc_msgSend(v16, "hasAdjustments") & 1) == 0)
    {
      objc_msgSend(v16, "pathForOriginalFile");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, uint64_t))v17 + 2))(v17, v26, 1);

    }
  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v45[5]);
  if (a8)
    *a8 = v41[3];
  v27 = (id)v51[5];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v27;
}

+ (id)fileReservationForLargeDisplayableImageFileForAsset:(id)a3 format:(id)a4 allowMetadataSnapshot:(BOOL)a5 forceLarge:(BOOL)a6 outFilePath:(id *)a7 outImageType:(int64_t *)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  int v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  id v41;
  _QWORD v42[7];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v10 = a6;
  v11 = a5;
  v65 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__45157;
  v57 = __Block_byref_object_dispose__45158;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__45157;
  v51 = __Block_byref_object_dispose__45158;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __138__PLResourceChooser_fileReservationForLargeDisplayableImageFileForAsset_format_allowMetadataSnapshot_forceLarge_outFilePath_outImageType___block_invoke;
  v42[3] = &unk_1E366A920;
  v42[4] = &v53;
  v42[5] = &v47;
  v42[6] = &v43;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v42);
  if ((objc_msgSend(v14, "isCloudSharedAsset") & 1) != 0 || objc_msgSend(v14, "isStreamedVideo"))
  {
    objc_msgSend(v14, "pathForOriginalFile");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v48[5];
    v48[5] = v17;

    v44[3] = 1;
  }
  else
  {
    v26 = objc_msgSend(v14, "kind");
    if (v26)
    {
      if (v26 == 1)
      {
        objc_msgSend(v14, "pathForVideoPreviewFile");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v16)[2](v16, v27, 0);

        if (v54[5])
        {
          PLImageManagerGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "uuid");
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = v48[5];
            *(_DWORD *)buf = 138412546;
            v60 = v29;
            v61 = 2112;
            v62 = v30;
            v38 = (void *)v29;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "Found video preview for asset: %@, path: %@", buf, 0x16u);

          }
        }
        else
        {
          PLImageManagerGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "uuid");
            v34 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v60 = v34;
            v39 = (void *)v34;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "No video preview for asset: %@", buf, 0xCu);

          }
        }

        if (!v54[5])
        {
          v35 = (id *)(v48 + 5);
          v41 = (id)v48[5];
          objc_msgSend(a1, "_chooseFileReservationForLargeDisplayableImageFileForAsset:format:forceLarge:allowMetadataSnapshot:outFilePath:outImageType:", v14, v15, v10, v11, &v41, v44 + 3);
          v36 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v35, v41);
          v37 = (void *)v54[5];
          v54[5] = v36;

        }
      }
    }
    else
    {
      v31 = (id *)(v48 + 5);
      obj = (id)v48[5];
      objc_msgSend(a1, "_chooseFileReservationForLargeDisplayableImageFileForAsset:format:forceLarge:allowMetadataSnapshot:outFilePath:outImageType:", v14, v15, v10, v11, &obj, v44 + 3);
      v32 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v31, obj);
      v33 = (void *)v54[5];
      v54[5] = v32;

    }
  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v48[5]);
  if (a8)
    *a8 = v44[3];
  if (v48[5])
  {
    PLImageManagerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v14, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v44[3];
      v22 = v48[5];
      *(_DWORD *)buf = 138412802;
      v60 = (uint64_t)v20;
      v61 = 2048;
      v62 = v21;
      v63 = 2112;
      v64 = v22;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Finding large displayable image on disk for asset: %@, image type: %ld, path: %@", buf, 0x20u);

    }
  }
  else
  {
    PLImageManagerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = (uint64_t)v23;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Did not find large displayable image on disk for asset: %@", buf, 0xCu);

    }
  }

  v24 = (id)v54[5];
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v24;
}

+ (id)fileReservationForImageFileForAsset:(id)a3 format:(id)a4 outFilePath:(id *)a5 outImageType:(int64_t *)a6
{
  id v9;
  id v10;
  int v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  uint64_t v17;
  id v18;
  void *v20;
  id obj;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v10, "formatID");
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__45157;
  v33 = __Block_byref_object_dispose__45158;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__45157;
  v27 = __Block_byref_object_dispose__45158;
  v28 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __89__PLResourceChooser_fileReservationForImageFileForAsset_format_outFilePath_outImageType___block_invoke;
  v22[3] = &unk_1E366A920;
  v22[4] = &v23;
  v22[5] = &v29;
  v22[6] = &v35;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v22);
  if (v11 == 9997)
  {
    objc_msgSend(v9, "pathForPenultimateFullsizeRenderImageFile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v13, 6);
LABEL_10:

    goto LABEL_11;
  }
  if (v11 == 10000)
  {
    objc_msgSend(v9, "urlForSideCarImageFile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v15, 2);

    if (v24[5])
      goto LABEL_11;
    goto LABEL_17;
  }
  if (v11 != 9999)
  {
    v16 = (id *)(v30 + 5);
    obj = (id)v30[5];
    +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:](PLResourceChooser, "fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:", v9, v10, 0, 1, &obj, v36 + 3);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v16, obj);
    v13 = (void *)v24[5];
    v24[5] = v17;
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isPrimaryImageFormat")
    || (objc_msgSend(v9, "pathForNonAdjustedFullsizeImageFile"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v20, 3),
        v20,
        !v24[5]))
  {
LABEL_17:
    objc_msgSend(v9, "pathForOriginalFile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v13, 1);
    goto LABEL_10;
  }
LABEL_11:
  if (a5)
    *a5 = objc_retainAutorelease((id)v30[5]);
  if (a6)
    *a6 = v36[3];
  v18 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v18;
}

+ (id)_originalItemFromAllItems:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("type == %d OR type == %d"), 17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v9 = objc_msgSend(v6, "count");
    v7 = 0;
    v8 = 0;
    if (v9 != 1)
      goto LABEL_6;
LABEL_5:
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_69);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  v8 = 0;
LABEL_6:

  return v8;
}

+ (id)_penultimateItemFromAllItems:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("type == %d"), 15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_filteredArrayUsingPredicate:(id)a3 originalItems:(id)a4 nonMatchingItems:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v7, "evaluateWithObject:", v16, (_QWORD)v19))
          v17 = v9;
        else
          v17 = v10;
        objc_msgSend(v17, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return v9;
}

+ (id)_itemMatchingFormat:(id)a3 allItems:(id)a4 acceptableSortedAlternatives:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "refersToOriginalVersion"))
  {
    objc_msgSend(a1, "_originalItemFromAllItems:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v8, "refersToPenultimateVersion"))
    {
      if (_itemMatchingFormat_allItems_acceptableSortedAlternatives__onceToken1 != -1)
        dispatch_once(&_itemMatchingFormat_allItems_acceptableSortedAlternatives__onceToken1, &__block_literal_global_72);
      objc_msgSend(a1, "_filteredArrayUsingPredicate:originalItems:nonMatchingItems:", _itemMatchingFormat_allItems_acceptableSortedAlternatives__displayablePredicate, v9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_80_45167);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");
      v18 = v17;
      v20 = v19;
      if ((PLImageFormatSizeIsMaxSize() & 1) != 0
        || v18 > (double)objc_msgSend(v16, "width")
        || v20 > (double)objc_msgSend(v16, "height"))
      {
        v18 = (double)objc_msgSend(v16, "width");
        v20 = (double)objc_msgSend(v16, "height");
      }
      v33 = v16;
      if (objc_msgSend(v8, "isThumbnail"))
        v21 = objc_msgSend(v8, "isTable") ^ 1;
      else
        v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("width >= %f AND height >= %f"), *(_QWORD *)&v18, *(_QWORD *)&v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v32 = v22;
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d"), 5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB3528];
        v37[0] = v23;
        v37[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "orPredicateWithSubpredicates:", v26);
        v27 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = v22;
      }
      v34 = v15;
      objc_msgSend(a1, "_filteredArrayUsingPredicate:originalItems:nonMatchingItems:", v27, v15, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v14;
      if (_itemMatchingFormat_allItems_acceptableSortedAlternatives__onceToken2 != -1)
        dispatch_once(&_itemMatchingFormat_allItems_acceptableSortedAlternatives__onceToken2, &__block_literal_global_83_45172);
      v36 = 0;
      objc_msgSend(a1, "_filteredArrayUsingPredicate:originalItems:nonMatchingItems:", _itemMatchingFormat_allItems_acceptableSortedAlternatives__jpegPredicate, v28, &v36);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v36;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObjectsFromArray:", v29);
      objc_msgSend(v31, "addObjectsFromArray:", v30);
      objc_msgSend(v31, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      if ((unint64_t)objc_msgSend(v31, "count") >= 2)
      {
        objc_msgSend(v31, "removeObjectAtIndex:", 0);
        v12 = v31;
      }

      if (a5)
        goto LABEL_6;
      goto LABEL_7;
    }
    objc_msgSend(a1, "_penultimateItemFromAllItems:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  v12 = 0;
  if (a5)
LABEL_6:
    *a5 = objc_retainAutorelease(v12);
LABEL_7:

  return v11;
}

+ (void)_chooseCloudResourceTypeForFormat:(id)a3 asset:(id)a4 optimalCPLResourceType:(unint64_t *)a5 localCPLResourceType:(unint64_t *)a6 localCPLResourceFilePath:(id *)a7 fileReservation:(id *)a8
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  void (**v32)(_QWORD, _QWORD);
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  int v40;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v10;
  v45 = v11;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__45157;
  v63 = __Block_byref_object_dispose__45158;
  v64 = 0;
  if ((objc_msgSend(v10, "refersToUnadjustedVersion") & 1) != 0 || (objc_msgSend(v45, "hasAdjustments") & 1) == 0)
  {
    objc_msgSend(v45, "availableUnadjustedCloudResourcesForPhotos");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", 9997);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "isEqualToFormat:", v13);

    if (v14)
      objc_msgSend(v45, "availableAdjustedCloudResourcesForPhotos:", 1);
    else
      objc_msgSend(v45, "availableAdjustedCloudResourcesForPhotos:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
  }
  v17 = (void *)v16;

  if (objc_msgSend(v10, "formatID") == 10000)
  {
    if (objc_msgSend(v45, "isRAWPlusJPEG"))
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cplType == %d"), 17);
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cplType == %d"), 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filteredArrayUsingPredicate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "mutableCopy");

LABEL_14:
    goto LABEL_31;
  }
  if (objc_msgSend(v45, "hasAdjustments"))
    v20 = objc_msgSend(v45, "isOriginalRAW");
  else
    v20 = objc_msgSend(v45, "isRAW");
  v22 = v20;
  v23 = objc_msgSend(v45, "isRAWPlusJPEG");
  if ((v22 | v23) == 1 && (unint64_t)objc_msgSend(v17, "count") >= 2)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v18 = v17;
    v24 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v56 != v25)
            objc_enumerationMutation(v18);
          v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if (v22 && objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "cplType") == 1
            || v23 && objc_msgSend(v27, "cplType") == 17)
          {
            objc_msgSend(v18, "removeObject:", v27);
            v21 = v18;
            goto LABEL_14;
          }
        }
        v24 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
        if (v24)
          continue;
        break;
      }
    }
    v21 = v18;
    goto LABEL_14;
  }
  v21 = v17;
LABEL_31:
  +[PLChoosableItem choosableItemsFromCloudResources:](PLChoosableItem, "choosableItemsFromCloudResources:", v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  objc_msgSend(a1, "_itemMatchingFormat:allItems:acceptableSortedAlternatives:", v12, v28, &v54);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v54;
  if (v29)
  {
    v31 = objc_msgSend(v29, "type");
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __146__PLResourceChooser__chooseCloudResourceTypeForFormat_asset_optimalCPLResourceType_localCPLResourceType_localCPLResourceFilePath_fileReservation___block_invoke;
    v50[3] = &unk_1E366AA10;
    v51 = v21;
    v52 = &v65;
    v53 = &v59;
    v32 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v50);
    v32[2](v32, (int)objc_msgSend(v29, "type"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      if (objc_msgSend(v30, "count"))
      {
        v40 = v31;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v34 = v30;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
        v39 = v12;
        if (v35)
        {
          v36 = *(_QWORD *)v47;
LABEL_36:
          v37 = 0;
          while (1)
          {
            if (*(_QWORD *)v47 != v36)
              objc_enumerationMutation(v34);
            v32[2](v32, (int)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v37), "type"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33)
              break;
            if (v35 == ++v37)
            {
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
              if (v35)
                goto LABEL_36;
              goto LABEL_42;
            }
          }
        }
        else
        {
LABEL_42:
          v33 = 0;
        }

        v12 = v39;
        v31 = v40;
      }
      else
      {
        v33 = 0;
      }
    }

    v38 = v31;
  }
  else
  {
    v33 = 0;
    v38 = 0;
  }
  if (a5)
    *a5 = v38;
  if (a6)
    *a6 = v66[3];
  if (a7)
    *a7 = objc_retainAutorelease((id)v60[5]);
  if (a8)
    *a8 = objc_retainAutorelease(v33);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

}

+ (int64_t)_fileResourceTypeForCloudResourceType:(unint64_t)a3 hasAdjustments:(BOOL)a4 requiresUnadjustedVersion:(BOOL)a5
{
  int64_t result;

  result = a3;
  if ((uint64_t)a3 > 14)
  {
    switch(a3)
    {
      case 0xFuLL:
        return 6;
      case 0x17uLL:
        return 4;
      case 0x11uLL:
        return 2;
      default:
        return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        return result;
      case 2uLL:
        if (!a4 || a5)
          result = 3;
        else
          result = 5;
        break;
      case 3uLL:
        result = 8;
        break;
      case 4uLL:
        result = 9;
        break;
      default:
        return 0;
    }
  }
  return result;
}

+ (unint64_t)cloudResourceTypeForAsset:(id)a3 format:(id)a4 filePath:(id *)a5 imageType:(int64_t *)a6
{
  id v10;
  id v11;
  unint64_t *v12;
  id v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v10 = a3;
  v11 = a4;
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v12 = (unint64_t *)&v20;
  objc_msgSend(a1, "_chooseCloudResourceTypeForFormat:asset:optimalCPLResourceType:localCPLResourceType:localCPLResourceFilePath:fileReservation:", v11, v10, &v20, &v19, &v18, 0);
  v13 = v18;
  if (v19)
  {
    v14 = objc_msgSend(v10, "hasAdjustments");
    v15 = objc_msgSend(a1, "_fileResourceTypeForCloudResourceType:hasAdjustments:requiresUnadjustedVersion:", v19, v14, objc_msgSend(v11, "refersToUnadjustedVersion"));
    v12 = (unint64_t *)&v19;
  }
  else
  {
    v15 = 0;
  }
  v16 = *v12;
  if (a5)
    *a5 = objc_retainAutorelease(v13);
  if (a6)
    *a6 = v15;

  return v16;
}

id __146__PLResourceChooser__chooseCloudResourceTypeForFormat_asset_optimalCPLResourceType_localCPLResourceType_localCPLResourceFilePath_fileReservation___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __146__PLResourceChooser__chooseCloudResourceTypeForFormat_asset_optimalCPLResourceType_localCPLResourceType_localCPLResourceFilePath_fileReservation___block_invoke_2;
  v9[3] = &__block_descriptor_40_e35_B32__0__PLInternalResource_8Q16_B24l;
  v9[4] = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "indexOfObjectPassingTest:", v9));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cplFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLPhotoLibrary fileReservationForFileAtPath:exclusive:](PLPhotoLibrary, "fileReservationForFileAtPath:exclusive:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "cplType");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);
  }

  return v7;
}

BOOL __146__PLResourceChooser__chooseCloudResourceTypeForFormat_asset_optimalCPLResourceType_localCPLResourceType_localCPLResourceFilePath_fileReservation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplType") == *(_QWORD *)(a1 + 32);
}

void __79__PLResourceChooser__itemMatchingFormat_allItems_acceptableSortedAlternatives___block_invoke_3()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "predicateWithFormat:", CFSTR("uniformTypeIdentifier UTI-EQUALS %@"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_itemMatchingFormat_allItems_acceptableSortedAlternatives__jpegPredicate;
  _itemMatchingFormat_allItems_acceptableSortedAlternatives__jpegPredicate = v1;

}

uint64_t __79__PLResourceChooser__itemMatchingFormat_allItems_acceptableSortedAlternatives___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareUsingWidth:");
}

void __79__PLResourceChooser__itemMatchingFormat_allItems_acceptableSortedAlternatives___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend((id)*MEMORY[0x1E0CEC5B8], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "predicateWithFormat:", CFSTR("NOT uniformTypeIdentifier UTI-EQUALS %@"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("uniformTypeIdentifier UTI-CONFORMS-TO %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3528];
  v10[0] = v2;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_itemMatchingFormat_allItems_acceptableSortedAlternatives__displayablePredicate;
  _itemMatchingFormat_allItems_acceptableSortedAlternatives__displayablePredicate = v8;

}

BOOL __47__PLResourceChooser__originalItemFromAllItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 17;
}

void __89__PLResourceChooser_fileReservationForImageFileForAsset_format_outFilePath_outImageType___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a2;
  if (v6)
  {
    v10 = v6;
    +[PLPhotoLibrary fileReservationForFileAtPath:exclusive:](PLPhotoLibrary, "fileReservationForFileAtPath:exclusive:", v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[4] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v10;
    if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
      v6 = v10;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    }
  }

}

void __138__PLResourceChooser_fileReservationForLargeDisplayableImageFileForAsset_format_allowMetadataSnapshot_forceLarge_outFilePath_outImageType___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a2;
  if (v6)
  {
    v10 = v6;
    +[PLPhotoLibrary fileReservationForFileAtPath:exclusive:](PLPhotoLibrary, "fileReservationForFileAtPath:exclusive:", v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[4] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v10;
    if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
      v6 = v10;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    }
  }

}

void __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a2;
  if (v6)
  {
    v10 = v6;
    +[PLPhotoLibrary fileReservationForFileAtPath:exclusive:](PLPhotoLibrary, "fileReservationForFileAtPath:exclusive:", v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[4] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v10;
    if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
      v6 = v10;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    }
  }

}

void __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "pathForLargeThumbnailFile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "pathForMediumThumbnailFile");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, 10);

      if (PLIsAssetsd())
      {
        objc_msgSend(*(id *)(a1 + 32), "pl_photoLibrary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "isCloudPhotoLibraryEnabled");

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {
          if ((v6 & 1) == 0 && *(_BYTE *)(a1 + 72) && (objc_msgSend(*(id *)(a1 + 32), "hasAdjustments") & 1) == 0)
          {
            PLImageManagerGetLog();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Generating \"large thumbnail file\" while servicing an image request", buf, 2u);
            }

            objc_msgSend(*(id *)(a1 + 32), "generateLargeThumbnailFileIfNecessary");
            +[PLPhotoLibrary fileReservationForFileAtPath:exclusive:](PLPhotoLibrary, "fileReservationForFileAtPath:exclusive:", v2, 0);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            PLImageManagerGetLog();
            v9 = objc_claimAutoreleasedReturnValue();
            v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
            if (v8)
            {
              if (v10)
              {
                *(_WORD *)v19 = 0;
                _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Found \"large thumbnail file\" after generation", v19, 2u);
              }

              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
              v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v12 = v2;
              v13 = *(void **)(v11 + 40);
              *(_QWORD *)(v11 + 40) = v12;
              v14 = 9;
            }
            else
            {
              if (v10)
              {
                *(_WORD *)v18 = 0;
                _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Did not find \"large thumbnail file\" after generation", v18, 2u);
              }

              v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v16 = *(void **)(v15 + 40);
              *(_QWORD *)(v15 + 40) = 0;

              v14 = 0;
              v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v13 = *(void **)(v17 + 40);
              *(_QWORD *)(v17 + 40) = 0;
            }

            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v14;
          }
        }
      }
    }

  }
}

uint64_t __145__PLResourceChooser__chooseFileReservationForLargeDisplayableImageFileForAsset_format_forceLarge_allowMetadataSnapshot_outFilePath_outImageType___block_invoke_61(void *a1, char a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  objc_msgSend(v3, "uniformTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC520]);

    if ((a2 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
    if ((a2 & 1) != 0)
      goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isRAW") & 1) != 0)
    v6 = 0;
LABEL_7:

  return v6;
}

@end
