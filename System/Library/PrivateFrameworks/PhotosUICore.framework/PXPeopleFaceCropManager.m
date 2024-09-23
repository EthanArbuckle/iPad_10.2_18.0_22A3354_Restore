@implementation PXPeopleFaceCropManager

- (PXPeopleFaceCropManager)init
{
  PXPeopleFaceCropManager *v2;
  NSCache *v3;
  NSCache *faceCropCache;
  NSCache *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *faceCropRequestsByRequestIDs;
  NSMutableSet *v9;
  NSMutableSet *peopleWithoutKeyFaces;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPeopleFaceCropManager;
  v2 = -[PXPeopleFaceCropManager init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    faceCropCache = v2->_faceCropCache;
    v2->_faceCropCache = v3;

    v5 = v2->_faceCropCache;
    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v5, "setEvictsObjectsWhenApplicationEntersBackground:", objc_msgSend(v6, "evictsCacheWhenBackgrounded"));

    v2->_faceCropCacheLock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    faceCropRequestsByRequestIDs = v2->_faceCropRequestsByRequestIDs;
    v2->_faceCropRequestsByRequestIDs = v7;

    v2->_faceCropRequestsByRequestIDsLock._os_unfair_lock_opaque = 0;
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    peopleWithoutKeyFaces = v2->_peopleWithoutKeyFaces;
    v2->_peopleWithoutKeyFaces = v9;

    v2->_peopleWithoutKeyFacesLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (int)requestFaceCropForOptions:(id)a3 resultHandler:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  int v21;

  v6 = (void (**)(id, void *, id))a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  -[PXPeopleFaceCropManager _cachedResultForOptions:](self, "_cachedResultForOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_9;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "assetLocalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("PXPeopleAssetLocalIdentifierKey"));

  v11 = objc_msgSend(v8, "isCropped");
  v12 = (void *)MEMORY[0x1E0CB3B18];
  if (v11)
  {
    v13 = *(double *)off_1E50B86D0;
    v14 = *((double *)off_1E50B86D0 + 1);
    v15 = *((double *)off_1E50B86D0 + 2);
    v16 = *((double *)off_1E50B86D0 + 3);
  }
  else
  {
    objc_msgSend(v8, "faceRect");
  }
  objc_msgSend(v12, "valueWithCGRect:", v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("PXPeopleContentsRectKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isDegraded"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, *(_QWORD *)off_1E50B8440);

  objc_msgSend(v8, "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v19, v9);

  if ((objc_msgSend(v8, "isDegraded") & 1) != 0)
  {

LABEL_9:
    v21 = -[PXPeopleFaceCropManager _prepareFaceCropRequestWithOptions:resultHandler:](self, "_prepareFaceCropRequestWithOptions:resultHandler:", v7, v6);
    goto LABEL_10;
  }
  v20 = objc_msgSend(v8, "isCropped");

  if ((v20 & 1) == 0)
    goto LABEL_9;
  v21 = 0;
LABEL_10:

  return v21;
}

- (void)cancelRequestForRequestID:(int)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
  -[NSMutableDictionary objectForKey:](self->_faceCropRequestsByRequestIDs, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_faceCropRequestsByRequestIDs, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_faceCropRequestsByRequestIDsLock);
  objc_msgSend(v5, "cancel");
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: canceled request: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (BOOL)isRequestActiveWithRequestID:(int)a3
{
  void *v4;
  os_unfair_lock_s *p_faceCropRequestsByRequestIDsLock;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_faceCropRequestsByRequestIDsLock = &self->_faceCropRequestsByRequestIDsLock;
  os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
  -[NSMutableDictionary objectForKey:](self->_faceCropRequestsByRequestIDs, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_faceCropRequestsByRequestIDsLock);

  return v6 != 0;
}

- (void)invalidateCacheForPerson:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a3, "localIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObject:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleFaceCropManager _invalidateCacheForLocalIdentifiers:wantsNotificationPosted:userInfoKey:](self, "_invalidateCacheForLocalIdentifiers:wantsNotificationPosted:userInfoKey:", v5, 1, CFSTR("PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey"));

  }
}

- (int)_prepareFaceCropRequestWithOptions:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  PXPeopleFaceCropRequest *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  PXPeopleFaceCropRequest *v18;
  NSObject *v19;
  _QWORD v21[4];
  NSObject *v22;
  PXPeopleFaceCropRequest *v23;
  id v24;
  PXPeopleFaceCropManager *v25;
  id v26;
  os_signpost_id_t v27;
  int v28;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  +[PXPeopleFaceCropManager _faceCropManagerLog](PXPeopleFaceCropManager, "_faceCropManagerLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "prepareRequest", ", buf, 2u);
  }

  objc_msgSend(v6, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "px_registerChangeObserver:", self);

  v13 = -[PXPeopleFaceCropRequest initWithFetchOptions:]([PXPeopleFaceCropRequest alloc], "initWithFetchOptions:", v6);
  v14 = -[PXPeopleFaceCropRequest faceCropRequestID](v13, "faceCropRequestID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
  -[NSMutableDictionary setObject:forKey:](self->_faceCropRequestsByRequestIDs, "setObject:forKey:", v13, v15);
  os_unfair_lock_unlock(&self->_faceCropRequestsByRequestIDsLock);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__PXPeopleFaceCropManager__prepareFaceCropRequestWithOptions_resultHandler___block_invoke;
  v21[3] = &unk_1E5135870;
  v22 = v11;
  v23 = v13;
  v24 = v6;
  v25 = self;
  v28 = v14;
  v26 = v7;
  v27 = v9;
  v16 = v7;
  v17 = v6;
  v18 = v13;
  v19 = v11;
  -[PXPeopleFaceCropManager _fetchFaceAndAssetIfNecessaryForOptions:completion:](self, "_fetchFaceAndAssetIfNecessaryForOptions:completion:", v17, v21);

  return v14;
}

- (void)_executeFaceCropRequest:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  PXPeopleFaceCropManager *v35;
  id v36;
  os_signpost_id_t v37;
  double v38;
  double v39;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  +[PXPeopleFaceCropManager _faceCropManagerLog](PXPeopleFaceCropManager, "_faceCropManagerLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "executeRequest", ", buf, 2u);
  }

  objc_msgSend(v6, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetSizeToUse");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "normalizedFaceCropRect");
  +[PXPeopleFaceCropManager _constrainedSizeForDesiredSize:](PXPeopleFaceCropManager, "_constrainedSizeForDesiredSize:", ceil(v14 / v17), ceil(v16 / v18));
  v20 = v19;
  v22 = v21;
  v23 = objc_msgSend(v12, "isSynchronous");
  v24 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v24, "setDeliveryMode:", objc_msgSend(v12, "deliveryMode"));
  objc_msgSend(v24, "setSynchronous:", v23);
  objc_msgSend(v24, "setUseLowMemoryMode:", objc_msgSend(v12, "useLowMemoryMode"));
  objc_msgSend(v24, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v24, "setAllowSecondaryDegradedImage:", 1);
  objc_msgSend(v24, "setResizeMode:", 1);
  objc_msgSend(v24, "setLoadingMode:", 0x40000);
  if ((v23 & 1) == 0)
  {
    +[PXPeopleFaceCropManager _fetchQueue](PXPeopleFaceCropManager, "_fetchQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setResultHandlerQueue:", v25);

  }
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __65__PXPeopleFaceCropManager__executeFaceCropRequest_resultHandler___block_invoke;
  v32[3] = &unk_1E5135898;
  v36 = v7;
  v37 = v9;
  v33 = v11;
  v34 = v6;
  v35 = self;
  v38 = v20;
  v39 = v22;
  v28 = v7;
  v29 = v6;
  v30 = v11;
  v31 = objc_msgSend(v26, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v27, 1, v24, v32, v20, v22);

  objc_msgSend(v29, "setImageManagerRequestID:", v31);
}

- (void)_handleImage:(id)a3 info:(id)a4 faceCropRequest:(id)a5 resultHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id, void *);
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CGImage *v38;
  double Height;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  uint64_t v53;
  PXPeopleFaceCropFetchResult *v54;
  void *v55;
  void (**v56)(id, id, void *);
  void *v57;
  PXPeopleFaceCropFetchResult *v58;
  void *v59;
  NSObject *v60;
  void (**v61)(_QWORD);
  void *v62;
  int v63;
  NSObject *v64;
  __CFString *v65;
  void *v66;
  __CFString *v67;
  __CFString *v68;
  __CFString *v69;
  __CFString *v70;
  NSObject *v71;
  __CFString *v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  __CFString *v76;
  double v77;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  _QWORD aBlock[4];
  NSObject *v85;
  os_signpost_id_t v86;
  uint8_t buf[4];
  __CFString *v88;
  __int16 v89;
  __CFString *v90;
  __int16 v91;
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v83 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, id, void *))a6;
  +[PXPeopleFaceCropManager _faceCropManagerLog](PXPeopleFaceCropManager, "_faceCropManagerLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "handleResponse", ", buf, 2u);
  }

  objc_msgSend(v10, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetSizeToUse");
  objc_msgSend(v10, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pixelWidth");
  v81 = v17;
  objc_msgSend(v17, "pixelHeight");
  objc_msgSend(v10, "normalizedCenterEyeLine");
  PXPointDenormalize();
  objc_msgSend(v10, "normalizedFaceCropRect");
  PXRectDenormalize();
  PXSizeGetAspectRatio();
  +[PXPeopleFaceCropManager cropRectWithAspectRatioFittingAroundEyeLevelForAspectRatio:pixelFaceCrop:eyelinePoint:](PXPeopleFaceCropManager, "cropRectWithAspectRatioFittingAroundEyeLevelForAspectRatio:pixelFaceCrop:eyelinePoint:");
  PXRectNormalize();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v10, "setNormalizedEdgeAdjustedCropRect:");
  if (objc_msgSend(v16, "wantsFlippedContentsRect"))
  {
    objc_msgSend(v10, "flippedNormalizedEdgeAdjustedCropRect");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
  }
  else
  {
    v27 = v19;
    v29 = v21;
    v31 = v23;
    v33 = v25;
  }
  v82 = v16;
  if (!objc_msgSend(v16, "deliveryMode"))
  {
    v34 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v27, v29, v31, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryWithObject:forKey:", v35, CFSTR("PXPeopleContentsRectKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v82;
    objc_msgSend(v81, "localIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("PXPeopleAssetLocalIdentifierKey"));

    objc_msgSend(v36, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *(_QWORD *)off_1E50B8440);
    if (objc_msgSend(v82, "wantsSmallFaceRect"))
    {
      v38 = (CGImage *)objc_msgSend(objc_retainAutorelease(v83), "CGImage");
      CGImageGetWidth(v38);
      v77 = v29;
      Height = (double)CGImageGetHeight(v38);
      PXRectDenormalize();
      v41 = v40;
      v43 = v42;
      v45 = v44;
      objc_msgSend(v10, "normalizedSmallFaceRect");
      PXRectDenormalize();
      v46 = Height / v45;
      v29 = v77;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v46 * (v47 - v41), v46 * (v48 - v43), v46 * v49, v46 * v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKey:", v51, CFSTR("PXPeopleSmallFaceRectKey"));

    }
    v11[2](v11, v83, v36);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48], *(_QWORD *)&v77);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "BOOLValue");

  if (objc_msgSend(v16, "shouldCacheResult"))
  {
    v54 = [PXPeopleFaceCropFetchResult alloc];
    objc_msgSend(v81, "objectID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "localIdentifier");
    v56 = v11;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[PXPeopleFaceCropFetchResult initWithImage:assetObjectID:assetLocalIdentifier:faceRect:isCropped:isDegraded:options:](v54, "initWithImage:assetObjectID:assetLocalIdentifier:faceRect:isCropped:isDegraded:options:", v83, v55, v57, 0, v53, v82, v27, v29, v31, v33);

    v11 = v56;
    -[PXPeopleFaceCropManager _cacheResult:](self, "_cacheResult:", v58);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C68]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImageManagerRequestID:", objc_msgSend(v59, "intValue"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PXPeopleFaceCropManager__handleImage_info_faceCropRequest_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5144EB8;
  v85 = v15;
  v86 = v13;
  v60 = v15;
  v61 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C58]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "BOOLValue");

  if ((_DWORD)v53 && !v63 || (objc_msgSend(v10, "canceled") & 1) != 0)
  {
    PLUIGetLog();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)v53)
        v65 = CFSTR("YES");
      else
        v65 = CFSTR("NO");
      v79 = v60;
      v66 = v59;
      v67 = v65;
      if (v63)
        v68 = CFSTR("YES");
      else
        v68 = CFSTR("NO");
      v69 = v68;
      v70 = v67;
      *(_DWORD *)buf = 138412802;
      v88 = v67;
      v59 = v66;
      v60 = v79;
      v89 = 2112;
      v90 = v69;
      v91 = 2112;
      v92 = v10;
      _os_log_impl(&dword_1A6789000, v64, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: not cropping image. isDegraded: %@ isInCloud: %@ request: %@", buf, 0x20u);

    }
    v61[2](v61);
  }
  else
  {
    PLUIGetLog();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v80 = v59;
      if ((_DWORD)v53)
        v72 = CFSTR("YES");
      else
        v72 = CFSTR("NO");
      v73 = v72;
      if (v63)
        v74 = CFSTR("YES");
      else
        v74 = CFSTR("NO");
      v75 = v74;
      v76 = v73;
      *(_DWORD *)buf = 138412802;
      v88 = v73;
      v89 = 2112;
      v90 = v75;
      v91 = 2112;
      v92 = v10;
      _os_log_impl(&dword_1A6789000, v71, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: executing image cropping. isDegraded: %@ isInCloud: %@ request: %@", buf, 0x20u);

      v59 = v80;
    }

    v61[2](v61);
    -[PXPeopleFaceCropManager _cropImage:request:resultHandler:](self, "_cropImage:request:resultHandler:", v83, v10, v11);
  }

}

- (void)_cropImage:(id)a3 request:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  CGImage *v17;
  double Width;
  double Height;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  void (**v25)(_QWORD);
  NSObject *v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  PXPeopleFaceCropManager *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  os_signpost_id_t v38;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[PXPeopleFaceCropManager _faceCropManagerLog](PXPeopleFaceCropManager, "_faceCropManagerLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "imageCrop", ", buf, 2u);
  }

  objc_msgSend(v9, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_retainAutorelease(v8);
  v17 = (CGImage *)objc_msgSend(v16, "CGImage");
  Width = (double)CGImageGetWidth(v17);
  Height = (double)CGImageGetHeight(v17);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PXPeopleFaceCropManager__cropImage_request_resultHandler___block_invoke;
  aBlock[3] = &unk_1E51358C0;
  v20 = v9;
  v34 = 0;
  v35 = 0;
  v28 = v20;
  v36 = Width;
  v37 = Height;
  v21 = v15;
  v29 = v21;
  v22 = v16;
  v30 = v22;
  v23 = v14;
  v31 = v23;
  v38 = v12;
  v24 = v10;
  v32 = self;
  v33 = v24;
  v25 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v21, "isSynchronous"))
  {
    v25[2](v25);
  }
  else
  {
    +[PXPeopleFaceCropManager _cropQueue](PXPeopleFaceCropManager, "_cropQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v26, v25);

  }
}

- (void)_compressImage:(id)a3 request:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  NSObject *v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  PXPeopleFaceCropManager *v28;
  id v29;
  os_signpost_id_t v30;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[PXPeopleFaceCropManager _faceCropManagerLog](PXPeopleFaceCropManager, "_faceCropManagerLog");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "compressImage", ", buf, 2u);
  }

  objc_msgSend(v9, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXPeopleFaceCropManager__compressImage_request_resultHandler___block_invoke;
  aBlock[3] = &unk_1E51430C0;
  v16 = v9;
  v24 = v16;
  v17 = v8;
  v25 = v17;
  v18 = v14;
  v26 = v18;
  v30 = v12;
  v19 = v15;
  v27 = v19;
  v20 = v10;
  v28 = self;
  v29 = v20;
  v21 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v19, "isSynchronous"))
  {
    v21[2](v21);
  }
  else
  {
    +[PXPeopleFaceCropManager _compressionQueue](PXPeopleFaceCropManager, "_compressionQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v22, v21);

  }
}

- (void)_cleanupForImage:(id)a3 request:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  PXPeopleFaceCropFetchResult *v9;
  void *v10;
  void *v11;
  PXPeopleFaceCropFetchResult *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v6, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "shouldCacheResult"))
  {
    objc_msgSend(v6, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [PXPeopleFaceCropFetchResult alloc];
    objc_msgSend(v8, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXPeopleFaceCropFetchResult initWithImage:assetObjectID:assetLocalIdentifier:faceRect:isCropped:isDegraded:options:](v9, "initWithImage:assetObjectID:assetLocalIdentifier:faceRect:isCropped:isDegraded:options:", v14, v10, v11, 1, 0, v7, *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));

    -[PXPeopleFaceCropManager _cacheResult:](self, "_cacheResult:", v12);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "faceCropRequestID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
  -[NSMutableDictionary removeObjectForKey:](self->_faceCropRequestsByRequestIDs, "removeObjectForKey:", v13);
  os_unfair_lock_unlock(&self->_faceCropRequestsByRequestIDsLock);

}

- (void)_fetchFaceAndAssetIfNecessaryForOptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __78__PXPeopleFaceCropManager__fetchFaceAndAssetIfNecessaryForOptions_completion___block_invoke;
  v14 = &unk_1E5148CE0;
  v7 = v5;
  v15 = v7;
  v8 = v6;
  v16 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(&v11);
  if (objc_msgSend(v7, "isSynchronous", v11, v12, v13, v14))
  {
    v9[2](v9);
  }
  else
  {
    +[PXPeopleFaceCropManager _fetchQueue](PXPeopleFaceCropManager, "_fetchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v10, v9);

  }
}

- (id)_cachedResultForOptions:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_faceCropCacheLock;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "cacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    p_faceCropCacheLock = &self->_faceCropCacheLock;
    os_unfair_lock_lock(&self->_faceCropCacheLock);
    -[NSCache objectForKey:](self->_faceCropCache, "objectForKey:", v5);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "options", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "areFetchParametersEqualtoFetchParametersOfOptions:", v4);

          if (v13)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

    os_unfair_lock_unlock(p_faceCropCacheLock);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_cacheResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *p_faceCropCacheLock;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[PXPeopleFaceCropManager _cachedResultForOptions:](self, "_cachedResultForOptions:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_faceCropCacheLock = &self->_faceCropCacheLock;
    os_unfair_lock_lock(&self->_faceCropCacheLock);
    -[NSCache objectForKey:](self->_faceCropCache, "objectForKey:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSCache setObject:forKey:](self->_faceCropCache, "setObject:forKey:", v8, v5);
      if (!v6)
        goto LABEL_9;
    }
    if ((objc_msgSend(v15, "isCropped") & 1) == 0)
    {
      objc_msgSend(v6, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "size");
      v11 = v10;
      objc_msgSend(v15, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");
      v14 = v13;

      if (v11 >= v14)
        goto LABEL_10;
    }
    objc_msgSend(v8, "removeLastObject");
LABEL_9:
    objc_msgSend(v8, "addObject:", v15);
LABEL_10:

    os_unfair_lock_unlock(p_faceCropCacheLock);
  }

}

- (void)_emptyFaceCropCache
{
  os_unfair_lock_s *p_faceCropCacheLock;
  NSObject *v4;
  uint8_t v5[16];

  p_faceCropCacheLock = &self->_faceCropCacheLock;
  os_unfair_lock_lock(&self->_faceCropCacheLock);
  -[NSCache removeAllObjects](self->_faceCropCache, "removeAllObjects");
  os_unfair_lock_unlock(p_faceCropCacheLock);
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: emptied the face crop cache", v5, 2u);
  }

}

- (void)_invalidateCacheForLocalIdentifiers:(id)a3 wantsNotificationPosted:(BOOL)a4 userInfoKey:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  NSMutableDictionary *faceCropRequestsByRequestIDs;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v6 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleFaceCropManager.m"), 883, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!wantsNotificationPosted || (wantsNotificationPosted && userInfoKey)"));

  }
  if (objc_msgSend(v9, "count"))
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("NO");
      if (v6)
        v12 = CFSTR("YES");
      v13 = v12;
      *(_DWORD *)buf = 138543618;
      v39 = v9;
      v40 = 2112;
      v41 = v13;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: invalidating cache for local identifiers: %{public}@ wantsNotificationPosted: %@", buf, 0x16u);

    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    os_unfair_lock_lock(&self->_faceCropRequestsByRequestIDsLock);
    faceCropRequestsByRequestIDs = self->_faceCropRequestsByRequestIDs;
    v16 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __99__PXPeopleFaceCropManager__invalidateCacheForLocalIdentifiers_wantsNotificationPosted_userInfoKey___block_invoke;
    v32[3] = &unk_1E51358E8;
    v17 = v9;
    v33 = v17;
    v18 = v14;
    v34 = v18;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](faceCropRequestsByRequestIDs, "enumerateKeysAndObjectsUsingBlock:", v32);
    -[NSMutableDictionary removeObjectsForKeys:](self->_faceCropRequestsByRequestIDs, "removeObjectsForKeys:", v18);

    os_unfair_lock_unlock(&self->_faceCropRequestsByRequestIDsLock);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          -[PXPeopleFaceCropManager cancelRequestForRequestID:](self, "cancelRequestForRequestID:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "intValue"));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v21);
    }

    os_unfair_lock_lock(&self->_faceCropCacheLock);
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __99__PXPeopleFaceCropManager__invalidateCacheForLocalIdentifiers_wantsNotificationPosted_userInfoKey___block_invoke_2;
    v27[3] = &unk_1E5135910;
    v27[4] = self;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v27);
    os_unfair_lock_unlock(&self->_faceCropCacheLock);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v10;
      v36 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("PXPeopleFaceCropManagerDidInvalidateCacheNotification"), self, v25);

    }
  }

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  BOOL v19;
  int v20;
  BOOL v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  os_unfair_lock_t lock;
  PXPeopleFaceCropManager *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  id (*v67)(uint64_t, void *);
  void *v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  PXPeopleFaceCropManager *v82;
  SEL v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "hasIncrementalChanges") & 1) != 0)
  {
    objc_msgSend(v5, "updatedObjectIDs");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v56 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v55 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    lock = &self->_faceCropCacheLock;
    os_unfair_lock_lock(&self->_faceCropCacheLock);
    v50 = self;
    -[NSCache allObjects](self->_faceCropCache, "allObjects");
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    if (!v53)
      goto LABEL_38;
    v52 = *(_QWORD *)v76;
    v59 = v5;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v76 != v52)
          objc_enumerationMutation(obj);
        v54 = v6;
        v7 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v6);
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v57 = v7;
        v8 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v71, v85, 16, lock);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v72 != v10)
                objc_enumerationMutation(v57);
              v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              objc_msgSend(v12, "options");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "person");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "face");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "assetObjectID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v60, "containsObject:", v16);
              v18 = +[PXPeopleFaceCropManager _change:containsVisibleChangesToAssetWithOID:](PXPeopleFaceCropManager, "_change:containsVisibleChangesToAssetWithOID:", v5, v16);
              v19 = v18;
              if ((v17 & 1) != 0 || v18)
              {
                v22 = v15 != 0;
                if (!v14)
                  goto LABEL_32;
              }
              else
              {
                v20 = objc_msgSend(v5, "contentOrThumbnailChangedForPHAssetOID:", v16);
                if (v14)
                  v21 = v20 == 0;
                else
                  v21 = 0;
                if (v21)
                {
                  objc_msgSend(v14, "objectID");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v5, "keyFaceChangedForPersonOID:", v23);

                  if (!v24)
                    goto LABEL_34;
                  v22 = 0;
                }
                else
                {
                  if (v15)
                    v22 = v20;
                  else
                    v22 = 0;
                  if (!v14)
                  {
                    if (v22)
                      goto LABEL_33;
                    goto LABEL_34;
                  }
                }
                v19 = 0;
              }
              objc_msgSend(v14, "localIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "addObject:", v25);

              if (!v19)
              {
LABEL_32:
                if (!v22)
                  goto LABEL_34;
LABEL_33:
                objc_msgSend(v15, "localIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "addObject:", v26);

                goto LABEL_34;
              }
              objc_msgSend(v55, "addObject:", v14);
              if (v22)
                goto LABEL_33;
LABEL_34:

              v5 = v59;
            }
            v9 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
          }
          while (v9);
        }

        v6 = v54 + 1;
      }
      while (v54 + 1 != v53);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
      if (!v53)
      {
LABEL_38:

        os_unfair_lock_unlock(lock);
        v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        os_unfair_lock_lock(&v50->_peopleWithoutKeyFacesLock);
        v65 = MEMORY[0x1E0C809B0];
        v66 = 3221225472;
        v67 = __56__PXPeopleFaceCropManager_prepareForPhotoLibraryChange___block_invoke_3;
        v68 = &unk_1E5135980;
        v69 = v5;
        v28 = v27;
        v70 = v28;
        PXMap();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet minusSet:](v50->_peopleWithoutKeyFaces, "minusSet:", v28);
        -[NSMutableSet unionSet:](v50->_peopleWithoutKeyFaces, "unionSet:", v55);

        os_unfair_lock_unlock(&v50->_peopleWithoutKeyFacesLock);
        objc_msgSend(v58, "addObjectsFromArray:", v29);
        v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (objc_msgSend(v58, "count"))
        {
          -[PXPeopleFaceCropManager _invalidateCacheForLocalIdentifiers:wantsNotificationPosted:userInfoKey:](v50, "_invalidateCacheForLocalIdentifiers:wantsNotificationPosted:userInfoKey:", v58, 0, 0);
          objc_msgSend(v30, "setObject:forKey:", v58, CFSTR("PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey"));
        }
        if (objc_msgSend(v56, "count", lock))
        {
          -[PXPeopleFaceCropManager _invalidateCacheForLocalIdentifiers:wantsNotificationPosted:userInfoKey:](v50, "_invalidateCacheForLocalIdentifiers:wantsNotificationPosted:userInfoKey:", v56, 0, 0);
          objc_msgSend(v30, "setObject:forKey:", v56, CFSTR("PXPeopleFaceCropManagerInvalidatedFaceLocalIdentifiersKey"));
        }
        if (objc_msgSend(v30, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "postNotificationName:object:userInfo:", CFSTR("PXPeopleFaceCropManagerDidInvalidateCacheNotification"), v50, v30);

        }
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v32 = v55;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v84, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v62;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v62 != v35)
                objc_enumerationMutation(v32);
              v37 = +[PXPeopleUtilities keyFaceForPerson:](PXPeopleUtilities, "keyFaceForPerson:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j));
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v84, 16);
          }
          while (v34);
        }

        goto LABEL_61;
      }
    }
  }
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  os_unfair_lock_lock(&self->_faceCropCacheLock);
  -[NSCache allObjects](self->_faceCropCache, "allObjects");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __56__PXPeopleFaceCropManager_prepareForPhotoLibraryChange___block_invoke;
  v79[3] = &unk_1E5135938;
  v41 = v38;
  v80 = v41;
  v42 = v39;
  v82 = self;
  v83 = a2;
  v81 = v42;
  objc_msgSend(v40, "enumerateObjectsUsingBlock:", v79);

  os_unfair_lock_unlock(&self->_faceCropCacheLock);
  v43 = (void *)objc_msgSend(v42, "copy");
  os_unfair_lock_lock(&self->_peopleWithoutKeyFacesLock);
  PXMap();
  v44 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeAllObjects](self->_peopleWithoutKeyFaces, "removeAllObjects");
  os_unfair_lock_unlock(&self->_peopleWithoutKeyFacesLock);
  if (!v44)
    v44 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  objc_msgSend(v41, "setByAddingObjectsFromArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v45, "count"))
    objc_msgSend(v46, "setObject:forKey:", v45, CFSTR("PXPeopleFaceCropManagerInvalidatedPersonLocalIdentifiersKey"));
  if (objc_msgSend(v43, "count"))
    objc_msgSend(v46, "setObject:forKey:", v43, CFSTR("PXPeopleFaceCropManagerInvalidatedFaceLocalIdentifiersKey"));
  if (objc_msgSend(v46, "count"))
  {
    -[PXPeopleFaceCropManager _emptyFaceCropCache](self, "_emptyFaceCropCache");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "postNotificationName:object:userInfo:", CFSTR("PXPeopleFaceCropManagerDidInvalidateCacheNotification"), self, v46);

  }
LABEL_61:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleWithoutKeyFaces, 0);
  objc_storeStrong((id *)&self->_faceCropRequestsByRequestIDs, 0);
  objc_storeStrong((id *)&self->_faceCropCache, 0);
}

void __56__PXPeopleFaceCropManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(v4, "face");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("PXPeopleFaceCropManager.m"), 933, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v7 = (id *)(a1 + 40);
  }
  objc_msgSend(*v7, "addObject:", v5);

}

id __56__PXPeopleFaceCropManager_prepareForPhotoLibraryChange___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "keyFaceChangedForPersonOID:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    objc_msgSend(v3, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __56__PXPeopleFaceCropManager_prepareForPhotoLibraryChange___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void __99__PXPeopleFaceCropManager__invalidateCacheForLocalIdentifiers_wantsNotificationPosted_userInfoKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a3, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacheKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v7);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

uint64_t __99__PXPeopleFaceCropManager__invalidateCacheForLocalIdentifiers_wantsNotificationPosted_userInfoKey___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", a2);
}

void __78__PXPeopleFaceCropManager__fetchFaceAndAssetIfNecessaryForOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "face");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    if (!v3)
    {
      objc_msgSend(v2, "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "librarySpecificFetchOptions");
      v7 = objc_claimAutoreleasedReturnValue();

      -[NSObject setIncludeTorsoAndFaceDetectionData:](v7, "setIncludeTorsoAndFaceDetectionData:", 1);
      objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setIncludedDetectionTypes:](v7, "setIncludedDetectionTypes:", v8);

      v9 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v2, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("personForFace.personUUID"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setInternalPredicate:](v7, "setInternalPredicate:", v11);

      -[NSObject setFetchLimit:](v7, "setFetchLimit:", 1);
      objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v5, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
LABEL_17:

        goto LABEL_18;
      }
      PLUIGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v2, "localIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        v21 = 2114;
        v22 = v15;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: nil face returned for person: %{public}@ in asset: %{public}@", buf, 0x16u);

      }
LABEL_16:
      v3 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    if (!v3)
    {
      +[PXPeopleUtilities keyFaceForPerson:](PXPeopleUtilities, "keyFaceForPerson:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        PLUIGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v2, "localIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v20 = v18;
          _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: nil key face returned for person: %{public}@", buf, 0xCu);

        }
        v5 = 0;
        goto LABEL_16;
      }
    }
    +[PXPeopleUtilities keyAssetForPerson:face:](PXPeopleUtilities, "keyAssetForPerson:face:", v2, v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      PLUIGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "localIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v17;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: nil asset returned for face: %{public}@", buf, 0xCu);

      }
      v5 = 0;
      goto LABEL_17;
    }
  }
LABEL_18:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __64__PXPeopleFaceCropManager__compressImage_request_resultHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[8];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "canceled") & 1) == 0)
  {
    v2 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "px_ASTCCompressedImageWithBlockSize:", 68);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;

      v2 = v5;
    }
    v6 = *(id *)(a1 + 48);
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 80);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v8, "compressImage", ", v17, 2u);
    }

    v18[0] = CFSTR("PXPeopleContentsRectKey");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("PXPeopleIsFinalImageKey");
    v19[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 32), "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("PXPeopleAssetLocalIdentifierKey"));

    if (objc_msgSend(*(id *)(a1 + 56), "wantsSmallFaceRect"))
    {
      v15 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(*(id *)(a1 + 32), "smallFaceRect");
      objc_msgSend(v15, "valueWithCGRect:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("PXPeopleSmallFaceRectKey"));

    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *(_QWORD *)off_1E50B8440);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    objc_msgSend(*(id *)(a1 + 64), "_cleanupForImage:request:", v2, *(_QWORD *)(a1 + 32));

  }
}

void __60__PXPeopleFaceCropManager__cropImage_request_resultHandler___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t v32[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "canceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "normalizedEdgeAdjustedCropRect");
    PXRectDenormalize();
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "targetSizeToUse");
    v11 = v10;
    v13 = v12;
    v14 = objc_msgSend(*(id *)(a1 + 40), "cornerStyle");
    objc_msgSend(*(id *)(a1 + 40), "displayScale");
    +[PXPeopleFaceCropManager _cornerRadiusForCornerStyle:pixelTargetSize:displayScale:](PXPeopleFaceCropManager, "_cornerRadiusForCornerStyle:pixelTargetSize:displayScale:", v14, v11, v13, v15);
    objc_msgSend(*(id *)(a1 + 48), "px_imageByCroppingRect:pixelTargetSize:cornerRadius:", v3, v5, v7, v9, v11, v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "wantsSmallFaceRect"))
    {
      objc_msgSend(*(id *)(a1 + 32), "normalizedSmallFaceRect");
      PXRectDenormalize();
      objc_msgSend(*(id *)(a1 + 32), "setSmallFaceRect:", v11 / v7 * (v18 - v3), v13 / v9 * (v19 - v5), v11 / v7 * v20, v13 / v9 * v21);
    }
    v22 = *(id *)(a1 + 56);
    v23 = v22;
    v24 = *(_QWORD *)(a1 + 112);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v23, OS_SIGNPOST_INTERVAL_END, v24, "imageCrop", ", v32, 2u);
    }

    if (!objc_msgSend(*(id *)(a1 + 40), "deliveryMode"))
    {
      v25 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "dictionaryWithObject:forKey:", v26, CFSTR("PXPeopleContentsRectKey"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "asset");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v29, CFSTR("PXPeopleAssetLocalIdentifierKey"));

      if (objc_msgSend(*(id *)(a1 + 40), "wantsSmallFaceRect"))
      {
        v30 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(a1 + 32), "smallFaceRect");
        objc_msgSend(v30, "valueWithCGRect:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v31, CFSTR("PXPeopleSmallFaceRectKey"));

      }
      objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *(_QWORD *)off_1E50B8440);
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    }
    objc_msgSend(*(id *)(a1 + 64), "_compressImage:request:resultHandler:", v17, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));

  }
}

void __75__PXPeopleFaceCropManager__handleImage_info_faceCropRequest_resultHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_END, v4, "handleResponse", ", v5, 2u);
  }

}

void __65__PXPeopleFaceCropManager__executeFaceCropRequest_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v9, "executeRequest", ", buf, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 40), "canceled") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "BOOLValue");

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if ((v10 & 1) != 0 || v12)
  {
    if (v10)
    {
      PLUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 40);
        NSStringFromSize(*(NSSize *)(a1 + 72));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v15;
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "PXPeopleFaceCropManager: the image request was canceled. Request: %@ sizeToRequest: %@ info: %@", buf, 0x20u);

      }
    }
    if (v13)
    {
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 40);
        NSStringFromSize(*(NSSize *)(a1 + 72));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v18;
        v25 = 2112;
        v26 = v19;
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: error for image request: %@ sizeToRequest %@ info: %@", buf, 0x20u);

      }
      if ((v10 & 1) == 0)
      {
        v21 = CFSTR("PXPeopleErrorKey");
        v22 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_handleImage:info:faceCropRequest:resultHandler:", v5, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

void __76__PXPeopleFaceCropManager__prepareFaceCropRequestWithOptions_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  _BOOL4 v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD aBlock[4];
  id v26;
  uint64_t v27;
  _BYTE buf[32];
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXPeopleFaceCropManager__prepareFaceCropRequestWithOptions_resultHandler___block_invoke_2;
  aBlock[3] = &unk_1E5144EB8;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 72);
  v26 = v7;
  v27 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(*(id *)(a1 + 40), "canceled") & 1) != 0)
    goto LABEL_20;
  if (!v5)
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: no face for options: %@\n", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 56), "cancelRequestForRequestID:", *(unsigned int *)(a1 + 80));
    objc_msgSend(*(id *)(a1 + 48), "person");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 40), "addObject:", v15);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 48));
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.people.faceCropManagerError"), 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CFSTR("PXPeopleErrorKey");
    v32[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    goto LABEL_19;
  }
  if (!v6)
  {
    PLUIGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "PXPeopleFaceCropManager: failed to fetch an asset for options: %@\n face: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "cancelRequestForRequestID:", *(unsigned int *)(a1 + 80));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.people.faceCropManagerError"), 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = CFSTR("PXPeopleErrorKey");
    v30 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 40), "setFace:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setAsset:", v6);
  objc_msgSend(v5, "px_normalizedCenterEyeLine");
  objc_msgSend(*(id *)(a1 + 40), "setNormalizedCenterEyeLine:");
  v21 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v22 = *MEMORY[0x1E0C9D648];
  *(_OWORD *)buf = *MEMORY[0x1E0C9D648];
  *(_OWORD *)&buf[16] = v21;
  v10 = +[PXPeopleFaceCropManager _shouldTakeSquareCropForFace:cropFactor:outNormalizedFaceCropRect:](PXPeopleFaceCropManager, "_shouldTakeSquareCropForFace:cropFactor:outNormalizedFaceCropRect:", v5, objc_msgSend(*(id *)(a1 + 48), "cropFactor"), buf);
  objc_msgSend(*(id *)(a1 + 40), "setNormalizedFaceCropRect:", *(double *)buf, *(double *)&buf[8], *(_OWORD *)&buf[16]);
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "targetSizeToUse");
    if (v11 >= v12)
      v11 = v12;
    objc_msgSend(*(id *)(a1 + 40), "setTargetSizeToUse:", v11, v11);
  }
  if (objc_msgSend(*(id *)(a1 + 48), "wantsSmallFaceRect"))
  {
    v23 = v22;
    v24 = v21;
    +[PXPeopleFaceCropManager _shouldTakeSquareCropForFace:cropFactor:outNormalizedFaceCropRect:](PXPeopleFaceCropManager, "_shouldTakeSquareCropForFace:cropFactor:outNormalizedFaceCropRect:", v5, 0, &v23);
    objc_msgSend(*(id *)(a1 + 40), "setNormalizedSmallFaceRect:", v23, v24);
  }
  v9[2](v9);
  objc_msgSend(*(id *)(a1 + 56), "_executeFaceCropRequest:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
LABEL_20:

}

void __76__PXPeopleFaceCropManager__prepareFaceCropRequestWithOptions_resultHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_END, v4, "prepareRequest", ", v5, 2u);
  }

}

+ (PXPeopleFaceCropManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PXPeopleFaceCropManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_204275 != -1)
    dispatch_once(&sharedManager_onceToken_204275, block);
  return (PXPeopleFaceCropManager *)(id)sharedManager_sharedManager_204276;
}

+ (int)generateUniqueRequestID
{
  return +[PXPeopleFaceCropRequest generateUniqueRequestID](PXPeopleFaceCropRequest, "generateUniqueRequestID");
}

+ (double)roundedCornerRadiusForTargetSize:(CGSize)a3 displayScale:(double)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  float v9;

  height = a3.height;
  width = a3.width;
  +[PXPeopleFaceCropManager _cornerRadiusForRoundedCornerStyleWithDisplayScale:](PXPeopleFaceCropManager, "_cornerRadiusForRoundedCornerStyleWithDisplayScale:", a4);
  if (height >= width)
    v7 = width;
  else
    v7 = height;
  v8 = v7 * 0.15;
  if (v6 > v8)
    v6 = v8;
  v9 = v6;
  return ceilf(v9);
}

+ (CGRect)cropRectWithAspectRatioFittingAroundEyeLevelForAspectRatio:(double)a3 pixelFaceCrop:(CGRect)a4 eyelinePoint:(CGPoint)a5
{
  double y;
  double x;
  CGFloat width;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MaxX;
  CGFloat v19;
  double MaxY;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat rect;
  CGFloat height;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  y = a5.y;
  x = a5.x;
  rect = a4.size.width;
  height = a4.size.height;
  width = a4.size.width;
  v8 = a4.origin.y;
  v9 = a4.origin.x;
  v10 = MEMORY[0x1A85CD660](a1, a2);
  v12 = v11;
  v13 = PXFloatApproximatelyEqualToFloat();
  v14 = 0.333333343;
  if (v13)
    v14 = 0.444444448;
  v15 = y - v14 * v12;
  if (x + v10 * -0.5 >= 0.0)
    v16 = x + v10 * -0.5;
  else
    v16 = 0.0;
  if (v15 >= 0.0)
    v17 = v15;
  else
    v17 = 0.0;
  v27.origin.x = v16;
  v27.origin.y = v17;
  v27.size.width = v10;
  v27.size.height = v12;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = v9;
  v28.origin.y = v8;
  v28.size.width = width;
  v28.size.height = height;
  v19 = v16 - fmax(MaxX - CGRectGetMaxX(v28), 0.0);
  v29.origin.x = v19;
  v29.origin.y = v17;
  v29.size.width = v10;
  v29.size.height = v12;
  MaxY = CGRectGetMaxY(v29);
  v30.origin.x = v9;
  v30.origin.y = v8;
  v30.size.width = rect;
  v30.size.height = height;
  v21 = v17 - fmax(MaxY - CGRectGetMaxY(v30), 0.0);
  v22 = v19;
  v23 = v10;
  v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

+ (BOOL)_shouldTakeSquareCropForFace:(id)a3 cropFactor:(int64_t)a4 outNormalizedFaceCropRect:(CGRect *)a5
{
  id v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;

  v7 = a3;
  v8 = v7;
  if ((unint64_t)a4 < 2)
  {
    +[PXPeopleFaceCropManager _cropFactorValueForCropFactor:](PXPeopleFaceCropManager, "_cropFactorValueForCropFactor:", a4);
    objc_msgSend(v8, "px_cropRectWithCropFactor:");
    a5->origin.x = v9;
    a5->origin.y = v10;
    a5->size.width = v11;
    a5->size.height = v12;
LABEL_6:
    LOBYTE(a5) = 1;
    goto LABEL_8;
  }
  if (a4 == 2)
  {
    LODWORD(a5) = objc_msgSend(v7, "px_cropRectForPortraitImage:", a5) ^ 1;
    goto LABEL_8;
  }
  if (a4 != 3)
    goto LABEL_6;
  objc_msgSend(v7, "px_cropRectForPortraitImage:", a5);
  LOBYTE(a5) = 0;
LABEL_8:

  return (char)a5;
}

+ (CGSize)_constrainedSizeForDesiredSize:(CGSize)result
{
  double v3;
  float v4;
  float v5;

  if (result.width * result.height > 3000000.0)
  {
    v3 = sqrt(result.width * result.height / 3000000.0);
    v4 = result.width / v3;
    result.width = roundf(v4);
    v5 = result.height / v3;
    result.height = roundf(v5);
  }
  return result;
}

+ (double)_cropFactorValueForCropFactor:(int64_t)a3
{
  void *v6;

  if (a3 == 1)
    return 7.19999981;
  if ((unint64_t)(a3 - 2) < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleFaceCropManager.m"), 725, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 2.27999997;
}

+ (double)_cornerRadiusForCornerStyle:(int64_t)a3 pixelTargetSize:(CGSize)a4 displayScale:(double)a5
{
  double v5;
  BOOL v6;
  int64_t v7;
  double v8;
  double result;

  v5 = fmin(a4.width, a4.height);
  v6 = v5 < 10.0 && a3 == 1;
  v7 = 2;
  if (!v6)
    v7 = a3;
  if (v7 == 2)
    return v5 * 0.5;
  v8 = 0.0;
  if (v7 == 1)
  {
    +[PXPeopleFaceCropManager roundedCornerRadiusForTargetSize:displayScale:](PXPeopleFaceCropManager, "roundedCornerRadiusForTargetSize:displayScale:", a4.width, a4.height, a5, 0.0);
    return result;
  }
  return v8;
}

+ (double)_cornerRadiusForRoundedCornerStyleWithDisplayScale:(double)a3
{
  _BOOL4 v4;
  double result;
  double v6;

  v4 = +[PXPeopleFaceCropFetchOptions shouldUseLemonadeRoundedCorners](PXPeopleFaceCropFetchOptions, "shouldUseLemonadeRoundedCorners");
  result = 10.0;
  if (v4)
  {
    +[PXLemonadePeopleCellSpecsConstants cornerRadius](PXLemonadePeopleCellSpecsConstants, "cornerRadius", 10.0);
    return v6 * a3;
  }
  return result;
}

+ (BOOL)_change:(id)a3 containsVisibleChangesToAssetWithOID:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "trashedStateChangedForPHAssetOID:", v6) & 1) != 0
    || (objc_msgSend(v5, "hiddenStateChangedForPHAssetOID:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "deletedObjectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v6);

  }
  return v7;
}

+ (id)_fetchQueue
{
  if (_fetchQueue_onceToken != -1)
    dispatch_once(&_fetchQueue_onceToken, &__block_literal_global_202_204271);
  return (id)_fetchQueue_fetchQueue;
}

+ (id)_cropQueue
{
  if (_cropQueue_onceToken != -1)
    dispatch_once(&_cropQueue_onceToken, &__block_literal_global_204_204269);
  return (id)_cropQueue_cropQueue;
}

+ (id)_compressionQueue
{
  if (_compressionQueue_onceToken != -1)
    dispatch_once(&_compressionQueue_onceToken, &__block_literal_global_208_204265);
  return (id)_compressionQueue_compressionQueue;
}

+ (id)_faceCropManagerLog
{
  if (_faceCropManagerLog_onceToken != -1)
    dispatch_once(&_faceCropManagerLog_onceToken, &__block_literal_global_211_204262);
  return (id)_faceCropManagerLog_faceCropManagerLog;
}

void __46__PXPeopleFaceCropManager__faceCropManagerLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.people", "PeopleFaceCropManager");
  v1 = (void *)_faceCropManagerLog_faceCropManagerLog;
  _faceCropManagerLog_faceCropManagerLog = (uint64_t)v0;

}

void __44__PXPeopleFaceCropManager__compressionQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v1);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.photos.people.faceCropManager.compress", attr);
  v3 = (void *)_compressionQueue_compressionQueue;
  _compressionQueue_compressionQueue = (uint64_t)v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleMainQueueTask:", &__block_literal_global_210_204268);

}

void __44__PXPeopleFaceCropManager__compressionQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)_compressionQueue_compressionQueue);
}

void __37__PXPeopleFaceCropManager__cropQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v1);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.photos.people.faceCropManager.crop", attr);
  v3 = (void *)_cropQueue_cropQueue;
  _cropQueue_cropQueue = (uint64_t)v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleTaskAfterCATransactionCommits:", &__block_literal_global_207);

}

void __37__PXPeopleFaceCropManager__cropQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)_cropQueue_cropQueue);
}

void __38__PXPeopleFaceCropManager__fetchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.photos.people.faceCropManager.fetch", v2);
  v1 = (void *)_fetchQueue_fetchQueue;
  _fetchQueue_fetchQueue = (uint64_t)v0;

}

void __40__PXPeopleFaceCropManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___PXPeopleFaceCropManager;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "init");
  v2 = (void *)sharedManager_sharedManager_204276;
  sharedManager_sharedManager_204276 = v1;

}

- (int)requestFaceCropImageForPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 completionHandler:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  PXPeopleFaceCropFetchOptions *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  v13 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v12, width, height, a5);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __112__PXPeopleFaceCropManager_Convenience__requestFaceCropImageForPerson_targetSize_displayScale_completionHandler___block_invoke;
  v16[3] = &unk_1E5147AB8;
  v17 = v11;
  v14 = v11;
  LODWORD(self) = -[PXPeopleFaceCropManager requestFaceCropForOptions:resultHandler:](self, "requestFaceCropForOptions:resultHandler:", v13, v16);

  return (int)self;
}

void __112__PXPeopleFaceCropManager_Convenience__requestFaceCropImageForPerson_targetSize_displayScale_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "CGRectValue");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PXPeopleFaceCropManager_Convenience__requestFaceCropImageForPerson_targetSize_displayScale_completionHandler___block_invoke_2;
  block[3] = &unk_1E5135A68;
  v17 = *(id *)(a1 + 32);
  v22 = v7;
  v23 = v17;
  v24 = v10;
  v25 = v12;
  v26 = v14;
  v27 = v16;
  v21 = v5;
  v18 = v7;
  v19 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __112__PXPeopleFaceCropManager_Convenience__requestFaceCropImageForPerson_targetSize_displayScale_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

@end
