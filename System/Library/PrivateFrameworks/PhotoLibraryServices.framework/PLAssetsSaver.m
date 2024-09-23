@implementation PLAssetsSaver

- (PLAssetsSaver)init
{
  PLAssetsSaver *v2;
  uint64_t v3;
  NSMutableArray *pendingSaveAssetJobs;
  NSMutableDictionary *v5;
  NSMutableDictionary *inProgressAvalancheFds;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLAssetsSaver;
  v2 = -[PLAssetsSaver init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pendingSaveAssetJobs = v2->__pendingSaveAssetJobs;
    v2->__pendingSaveAssetJobs = (NSMutableArray *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inProgressAvalancheFds = v2->_inProgressAvalancheFds;
    v2->_inProgressAvalancheFds = v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if ((PLAssetsSaver *)__SharedAssetsSaver == self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsSaver.m"), 111, CFSTR("sharedAssetsSaver should never be dealloc'd"));

  }
  v5.receiver = self;
  v5.super_class = (Class)PLAssetsSaver;
  -[PLAssetsSaver dealloc](&v5, sel_dealloc);
}

- (id)_photoLibrary
{
  return +[PLPhotoLibrary cameraPhotoLibrary](PLPhotoLibrary, "cameraPhotoLibrary");
}

- (id)requestSynchronousImageForAssetOID:(id)a3 withFormat:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 outImageDataInfo:(id *)a9 outCPLDownloadContext:(id *)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  uint64_t v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  _BOOL4 v30;
  void *context;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v30 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = *(_QWORD *)&a4;
  v38 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  context = (void *)MEMORY[0x19AEC1554]();
  -[PLAssetsSaver _photoLibrary](self, "_photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetsdClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resourceClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v19 = &v34;
  if (a9)
    v34 = 0;
  else
    v19 = 0;
  v20 = &v33;
  if (a10)
    v33 = 0;
  else
    v20 = 0;
  v32 = 0;
  v21 = v15;
  v22 = objc_msgSend(v18, "imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageData:outImageDataInfo:outCPLDownloadContext:error:", v15, v13, v12, v11, v10, v30, &v35, v19, v20, &v32);
  v23 = v35;
  if (a9)
  {
    v24 = v34;
    if (a10)
    {
LABEL_9:
      v25 = v33;
      goto LABEL_12;
    }
  }
  else
  {
    v24 = 0;
    if (a10)
      goto LABEL_9;
  }
  v25 = 0;
LABEL_12:
  v26 = v32;
  if ((v22 & 1) == 0)
  {
    PLBackendGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v26;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Error requesting image data for asset: %@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(context);
  if (a9)
    *a9 = objc_retainAutorelease(v24);
  if (a10)
    *a10 = objc_retainAutorelease(v25);
  v28 = v23;

  return v28;
}

- (void)requestAsynchronousImageForAssetOID:(id)a3 withFormat:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 completionBlock:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  uint64_t v13;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = *(_QWORD *)&a4;
  v16 = a9;
  v17 = a3;
  -[PLAssetsSaver _photoLibrary](self, "_photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assetsdClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resourceClient");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __147__PLAssetsSaver_requestAsynchronousImageForAssetOID_withFormat_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionBlock___block_invoke;
  v22[3] = &unk_1E3661660;
  v23 = v16;
  v21 = v16;
  objc_msgSend(v20, "imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:completionHandler:", v17, v13, v12, v11, v10, v9, v22);

}

- (void)_setIsTakingPhoto:(BOOL)a3
{
  pl_dispatch_once();
  pl_dispatch_sync();
}

- (id)_saveIsolationQueue
{
  pl_dispatch_once();
  return (id)_saveIsolationQueue_saveIsolation;
}

- (void)queuePhotoStreamJobDictionary:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("callStack"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "##### %@ %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("callStack"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PLJobLogDictionary();

  }
  PLBackendGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Sending assets saver photo stream job: %{public}@", buf, 0xCu);

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47__PLAssetsSaver_queuePhotoStreamJobDictionary___block_invoke;
  v19[3] = &unk_1E3661688;
  v12 = v5;
  v20 = v12;
  v13 = (void *)MEMORY[0x19AEC174C](v19);
  -[PLAssetsSaver _saveIsolationQueue](self, "_saveIsolationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  v18 = v13;
  v15 = v13;
  v16 = v12;
  pl_dispatch_async();

}

- (void)_queueJobDictionary:(id)a3 asset:(id)a4 requestEnqueuedBlock:(id)a5 completionBlock:(id)a6 imageSurface:(__IOSurface *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  _QWORD *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v31 = a5;
  v13 = a6;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calling PLAssetsSaver from assetsd directly with job dictionary: %@"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PLSimulateCrash();

  }
  objc_msgSend(v12, "objectForKey:", CFSTR("callStack"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v17;
      v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "##### %@ %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("callStack"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PLJobLogDictionary();

  }
  PLBackendGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  v21 = (_QWORD *)MEMORY[0x1E0D74DB8];
  if (v20)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v22;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Sending assets saver job: %{public}@", buf, 0xCu);

  }
  if ((PLIsAssetsd() & 1) == 0)
    PLIssueSandboxExtensionsForJobDictionary(v12);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke;
  v33[3] = &unk_1E36616B8;
  v33[4] = self;
  v34 = v13;
  v23 = v13;
  v24 = (void *)MEMORY[0x19AEC174C](v33);
  if (a7)
  {
    CFRetain(a7);
    objc_msgSend(v12, "objectForKey:", *v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D74E00]);

    if (v26)
      -[PLAssetsSaver _setIsTakingPhoto:](self, "_setIsTakingPhoto:", 1);
  }
  -[PLAssetsSaver _saveIsolationQueue](self, "_saveIsolationQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v12;
  v28 = v31;
  v29 = v24;
  v30 = v12;
  pl_dispatch_async();

}

- (id)_assetsdClientForJobDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D74F08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73168]), "initWithPhotoLibraryURL:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:](PLPhotoLibraryBundleController, "sharedAssetsdClientForPhotoLibraryURL:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_queueJobDictionary:(id)a3 completionBlock:(id)a4
{
  -[PLAssetsSaver _queueJobDictionary:asset:requestEnqueuedBlock:completionBlock:imageSurface:](self, "_queueJobDictionary:asset:requestEnqueuedBlock:completionBlock:imageSurface:", a3, 0, 0, a4, 0);
}

- (void)saveCameraImage:(id)a3 metadata:(id)a4 additionalProperties:(id)a5 requestEnqueuedBlock:(id)a6
{
  id v6;

  v6 = -[PLAssetsSaver saveCameraImage:metadata:additionalProperties:diagnostics:previouslyPendingAsset:requestEnqueuedBlock:](self, "saveCameraImage:metadata:additionalProperties:diagnostics:previouslyPendingAsset:requestEnqueuedBlock:", a3, a4, a5, 0, 0, a6);
}

- (id)saveCameraImage:(id)a3 metadata:(id)a4 additionalProperties:(id)a5 diagnostics:(id)a6 previouslyPendingAsset:(id)a7 requestEnqueuedBlock:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v40;
  void *context;
  SEL v42;
  PLAssetsSaver *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v44 = a8;
  v46 = v18;
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsSaver.m"), 359, CFSTR("diagnostics will always be nil, no clients pass in non-nil params currently, enforce until adopters drop call"));

  }
  v42 = a2;
  v43 = self;
  context = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D74C60]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D74C68]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0C89C78]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v19, "managedObjectContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v19, "setAvalancheUUID:", v22);
      objc_msgSend(v19, "setAvalanchePickType:", 1);
      if (+[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks"))
        objc_msgSend(v19, "setVisibilityState:", 2);
    }
  }
  v45 = v19;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v25, *MEMORY[0x1E0D74D30]);

  objc_msgSend(v24, "setObject:forKey:", *MEMORY[0x1E0D74E00], *MEMORY[0x1E0D74DB8]);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PLImageOrientationFromImageProperties());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v26, *MEMORY[0x1E0D74DA8]);

    objc_msgSend(v24, "setObject:forKey:", v16, *MEMORY[0x1E0D74D70]);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v27, *MEMORY[0x1E0D74D50]);

  if (v17)
    objc_msgSend(v24, "addEntriesFromDictionary:", v17);
  v28 = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v29, *MEMORY[0x1E0D74EF8]);

  v30 = *MEMORY[0x1E0D74F00];
  objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D74F00]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)objc_msgSend(MEMORY[0x1E0D73310], "defaultSavedAssetTypeForPLAssetsSaver"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v32, v30);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v33, *MEMORY[0x1E0D74CA0]);

  v34 = objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D74C70]);
  v35 = *MEMORY[0x1E0D74C78];
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0D74C78]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    objc_msgSend(v24, "setObject:forKey:", v36, v35);

  v37 = DCIM_CGImageRefFromPLImage();
  if (v37)
    objc_msgSend(v24, "setObject:forKey:", v37, *MEMORY[0x1E0D74EF0]);
  if (objc_msgSend(v20, "length"))
    objc_msgSend(v24, "setObject:forKey:", v20, *MEMORY[0x1E0D74EE8]);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __119__PLAssetsSaver_saveCameraImage_metadata_additionalProperties_diagnostics_previouslyPendingAsset_requestEnqueuedBlock___block_invoke;
  v48[3] = &__block_descriptor_40_e44_v32__0__NSDictionary_8__NSURL_16__NSError_24l;
  v48[4] = v42;
  v38 = (void *)MEMORY[0x19AEC174C](v48);
  -[PLAssetsSaver _queueJobDictionary:asset:requestEnqueuedBlock:completionBlock:imageSurface:](v43, "_queueJobDictionary:asset:requestEnqueuedBlock:completionBlock:imageSurface:", v24, 0, v44, v38, v34);

  objc_autoreleasePoolPop(context);
  return 0;
}

- (void)_saveImage:(id)a3 imageData:(id)a4 properties:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  PLAssetsSaver *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(a6, "copy");
  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke;
  v19[3] = &unk_1E36617A8;
  v20 = v12;
  v21 = v11;
  v22 = v10;
  v23 = self;
  v24 = v13;
  v15 = v13;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  objc_msgSend(v14, "checkPhotosAccessAllowedWithScope:handler:", 1, v19);

}

- (void)_saveVideoAtPath:(id)a3 properties:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PLAssetsSaver *v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsSaver.m"), 673, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videoPath"));

  }
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke;
  v18[3] = &unk_1E36617D0;
  v19 = v10;
  v20 = v9;
  v21 = self;
  v22 = v12;
  v14 = v12;
  v15 = v9;
  v16 = v10;
  objc_msgSend(v13, "checkPhotosAccessAllowedWithScope:handler:", 1, v18);

}

- (void)saveImageRef:(CGImage *)a3 orientation:(int64_t)a4 imageData:(id)a5 properties:(id)a6 completionBlock:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = (id)DCIM_newPLImageWithCGImage();
  -[PLAssetsSaver _saveImage:imageData:properties:completionBlock:](self, "_saveImage:imageData:properties:completionBlock:", v13, v12, v11, v10);

}

- (void)deletePhotoStreamData
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D74DF0], *MEMORY[0x1E0D74DB8]);
  -[PLAssetsSaver queuePhotoStreamJobDictionary:](self, "queuePhotoStreamJobDictionary:", v3);

}

- (id)validateAvalanches:(id)a3 inLibraryWithURL:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  id v9;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5557;
  v18 = __Block_byref_object_dispose__5558;
  v19 = 0;
  v7 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12 = v6;
  v13 = v7;
  pl_dispatch_async();

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)saveSyncedAssets:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x1E0D74E08], *MEMORY[0x1E0D74DB8]);
  if (v6)
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("SyncClientJobsData"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__PLAssetsSaver_saveSyncedAssets_completionBlock___block_invoke;
  v10[3] = &unk_1E3661828;
  v11 = v7;
  v9 = v7;
  -[PLAssetsSaver _queueJobDictionary:completionBlock:](self, "_queueJobDictionary:completionBlock:", v8, v10);

}

- (NSMutableArray)_pendingSaveAssetJobs
{
  return self->__pendingSaveAssetJobs;
}

- (void)set_pendingSaveAssetJobs:(id)a3
{
  objc_storeStrong((id *)&self->__pendingSaveAssetJobs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pendingSaveAssetJobs, 0);
  objc_storeStrong((id *)&self->_inProgressAvalancheFds, 0);
}

uint64_t __50__PLAssetsSaver_saveSyncedAssets_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__PLAssetsSaver_validateAvalanches_inLibraryWithURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *MEMORY[0x1E0D74DD0], *MEMORY[0x1E0D74DB8]);
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0D74CE8]);
  objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D74EF8]);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x1E0D74F08]);
  v4 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PLAssetsSaver_validateAvalanches_inLibraryWithURL___block_invoke_2;
  v7[3] = &unk_1E36617F8;
  v6 = *(_OWORD *)(a1 + 56);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(v4, "_queueJobDictionary:completionBlock:", v2, v7);

}

void __53__PLAssetsSaver_validateAvalanches_inLibraryWithURL___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7
    && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("avalancheStackAssetMap")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11))
  {
    PLCameraConnectionKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138412802;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "job: %@, URL: %@, error: %@", (uint8_t *)&v17, 0x20u);
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("avalancheStackAssetMap"));
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject allValues](v13, "allValues");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    PLCameraConnectionKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Error validating bursts: %@", (uint8_t *)&v17, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;

  if (PLPhotosAccessAllowed())
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74FC8]);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = v3;
    else
      v4 = MEMORY[0x1E0C9AAA0];
    v35 = (void *)v4;
    objc_msgSend(v2, "setObject:forKey:");
    objc_msgSend(v2, "setObject:forKey:", *MEMORY[0x1E0D74E30], *MEMORY[0x1E0D74DB8]);
    v5 = *(_QWORD *)(a1 + 40);
    if (!v5)
      goto LABEL_13;
    objc_msgSend(v2, "setObject:forKey:", v5, *MEMORY[0x1E0D74F40]);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74C48]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "pathExtension");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_12:

LABEL_13:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v11, *MEMORY[0x1E0D74CA0]);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v12, *MEMORY[0x1E0D74F20]);

        v13 = objc_alloc(MEMORY[0x1E0D75140]);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 40));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "_photoLibrary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "libraryBundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeZoneLookup");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v13, "initWithAVURL:options:timeZoneLookup:", v14, 12, v17);

        v34 = v18;
        objc_msgSend(v18, "utcCreationDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v2, "setObject:forKey:", v19, *MEMORY[0x1E0D74D40]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v20, *MEMORY[0x1E0D74EF8]);

        v21 = *MEMORY[0x1E0D74CC8];
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CC8]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v2, "setObject:forKey:", v22, v21);
        v23 = *MEMORY[0x1E0D74CC0];
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CC0]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(v2, "setObject:forKey:", v24, v23);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ImportedBy"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v2, "setObject:forKey:", v25, CFSTR("ImportedBy"));
        v26 = *MEMORY[0x1E0D74D60];
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74D60]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v2, "setObject:forKey:", v27, v26);
        v28 = *MEMORY[0x1E0D74E58];
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74E58]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v2, "setObject:forKey:", v29, v28);
        v30 = *MEMORY[0x1E0D74D38];
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74D38]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v2, "setObject:forKey:", v31, v30);
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke_2;
        v37[3] = &unk_1E3661780;
        v32 = *(void **)(a1 + 56);
        v37[4] = *(_QWORD *)(a1 + 48);
        v38 = v32;
        v33 = (void *)MEMORY[0x19AEC174C](v37);
        objc_msgSend(*(id *)(a1 + 48), "_queueJobDictionary:completionBlock:", v2, v33);

        v10 = v35;
        goto LABEL_28;
      }
    }
    objc_msgSend(v2, "setObject:forKey:", v8, *MEMORY[0x1E0D74D78]);

    goto LABEL_12;
  }
  objc_msgSend((id)objc_opt_class(), "publicAssetsLibraryErrorFromPrivateDomain:withPrivateCode:", *MEMORY[0x1E0D74498], -3001);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 56);
  if (v9)
  {
    v36 = v9;
    v2 = v2;
    pl_dispatch_async();

    v10 = v36;
LABEL_28:

  }
}

void __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "publicAssetsLibraryErrorFromPrivateError:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v7, v9);

}

uint64_t __61__PLAssetsSaver__saveVideoAtPath_properties_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CGImage *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  id v50;

  if (PLPhotosAccessAllowed())
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74C58]);
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74C48]);
    v44 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74C50]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x1E0D74CC8];
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x1E0D74CC0];
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0D74D60];
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74D60]);
    v5 = objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x1E0D74E58];
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x1E0D74D28];
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D74D38];
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74D38]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *MEMORY[0x1E0D74D40];
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D74FC8];
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74FC8]);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ImportedBy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v8)
      v8 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v10, "setObject:forKey:", v8, v7);
    if (!v9)
      goto LABEL_14;
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")))
    {
      if (objc_msgSend(v9, "intValue") == 3)
      {
        v12 = &unk_1E375D6F8;
LABEL_12:

        v9 = v12;
        goto LABEL_13;
      }
      if (objc_msgSend(v9, "intValue") == 6)
      {
        v12 = &unk_1E375D710;
        goto LABEL_12;
      }
    }
LABEL_13:
    objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("ImportedBy"));

LABEL_14:
    objc_msgSend(v11, "setObject:forKey:", *MEMORY[0x1E0D74E00], *MEMORY[0x1E0D74DB8]);
    v16 = *(_QWORD *)(a1 + 40);
    v41 = (void *)v8;
    if (v16)
    {
      objc_msgSend(v11, "setObject:forKey:", v16, *MEMORY[0x1E0D74DA0]);
      v17 = (void *)v5;
    }
    else
    {
      v17 = (void *)v5;
      if (*(_QWORD *)(a1 + 48))
      {
        v32 = v4;
        v34 = v2;
        v18 = (CGImage *)DCIM_CGImageRefFromPLImage();
        MEMORY[0x19AEBFDF0](*(_QWORD *)(a1 + 48));
        v19 = PLExifOrientationFromImageOrientation();
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CA8]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
          v22 = objc_msgSend(v20, "intValue") == 10;
        else
          v22 = 0;
        objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v34, v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        imageDataFromImageRef(v18, v23, v19, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(v11, "setObject:forKey:", v24, *MEMORY[0x1E0D74DA0]);

        v17 = (void *)v5;
        v4 = v33;
        v2 = v34;
      }
    }
    if (v2)
      objc_msgSend(v11, "setObject:forKey:", v2, *MEMORY[0x1E0D74F10]);
    v15 = (void *)v44;
    if (v44)
      objc_msgSend(v11, "setObject:forKey:", v44, *MEMORY[0x1E0D74D78]);
    if (v47)
      objc_msgSend(v11, "setObject:forKey:", v47, *MEMORY[0x1E0D74D70]);
    if (v17)
      objc_msgSend(v11, "setObject:forKey:", v17, v4);
    if (v45)
      objc_msgSend(v11, "setObject:forKey:", v45, v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v25, *MEMORY[0x1E0D74EF8]);

    v26 = *MEMORY[0x1E0D74F00];
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74F00]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v11, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)objc_msgSend(MEMORY[0x1E0D73310], "defaultSavedAssetTypeForPLAssetsSaver"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v28, v26);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v29, *MEMORY[0x1E0D74CA0]);

    if (v3)
      objc_msgSend(v11, "setObject:forKey:", v3, v38);
    if (v40)
      objc_msgSend(v11, "setObject:forKey:", v40, v39);
    if (v43)
      objc_msgSend(v11, "setObject:forKey:", v43, v36);
    if (v46)
      objc_msgSend(v11, "setObject:forKey:", v46, v37);
    v13 = (id)v2;
    if (v42)
      objc_msgSend(v11, "setObject:forKey:", v42, v35);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke_76;
    v49[3] = &unk_1E3661780;
    v30 = *(void **)(a1 + 64);
    v49[4] = *(_QWORD *)(a1 + 56);
    v50 = v30;
    v31 = (void *)MEMORY[0x19AEC174C](v49);
    objc_msgSend(*(id *)(a1 + 56), "_queueJobDictionary:completionBlock:", v11, v31);

    goto LABEL_47;
  }
  objc_msgSend((id)objc_opt_class(), "publicAssetsLibraryErrorFromPrivateDomain:withPrivateCode:", *MEMORY[0x1E0D74498], -3001);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 64);
  if (v14)
  {
    v48 = v14;
    v13 = v13;
    pl_dispatch_async();

    v15 = v48;
LABEL_47:

  }
}

void __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke_76(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "publicAssetsLibraryErrorFromPrivateError:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v7, v9);

}

uint64_t __65__PLAssetsSaver__saveImage_imageData_properties_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __119__PLAssetsSaver_saveCameraImage_metadata_additionalProperties_diagnostics_previouslyPendingAsset_requestEnqueuedBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || v9)
  {
    PLCameraGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "%{public}@ failed: missing assetURL from reply (%{public}@)", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74D68]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74D18]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    +[PLLocationController sharedInstance](PLLocationController, "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject addLocationToMediaWithAssetURLWhenAvailable:deviceOrientation:cameraWasRearFacing:](v15, "addLocationToMediaWithAssetURLWhenAvailable:deviceOrientation:cameraWasRearFacing:", v8, 1, v14);
LABEL_7:

  }
}

void __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  if (*(_QWORD *)(a1 + 40))
  {
    if (a2)
    {
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D74CB8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Error"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "publicAssetsLibraryErrorFromPrivateError:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
    }

    v13 = *(id *)(a1 + 40);
    v12 = v7;
    v8 = v10;
    v11 = v9;
    pl_dispatch_async();

  }
}

void __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74C78]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73228]), "initWithIOSurface:length:", *(_QWORD *)(a1 + 64), objc_msgSend(v2, "unsignedIntegerValue"));
      v4 = *MEMORY[0x1E0D74DA0];
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, *MEMORY[0x1E0D74DA0]);

    }
    else
    {
      v4 = *MEMORY[0x1E0D74DA0];
    }
    objc_msgSend(MEMORY[0x1E0D73148], "sharedDCIMWriter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "saveImageJobToDisk:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v4);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *MEMORY[0x1E0D74EF0]);

  }
  else
  {
    v5 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74D70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C89C78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && (objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74EF8]),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "BOOLValue"),
        v10,
        (v11 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "_pendingSaveAssetJobs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v12 = PLIsAssetsd();
    v13 = *(void **)(a1 + 40);
    if (v12)
    {
      objc_msgSend(v13, "_photoLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryServicesManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageWriter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("PLAssetsSaver.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageWriter"));

      }
      v17 = *(_QWORD *)(a1 + 32);
      if ((v5 & 1) != 0)
        v18 = 0;
      else
        v18 = *(_QWORD *)(a1 + 64);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_4;
      v29[3] = &unk_1E36734D8;
      v30 = *(id *)(a1 + 48);
      objc_msgSend(v16, "saveAssetJob:imageSurface:previewImageSurface:completionHandler:", v17, v18, 0, v29);

    }
    else
    {
      objc_msgSend(v13, "_assetsdClientForJobDictionary:", *(_QWORD *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D74FC8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if (v20)
        objc_msgSend(v16, "resourceWriteOnlyClient");
      else
        objc_msgSend(v16, "resourceClient");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      if ((v5 & 1) != 0)
        v24 = 0;
      else
        v24 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v21, "saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", *(_QWORD *)(a1 + 32), v24, 0, *(_QWORD *)(a1 + 48));

    }
  }
  v25 = *(const void **)(a1 + 64);
  if (v25)
    CFRelease(v25);
  v26 = *(void **)(a1 + 56);
  if (v26)
  {
    v28 = v26;
    pl_dispatch_async();

  }
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 40), "_setIsTakingPhoto:", 0);

}

void __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_4(uint64_t a1, int a2, void *a3, int a4, void *a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a5;
  v10 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v10 + 16))(v10, 1, v12, 0);
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 42002, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, v11);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v10 + 16))(v10, 0, 0, v9);
  }

}

uint64_t __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__PLAssetsSaver__queueJobDictionary_asset_requestEnqueuedBlock_completionBlock_imageSurface___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __47__PLAssetsSaver_queuePhotoStreamJobDictionary___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((a2 & 1) == 0)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Error processing assets saver photo stream job: %{public}@ -- %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }

}

void __47__PLAssetsSaver_queuePhotoStreamJobDictionary___block_invoke_41(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:](PLPhotoLibraryBundleController, "sharedAssetsdClientForPhotoLibraryURL:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "resourceClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", *(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(a1 + 40));

}

void __36__PLAssetsSaver__saveIsolationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PLAssetsSaver.saveImageJobIsolation", 0);
  v1 = (void *)_saveIsolationQueue_saveIsolation;
  _saveIsolationQueue_saveIsolation = (uint64_t)v0;

}

void __35__PLAssetsSaver__setIsTakingPhoto___block_invoke_2(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v1 = _setIsTakingPhoto__takingPhotoCount;
  if (*(_BYTE *)(a1 + 40))
  {
    ++_setIsTakingPhoto__takingPhotoCount;
    if (!v1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_photoLibrary");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "libraryBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "indicatorFileCoordinator");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v4 = v8;
      v5 = 1;
LABEL_7:
      objc_msgSend(v4, "setTakingPhotoIsBusy:", v5);

    }
  }
  else
  {
    --_setIsTakingPhoto__takingPhotoCount;
    if (v1 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "libraryBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "indicatorFileCoordinator");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v4 = v8;
      v5 = 0;
      goto LABEL_7;
    }
  }
}

void __35__PLAssetsSaver__setIsTakingPhoto___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PLAssetsSaver.takingPhotoIndicatorIsolation", 0);
  v1 = (void *)_setIsTakingPhoto__takingPhotoIndicatorIsolation;
  _setIsTakingPhoto__takingPhotoIndicatorIsolation = (uint64_t)v0;

}

uint64_t __147__PLAssetsSaver_requestAsynchronousImageForAssetOID_withFormat_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sharedAssetsSaver
{
  pl_dispatch_once();
  return (id)__SharedAssetsSaver;
}

+ (id)createWriteImageCompletionBlockWithImage:(id)a3 target:(id)a4 selector:(SEL)a5 contextInfo:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  SEL v26;
  void *v27;

  v10 = a3;
  v11 = a4;
  v12 = 0;
  if (v11 && a5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = *MEMORY[0x1E0C99778];
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_opt_class();
      NSStringFromSelector(a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@<%p> does not respond to selector %@"), v18, v11, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v20, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v21);
    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __86__PLAssetsSaver_createWriteImageCompletionBlockWithImage_target_selector_contextInfo___block_invoke;
    v22[3] = &unk_1E3661728;
    v25 = a1;
    v23 = v10;
    v24 = v11;
    v26 = a5;
    v27 = a6;
    v13 = (void *)MEMORY[0x19AEC174C](v22);
    v12 = (void *)objc_msgSend(v13, "copy");

  }
  return v12;
}

+ (id)createWriteVideoCompletionBlockWithVideoPath:(id)a3 target:(id)a4 selector:(SEL)a5 contextInfo:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  SEL v25;
  void *v26;

  v10 = a3;
  v11 = a4;
  v12 = 0;
  if (v11 && a5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = *MEMORY[0x1E0C99778];
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_opt_class();
      NSStringFromSelector(a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@<%p> does not respond to selector %@"), v18, v11, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v20, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v21);
    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__PLAssetsSaver_createWriteVideoCompletionBlockWithVideoPath_target_selector_contextInfo___block_invoke;
    v22[3] = &unk_1E3661750;
    v24 = a1;
    v23 = v11;
    v25 = a5;
    v26 = a6;
    v13 = (void *)MEMORY[0x19AEC174C](v22);
    v12 = (void *)objc_msgSend(v13, "copy");

  }
  return v12;
}

+ (id)publicAssetsLibraryErrorFromPrivateDomain:(id)a3 withPrivateCode:(int64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "publicAssetsLibraryErrorFromPrivateError:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)publicAssetsLibraryErrorFromPrivateError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "code");
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D74498]))
  {
    if (v5 > 12)
    {
      if (v5 == 13)
      {
LABEL_13:
        PLServicesLocalizedFrameworkString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        PLServicesLocalizedFrameworkString();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PLServicesLocalizedFrameworkString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -3302;
        goto LABEL_16;
      }
      if (v5 == 14)
      {
LABEL_11:
        PLServicesLocalizedFrameworkString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v8 = 0;
        v5 = -3305;
        goto LABEL_16;
      }
    }
    else
    {
      if (v5 == -3001)
      {
LABEL_12:
        PLServicesLocalizedFrameworkString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        PLServicesLocalizedFrameworkString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v5 = -3310;
        goto LABEL_16;
      }
      if (v5 == 12)
      {
LABEL_5:
        PLServicesLocalizedFrameworkString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v8 = 0;
        v5 = -3304;
        goto LABEL_16;
      }
    }
    goto LABEL_15;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("ALAssetsLibraryErrorDomain")))
  {
LABEL_15:
    PLServicesLocalizedFrameworkString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = 0;
    v5 = -1;
    goto LABEL_16;
  }
  v7 = 0;
  v6 = 0;
  v8 = 0;
  switch(v5)
  {
    case -3315:
      PLServicesLocalizedFrameworkString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v8 = 0;
      v5 = -3315;
      break;
    case -3314:
    case -3313:
    case -3312:
    case -3309:
    case -3308:
    case -3307:
    case -3306:
    case -3303:
      break;
    case -3311:
      PLServicesLocalizedFrameworkString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v5 = -3311;
      break;
    case -3310:
      goto LABEL_12;
    case -3305:
      goto LABEL_11;
    case -3304:
      goto LABEL_5;
    case -3302:
      goto LABEL_13;
    case -3301:
      PLServicesLocalizedFrameworkString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -3301;
      break;
    case -3300:
      PLServicesLocalizedFrameworkString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v5 = -3300;
      break;
    default:
      v6 = 0;
      v8 = 0;
      if (v5 == -1)
        goto LABEL_15;
      break;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v9, "setObject:forKey:", v6, *MEMORY[0x1E0CB2D50]);
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v9, "setObject:forKey:", v7, *MEMORY[0x1E0CB2D68]);
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v9, "setObject:forKey:", v8, *MEMORY[0x1E0CB2D80]);
  if (v3)
    objc_msgSend(v9, "setObject:forKey:", v3, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ALAssetsLibraryErrorDomain"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __90__PLAssetsSaver_createWriteVideoCompletionBlockWithVideoPath_target_selector_contextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a2;
  if (a3)
  {
    v6 = a3;
    objc_msgSend((id)objc_opt_class(), "publicAssetsLibraryErrorFromPrivateError:", v6);
    a3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)MEMORY[0x1E0C99DB8];
  objc_msgSend(*(id *)(a1 + 32), "methodSignatureForSelector:", *(_QWORD *)(a1 + 48), a3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invocationWithMethodSignature:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSelector:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v9, "setTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v9, "setArgument:atIndex:", &v11, 2);
  objc_msgSend(v9, "setArgument:atIndex:", &v10, 3);
  objc_msgSend(v9, "setArgument:atIndex:", a1 + 56, 4);
  objc_msgSend(v9, "invoke");

}

void __86__PLAssetsSaver_createWriteImageCompletionBlockWithImage_target_selector_contextInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 48), "publicAssetsLibraryErrorFromPrivateError:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x1E0C99DB8];
  objc_msgSend(*(id *)(a1 + 40), "methodSignatureForSelector:", *(_QWORD *)(a1 + 56), v4, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invocationWithMethodSignature:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSelector:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v7, "setTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setArgument:atIndex:", &v9, 2);
  objc_msgSend(v7, "setArgument:atIndex:", &v8, 3);
  objc_msgSend(v7, "setArgument:atIndex:", a1 + 64, 4);
  objc_msgSend(v7, "invoke");

}

void __34__PLAssetsSaver_sharedAssetsSaver__block_invoke()
{
  PLAssetsSaver *v0;
  void *v1;

  v0 = objc_alloc_init(PLAssetsSaver);
  v1 = (void *)__SharedAssetsSaver;
  __SharedAssetsSaver = (uint64_t)v0;

}

@end
