@implementation PLImageLoadingUtilities

+ (BOOL)canAccessImageForAsset:(id)a3
{
  id v3;
  void *v4;
  char v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "pl_photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__PLImageLoadingUtilities_canAccessImageForAsset___block_invoke;
    v7[3] = &unk_1E3677C68;
    v9 = &v10;
    v8 = v3;
    objc_msgSend(v4, "performBlockAndWait:", v7);

    v5 = *((_BYTE *)v11 + 24) != 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "complete");
    *((_BYTE *)v11 + 24) = v5;
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

+ (void)_assetsdImageForAsset:(id)a3 withFormat:(id)a4 allowPlaceholder:(BOOL)a5 optimalSourcePixelSize:(CGSize)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 sync:(BOOL)a9 isCanceledHandler:(id)a10 completion:(id)a11
{
  _BOOL4 v11;
  CGFloat height;
  CGFloat width;
  _BOOL8 v14;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char isKindOfClass;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void (**v34)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v42;
  _BOOL4 v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  CGFloat v63;
  CGFloat v64;
  __int16 v65;
  BOOL v66;
  _QWORD v67[4];
  id v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;

  v11 = a9;
  v42 = a7;
  v43 = a8;
  height = a6.height;
  width = a6.width;
  v14 = a5;
  v16 = a3;
  v17 = a4;
  v18 = a10;
  v19 = a11;
  v77 = 0;
  v78 = &v77;
  v79 = 0x3010000000;
  v81 = 0;
  v82 = 0;
  v80 = &unk_199CADF31;
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__22838;
  v75 = __Block_byref_object_dispose__22839;
  v76 = 0;
  objc_msgSend(v16, "pl_photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v22 = MEMORY[0x1E0C809B0];
  if ((isKindOfClass & 1) != 0)
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke;
    v67[3] = &unk_1E3677830;
    v69 = &v71;
    v68 = v16;
    v70 = &v77;
    objc_msgSend(v20, "performBlockAndWait:completionHandler:", v67, 0);

  }
  else
  {
    objc_msgSend(v16, "objectID");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v72[5];
    v72[5] = v23;

    objc_msgSend(v16, "imageSize");
    v25 = v78;
    v78[4] = v26;
    v25[5] = v27;
  }
  v28 = objc_msgSend(v17, "formatID");
  v44 = (id)v72[5];
  v56[0] = v22;
  v56[1] = 3221225472;
  v56[2] = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_2;
  v56[3] = &unk_1E3666900;
  v29 = v18;
  v60 = v29;
  v30 = v19;
  v61 = v30;
  v31 = v20;
  v57 = v31;
  v32 = v16;
  v58 = v32;
  v65 = v28;
  v63 = width;
  v64 = height;
  v66 = v14;
  v33 = v17;
  v59 = v33;
  v62 = &v77;
  v34 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v56);
  if (v11)
  {
    +[PLAssetsSaver sharedAssetsSaver](PLAssetsSaver, "sharedAssetsSaver");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v55 = 0;
    objc_msgSend(v35, "requestSynchronousImageForAssetOID:withFormat:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageDataInfo:outCPLDownloadContext:", v44, v28, v14, 0, v42, v43, &v55, &v54);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v55;
    v38 = v54;

    ((void (**)(_QWORD, void *, id, id))v34)[2](v34, v36, v37, v38);
  }
  else
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__22838;
    v52 = __Block_byref_object_dispose__22839;
    v53 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v32, "pl_photoLibrary");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v22;
      v45[1] = 3221225472;
      v45[2] = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_23;
      v45[3] = &unk_1E3677C68;
      v47 = &v48;
      v46 = v32;
      objc_msgSend(v39, "performBlockAndWait:completionHandler:", v45, 0);

    }
    else
    {
      objc_msgSend(v32, "objectID");
      v40 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v49[5];
      v49[5] = v40;
    }

    +[PLAssetsSaver sharedAssetsSaver](PLAssetsSaver, "sharedAssetsSaver");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "requestAsynchronousImageForAssetOID:withFormat:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:completionBlock:", v49[5], v28, v14, 0, v42, v43, v34);

    _Block_object_dispose(&v48, 8);
  }

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v77, 8);

}

+ (void)_imageForAsset:(id)a3 withFormat:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 optimalSourcePixelSize:(CGSize)a6 networkAccessAllowed:(BOOL)a7 networkAccessForced:(BOOL)a8 trackCPLDownload:(BOOL)a9 isCanceledHandler:(id)a10 completion:(id)a11 sync:(BOOL)a12
{
  _BOOL8 v12;
  _BOOL4 v13;
  _BOOL8 v14;
  double height;
  double width;
  _BOOL8 v17;
  uint64_t v18;
  id v20;
  id v21;
  void (**v22)(id, void *, CFTypeRef, id, _QWORD);
  int v23;
  int v24;
  void *v25;
  int IsIPad;
  char v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  uint64_t v40;
  const void *v41;
  CFTypeID v42;
  uint64_t v43;
  void *v44;
  void *v45;
  CGImage *v46;
  id v47;
  void *v48;
  CFTypeRef v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  CFTypeRef cf;

  v12 = a9;
  v13 = a8;
  v14 = a7;
  height = a6.height;
  width = a6.width;
  v17 = a5;
  v18 = a4;
  v20 = a3;
  v21 = a10;
  v22 = (void (**)(id, void *, CFTypeRef, id, _QWORD))a11;
  if ((objc_msgSend(a1, "canAccessImageForAsset:", v20) & 1) != 0)
  {
    v50 = v21;
    objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v18);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v51, "isThumbnail");
    v24 = PLIsAssetsd();
    if ((v24 & 1) == 0 && (v14 && v13 || v23 != 1))
    {
      v21 = v50;
      objc_msgSend(a1, "_assetsdImageForAsset:withFormat:allowPlaceholder:optimalSourcePixelSize:networkAccessAllowed:trackCPLDownload:sync:isCanceledHandler:completion:", v20, v51, v17, v14, v12, a12, width, height, v50, v22);
LABEL_54:

      goto LABEL_55;
    }
    cf = 0;
    v25 = (void *)MEMORY[0x19AEC1554]();
    if ((_DWORD)v18 == 3039)
    {
      IsIPad = PLPhysicalDeviceIsIPad();
      v27 = objc_msgSend(v20, "isVideo");
      v28 = v23 ^ 1u;
      if (((v23 ^ 1) & 1) == 0 && (v27 & 1) == 0)
      {
        if (((IsIPad | v24 ^ 1) & 1) == 0
          && objc_msgSend(v20, "isJPEG")
          && (objc_msgSend(v20, "isVideo") & 1) == 0)
        {
          objc_msgSend(v20, "pathForOriginalFile");
          v29 = objc_claimAutoreleasedReturnValue();
LABEL_19:
          v33 = (void *)v29;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
    else
    {
      if ((v23 & 1) != 0)
        goto LABEL_26;
      if ((_DWORD)v18 == 9997)
      {
        objc_msgSend(v20, "pathForPenultimateFullsizeRenderImageFile");
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      v28 = 1;
    }
    v52 = 0;
    v53 = 0;
    v34 = +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:](PLResourceChooser, "fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:", v20, v51, 0, v28, &v52, &v53);
    v35 = v52;
    v33 = v35;
    if ((v23 & 1) != 0 || v53 != 9 && v53 != 7)
    {
LABEL_27:
      if (objc_msgSend(v33, "length"))
      {
        v36 = (void *)PLCreateImageFromFileWithFormat(v33, 0, 0, v18, 0, &cf, 0);
        if (v36)
          v37 = v23;
        else
          v37 = 1;
        if ((v37 & 1) == 0)
        {
          objc_msgSend(v20, "pathForOriginalFile");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v50;
          if ((objc_msgSend(v33, "isEqualToString:", v38) & 1) != 0)
          {
            v39 = objc_msgSend(v20, "isPrimaryImageFormat");

            if ((v39 & 1) != 0)
              goto LABEL_41;
            objc_msgSend(v20, "orientation");
            v40 = PLImageOrientationFromExifOrientation();
            if (v40 == MEMORY[0x19AEBFDF0](v36))
              goto LABEL_41;
            v41 = (const void *)DCIM_CGImageRefFromPLImage();
            if (v41 || (v41 = (const void *)MEMORY[0x19AEBFD84](v36)) != 0)
            {
              v42 = CFGetTypeID(v41);
              if (v42 == CGImageGetTypeID())
              {
                v43 = DCIM_newPLImageWithCGImage();
                v21 = v50;
LABEL_59:

                v36 = (void *)v43;
                goto LABEL_41;
              }
              v21 = v50;
            }
            v43 = DCIM_newPLImageWithIOSurface();
            goto LABEL_59;
          }

LABEL_41:
          if (cf)
            CFRetain(cf);

          objc_autoreleasePoolPop(v25);
          v47 = 0;
          if (v17 && !v36)
          {
            if ((objc_msgSend(v20, "hasAllThumbs") & 1) != 0)
            {
              v36 = 0;
              v47 = 0;
            }
            else
            {
              v47 = objc_alloc_init(MEMORY[0x1E0D73230]);
              objc_msgSend(v47, "setDeliveredPlaceholder:", 1);
              +[PLPlaceholderThumbnailManager sharedManager](PLPlaceholderThumbnailManager, "sharedManager");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "imageSize");
              v36 = (void *)objc_msgSend(v48, "newPlaceholderImageForFormat:photoImageSize:", v18);

            }
          }
          if (v36)
            v49 = cf;
          else
            v49 = 0;
          v22[2](v22, v36, v49, v47, 0);
          if (cf)
            CFRelease(cf);

          goto LABEL_54;
        }
      }
      else
      {
        objc_msgSend(v20, "pl_photoLibrary");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "thumbnailManager");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (CGImage *)objc_msgSend(v45, "newImageForAsset:format:", v20, v51);

        v36 = (void *)DCIM_newPLImageWithCGImage();
        CGImageRelease(v46);
      }
      v21 = v50;
      goto LABEL_41;
    }

LABEL_26:
    v33 = 0;
    goto LABEL_27;
  }
  if (v17)
  {
    v30 = objc_alloc_init(MEMORY[0x1E0D73230]);
    objc_msgSend(v30, "setDeliveredPlaceholder:", 1);
    +[PLPlaceholderThumbnailManager sharedManager](PLPlaceholderThumbnailManager, "sharedManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageSize");
    v32 = (void *)objc_msgSend(v31, "newPlaceholderImageForFormat:photoImageSize:", v18);

  }
  else
  {
    v30 = 0;
    v32 = 0;
  }
  v22[2](v22, v32, 0, v30, 0);

LABEL_55:
}

+ (id)synchronousImageForAsset:(id)a3 withFormat:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 optimalSourcePixelSize:(CGSize)a6 networkAccessAllowed:(BOOL)a7 networkAccessForced:(BOOL)a8 trackCPLDownload:(BOOL)a9 outImageProperties:(const __CFDictionary *)a10 outImageDataInfo:(id *)a11 outCPLDownloadContext:(id *)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  double height;
  double width;
  _BOOL8 v17;
  uint64_t v18;
  id v20;
  id v21;
  uint64_t v23;
  _QWORD v24[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v12 = a9;
  v13 = a8;
  v14 = a7;
  height = a6.height;
  width = a6.width;
  v17 = a5;
  v18 = a4;
  v20 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__22838;
  v45 = __Block_byref_object_dispose__22839;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__22838;
  v35 = __Block_byref_object_dispose__22839;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__22838;
  v29 = __Block_byref_object_dispose__22839;
  v30 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __219__PLImageLoadingUtilities_synchronousImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_networkAccessForced_trackCPLDownload_outImageProperties_outImageDataInfo_outCPLDownloadContext___block_invoke;
  v24[3] = &unk_1E3666928;
  v24[4] = &v41;
  v24[5] = &v37;
  v24[6] = &v31;
  v24[7] = &v25;
  LOBYTE(v23) = 1;
  objc_msgSend(a1, "_imageForAsset:withFormat:allowPlaceholder:optimalSourcePixelSize:networkAccessAllowed:networkAccessForced:trackCPLDownload:isCanceledHandler:completion:sync:", v20, v18, v17, v14, v13, v12, width, height, 0, v24, v23);
  if (a10)
    *a10 = (const __CFDictionary *)v38[3];
  if (a11)
    *a11 = objc_retainAutorelease((id)v32[5]);
  if (a12)
    *a12 = objc_retainAutorelease((id)v26[5]);
  v21 = (id)v42[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v21;
}

+ (id)newSynchronousImageForAsset:(id)a3 withFormat:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 outImageProperties:(const __CFDictionary *)a6 outDeliveredPlaceholder:(BOOL *)a7
{
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  objc_msgSend(a1, "synchronousImageForAsset:withFormat:allowPlaceholder:optimalSourcePixelSize:networkAccessAllowed:networkAccessForced:trackCPLDownload:outImageProperties:outImageDataInfo:outCPLDownloadContext:", a3, a4, a5, 0, 0, 0, 0.0, 0.0, a6, &v12, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = v9;
  if (a7)
    *a7 = objc_msgSend(v9, "deliveredPlaceholder");

  return v8;
}

void __219__PLImageLoadingUtilities_synchronousImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_networkAccessForced_trackCPLDownload_outImageProperties_outImageDataInfo_outCPLDownloadContext___block_invoke(_QWORD *a1, void *a2, const void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  CFTypeRef v12;
  CFTypeRef v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v10 = a4;
  v11 = a5;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  if (a3)
  {
    v12 = CFRetain(a3);
    v13 = CFAutorelease(v12);
  }
  else
  {
    v13 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v13;
  if (v10)
    v14 = (void *)CFAutorelease(v10);
  else
    v14 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v14);
  if (v11)
    v15 = (void *)CFAutorelease(v11);
  else
    v15 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v15);

}

uint64_t __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(a1 + 32), "imageSize");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;
  return result;
}

void __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  __int16 v25;
  _QWORD v26[4];
  id v27;
  __int16 v28;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 56);
  if (!v10 || !(*(unsigned int (**)(void))(v10 + 16))())
  {
    objc_msgSend(v8, "UTI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v8, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_3;
        v26[3] = &unk_1E366EF90;
        v13 = *(void **)(a1 + 32);
        v27 = *(id *)(a1 + 40);
        v28 = *(_WORD *)(a1 + 96);
        objc_msgSend(v13, "performBlock:", v26);

      }
    }
    if (v7)
    {
      if (*(double *)(a1 + 80) == 0.0 && *(double *)(a1 + 88) == 0.0)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        DCIM_NSValueFromCGSize();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("kPLOptimalSourcePixelSizeKey"));

      }
      v16 = PLCreateImageFromDataWithFormat(v7, 0, (void *)*(unsigned __int16 *)(a1 + 96), v11, 1, 0, v14);
      if (v9 | v16)
      {
        v17 = (void *)v16;

        if (v17)
        {
LABEL_22:
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

          goto LABEL_23;
        }
      }
      else
      {
        v20 = MEMORY[0x1E0C809B0];
        v21 = 3221225472;
        v22 = __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_19;
        v23 = &unk_1E366EF90;
        v18 = *(void **)(a1 + 32);
        v24 = *(id *)(a1 + 40);
        v25 = *(_WORD *)(a1 + 96);
        objc_msgSend(v18, "performBlock:", &v20);

      }
    }
    if (*(_BYTE *)(a1 + 98) && objc_msgSend(*(id *)(a1 + 48), "isThumbnail"))
    {
      if (v8)
        objc_msgSend(v8, "setDeliveredPlaceholder:", 1);
      +[PLPlaceholderThumbnailManager sharedManager](PLPlaceholderThumbnailManager, "sharedManager", v20, v21, v22, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v19, "newPlaceholderImageForFormat:photoImageSize:", *(unsigned __int16 *)(a1 + 96), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

    }
    else
    {
      v17 = 0;
    }
    goto LABEL_22;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_23:

}

void __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_23(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int16 *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "assetsd returned an image URL but no UTI for asset: %@ with format %u", (uint8_t *)&v5, 0x12u);
  }

}

void __172__PLImageLoadingUtilities__assetsdImageForAsset_withFormat_allowPlaceholder_optimalSourcePixelSize_networkAccessAllowed_trackCPLDownload_sync_isCanceledHandler_completion___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int16 *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Unable to create image from data for asset %@ with format %u", (uint8_t *)&v5, 0x12u);
  }

}

uint64_t __50__PLImageLoadingUtilities_canAccessImageForAsset___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "complete");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
