@implementation PLAssetSharingUtilities

+ (CGImage)thumbnailForAssetURL:(id)a3 library:(id)a4
{
  return (CGImage *)objc_msgSend(a1, "_thumbnailForAssetURL:library:useAspect:", a3, a4, 0);
}

+ (CGImage)aspectRatioThumbnailForAssetURL:(id)a3 library:(id)a4
{
  return (CGImage *)objc_msgSend(a1, "_thumbnailForAssetURL:library:useAspect:", a3, a4, 1);
}

+ (CGImage)_thumbnailForAssetURL:(id)a3 library:(id)a4 useAspect:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  const void *v11;
  const void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__30537;
  v23 = __Block_byref_object_dispose__30538;
  v24 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__PLAssetSharingUtilities__thumbnailForAssetURL_library_useAspect___block_invoke;
  v14[3] = &unk_1E3676E78;
  v9 = v8;
  v15 = v9;
  v10 = v7;
  v18 = a5;
  v16 = v10;
  v17 = &v19;
  objc_msgSend(v9, "performBlockAndWait:completionHandler:", v14, 0);
  if (v20[5])
  {
    v11 = (const void *)DCIM_CGImageRefFromPLImage();
    v12 = v11;
    if (v11)
    {
      CFRetain(v11);
      CFAutorelease(v12);
    }
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return (CGImage *)v12;
}

+ (id)filePathForVideoURL:(id)a3 library:(id)a4 outMetadata:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  id *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a3;
  v8 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__30537;
  v29 = __Block_byref_object_dispose__30538;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__30537;
  v23 = __Block_byref_object_dispose__30538;
  v24 = 0;
  if (objc_msgSend(v7, "isFileURL"))
  {
    objc_msgSend(v7, "path");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (id)v26[5];
    v26[5] = v9;
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__PLAssetSharingUtilities_filePathForVideoURL_library_outMetadata___block_invoke;
    v13[3] = &unk_1E366C010;
    v14 = v8;
    v15 = v7;
    v16 = &v25;
    v17 = &v19;
    v18 = a5;
    objc_msgSend(v14, "performBlockAndWait:completionHandler:", v13, 0);

    v10 = v14;
  }

  if (a5)
    *a5 = objc_retainAutorelease((id)v20[5]);
  v11 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v11;
}

+ (int64_t)estimatedOutputFileLengthForVideoURL:(id)a3 library:(id)a4 fallbackFilePath:(id)a5 exportPreset:(id)a6 exportProperties:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  int64_t v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = 0.0;
  if ((objc_msgSend(v12, "isFileURL") & 1) != 0
    || (objc_msgSend(a1, "_durationForVideoAssetURL:library:", v12, v13), v17 = v18, v18 == 0.0))
  {
    if (objc_msgSend(v12, "isFileURL"))
    {
      objc_msgSend(v12, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_durationForVideoFilePath:", v19);
      v17 = v20;

    }
  }
  if (v17 == 0.0)
  {
    objc_msgSend(a1, "_durationForVideoFilePath:", v14);
    v17 = v21;
  }
  v22 = objc_msgSend(a1, "_estimatedOutputFileLengthForDuration:exportPreset:exportProperties:", v15, v16, v17);

  return v22;
}

+ (int64_t)estimatedOutputFileLengthForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  int64_t v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a1, "_durationForVideoFilePath:", a3);
  v14 = v13;
  if (v13 > 0.0)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75308]), "initWithPropertyListDictionary:", v10);
    +[PLSlalomUtilities durationForBaseDuration:videoAdjustments:](PLSlalomUtilities, "durationForBaseDuration:videoAdjustments:", v15, v14);
    v14 = v16;

  }
  v17 = objc_msgSend(a1, "_estimatedOutputFileLengthForDuration:exportPreset:exportProperties:", v11, v12, v14);

  return v17;
}

+ (double)_durationForVideoAssetURL:(id)a3 library:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PLAssetSharingUtilities__durationForVideoAssetURL_library___block_invoke;
  v11[3] = &unk_1E3676EA0;
  v7 = v6;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performBlockAndWait:completionHandler:", v11, 0);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (double)_durationForVideoFilePath:(id)a3
{
  id v3;
  void *v4;
  int v5;
  double Seconds;
  void *v7;
  void *v8;
  void *v9;
  CMTime time;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  Seconds = 0.0;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

  }
  return Seconds;
}

+ (int64_t)_estimatedOutputFileLengthForDuration:(double)a3 exportPreset:(id)a4 exportProperties:(id)a5
{
  void *v7;
  id v8;
  id v9;
  int64_t v10;
  CMTime v12;
  CMTime v13;

  if (a3 <= 0.0)
    return 0;
  v7 = (void *)MEMORY[0x1E0D75298];
  v8 = a5;
  v9 = a4;
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&v13, a3, objc_msgSend(v7, "preferredTimeScale"));
  v12 = v13;
  v10 = objc_msgSend(MEMORY[0x1E0C8AFC0], "estimatedOutputFileLengthForPreset:duration:properties:", v9, &v12, v8);

  return v10;
}

+ (id)_objectBuilderFromVideoFilePath:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75308]), "initWithPropertyListDictionary:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v6, v7);

  return v8;
}

+ (id)exportSessionForVideoURL:(id)a3 library:(id)a4 fallbackFilePath:(id)a5 exportPreset:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__30537;
  v31 = __Block_byref_object_dispose__30538;
  v32 = 0;
  if ((objc_msgSend(v10, "isFileURL") & 1) == 0)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__PLAssetSharingUtilities_exportSessionForVideoURL_library_fallbackFilePath_exportPreset___block_invoke;
    v22[3] = &unk_1E3676EC8;
    v23 = v11;
    v24 = v10;
    v25 = v13;
    v26 = &v27;
    objc_msgSend(v23, "performBlockAndWait:completionHandler:", v22, 0);

  }
  if (!v28[5] && objc_msgSend(v10, "isFileURL"))
  {
    objc_msgSend(v10, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "exportSessionForVideoFilePath:metadata:exportPreset:", v14, 0, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v28[5];
    v28[5] = v15;

  }
  v17 = (void *)v28[5];
  if (!v17)
  {
    objc_msgSend(a1, "exportSessionForVideoFilePath:metadata:exportPreset:", v12, 0, v13);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v28[5];
    v28[5] = v18;

    v17 = (void *)v28[5];
  }
  v20 = v17;
  _Block_object_dispose(&v27, 8);

  return v20;
}

+ (id)exportSessionForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__30537;
  v21 = __Block_byref_object_dispose__30538;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v8);

  if (v12)
  {
    objc_msgSend(a1, "_objectBuilderFromVideoFilePath:metadata:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __79__PLAssetSharingUtilities_exportSessionForVideoFilePath_metadata_exportPreset___block_invoke;
    v16[3] = &unk_1E3676EF8;
    v16[4] = &v17;
    objc_msgSend(v13, "requestExportSessionWithExportPreset:resultHandler:", v10, v16);

  }
  v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

+ (id)playerItemForVideoURL:(id)a3 fallbackFilePath:(id)a4 library:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isFileURL") & 1) != 0
    || (!v10
      ? (+[PLPhotoLibrary assetsLibraryPhotoLibrary](PLPhotoLibrary, "assetsLibraryPhotoLibrary"),
         v11 = (id)objc_claimAutoreleasedReturnValue())
      : (v11 = v10),
        v12 = v11,
        objc_msgSend(a1, "_playerItemForVideoAssetURL:library:", v8, v11),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    if (!objc_msgSend(v8, "isFileURL")
      || (objc_msgSend(v8, "path"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(a1, "playerItemForVideoFilePath:metadata:", v14, 0),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          !v13))
    {
      objc_msgSend(a1, "playerItemForVideoFilePath:metadata:", v9, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13;
}

+ (id)_playerItemForVideoAssetURL:(id)a3 library:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__30537;
  v19 = __Block_byref_object_dispose__30538;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PLAssetSharingUtilities__playerItemForVideoAssetURL_library___block_invoke;
  v11[3] = &unk_1E3676EA0;
  v7 = v6;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v7, "performBlockAndWait:completionHandler:", v11, 0);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)playerItemForVideoFilePath:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__30537;
  v18 = __Block_byref_object_dispose__30538;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

  if (v9)
  {
    objc_msgSend(a1, "_objectBuilderFromVideoFilePath:metadata:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__PLAssetSharingUtilities_playerItemForVideoFilePath_metadata___block_invoke;
    v13[3] = &unk_1E3668030;
    v13[4] = &v14;
    objc_msgSend(v10, "requestPlayerItemWithResultHandler:", v13);

  }
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

+ (id)assetForVideoURL:(id)a3 metadata:(id)a4 library:(id)a5 outAudioMix:(id *)a6 outVideoComposition:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[7];
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__30537;
  v42 = __Block_byref_object_dispose__30538;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__30537;
  v36 = __Block_byref_object_dispose__30538;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__30537;
  v30 = __Block_byref_object_dispose__30538;
  v31 = 0;
  if ((objc_msgSend(v12, "isFileURL") & 1) == 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke;
    v20[3] = &unk_1E3668AC8;
    v21 = v14;
    v22 = v12;
    v23 = &v38;
    v24 = &v32;
    v25 = &v26;
    objc_msgSend(v21, "performBlockAndWait:completionHandler:", v20, 0);

  }
  if (!v39[5] && objc_msgSend(v12, "isFileURL"))
  {
    objc_msgSend(v12, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_objectBuilderFromVideoFilePath:metadata:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke_3;
    v19[3] = &unk_1E3668058;
    v19[4] = &v38;
    v19[5] = &v32;
    v19[6] = &v26;
    objc_msgSend(v16, "requestAVAssetWithResultHandler:", v19);

  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v33[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v27[5]);
  v17 = (id)v39[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v17;
}

void __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "photoFromAssetURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:](PLSlalomUtilities, "videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke_2;
    v5[3] = &unk_1E3668058;
    v6 = *(_OWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v3, "requestAVAssetWithResultHandler:", v5);

    v2 = v4;
  }

}

void __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke_3(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

void __93__PLAssetSharingUtilities_assetForVideoURL_metadata_library_outAudioMix_outVideoComposition___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

void __63__PLAssetSharingUtilities_playerItemForVideoFilePath_metadata___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__PLAssetSharingUtilities__playerItemForVideoAssetURL_library___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "photoFromAssetURL:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isVideo"))
  {
    +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:](PLSlalomUtilities, "videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:", v3, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__PLAssetSharingUtilities__playerItemForVideoAssetURL_library___block_invoke_2;
    v4[3] = &unk_1E3668030;
    v4[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "requestPlayerItemWithResultHandler:", v4);

  }
}

void __63__PLAssetSharingUtilities__playerItemForVideoAssetURL_library___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __79__PLAssetSharingUtilities_exportSessionForVideoFilePath_metadata_exportPreset___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __90__PLAssetSharingUtilities_exportSessionForVideoURL_library_fallbackFilePath_exportPreset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "photoFromAssetURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:](PLSlalomUtilities, "videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __90__PLAssetSharingUtilities_exportSessionForVideoURL_library_fallbackFilePath_exportPreset___block_invoke_2;
    v6[3] = &unk_1E3676EF8;
    v4 = *(_QWORD *)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v3, "requestExportSessionWithExportPreset:resultHandler:", v4, v6);

    v2 = v5;
  }

}

void __90__PLAssetSharingUtilities_exportSessionForVideoURL_library_fallbackFilePath_exportPreset___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __61__PLAssetSharingUtilities__durationForVideoAssetURL_library___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "photoFromAssetURL:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isVideo"))
  {
    +[PLSlalomUtilities durationForManagedAsset:applyVideoAdjustments:](PLSlalomUtilities, "durationForManagedAsset:applyVideoAdjustments:", v3, 1);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  }

}

void __67__PLAssetSharingUtilities_filePathForVideoURL_library_outMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "photoFromAssetURL:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isVideo"))
  {
    objc_msgSend(v9, "pathForOriginalFile");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (*(_QWORD *)(a1 + 64))
    {
      if (objc_msgSend(v9, "isDefaultAdjustedSlomo"))
      {
        +[PLSlalomUtilities synchronouslyFetchVideoAdjustmentsFromManagedAsset:](PLSlalomUtilities, "synchronouslyFetchVideoAdjustmentsFromManagedAsset:", v9);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "propertyListDictionary");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

      }
    }
  }

}

void __67__PLAssetSharingUtilities__thumbnailForAssetURL_library_useAspect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 32), "photoFromAssetURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v14 = v2;
    v4 = objc_msgSend(v2, "isDeleted");
    v3 = v14;
    if ((v4 & 1) == 0)
    {
      if (!objc_msgSend(v14, "isCloudSharedAsset")
        || (v5 = objc_msgSend(v14, "cloudPlaceholderKind"), v3 = v14, v5 >= 3))
      {
        v6 = *(unsigned __int8 *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v6)
          objc_msgSend(v7, "masterThumbnailFormat");
        else
          objc_msgSend(v7, "indexSheetUnbakedFormat");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "formatID");

        PLPushPhotoLibraryClient(2);
        objc_msgSend(v14, "imageWithFormat:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        PLPopPhotoLibraryClient();
        v3 = v14;
      }
    }
  }

}

@end
