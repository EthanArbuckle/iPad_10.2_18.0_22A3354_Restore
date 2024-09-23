@implementation PUPhotoPickerExtensionContext

- (PUPhotoPickerExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  PUPhotoPickerExtensionContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoPickerExtensionContext;
  v5 = -[PUPhotoPickerExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](&v7, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  if (v5)
    objc_msgSend((id)objc_opt_class(), "configureImageManagerLimit");
  return v5;
}

- (void)requestedViewControllerOptionsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[PUPhotoPickerExtensionContext inputItems](self, "inputItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PUPhotoPickerExtensionContext_requestedViewControllerOptionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58A5728;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  -[PUPhotoPickerAbstractExtensionContext firstPayloadFromExtensionItems:completion:](self, "firstPayloadFromExtensionItems:completion:", v5, v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)multipleMediaIsolationQueue
{
  PUPhotoPickerExtensionContext *v2;
  OS_dispatch_queue *multipleMediaIsolationQueue;
  dispatch_queue_t v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  v2 = self;
  objc_sync_enter(v2);
  multipleMediaIsolationQueue = v2->_multipleMediaIsolationQueue;
  if (!multipleMediaIsolationQueue)
  {
    v4 = dispatch_queue_create("com.apple.mobileslideshow.photo-picker.multiplemediawrite", 0);
    v5 = v2->_multipleMediaIsolationQueue;
    v2->_multipleMediaIsolationQueue = (OS_dispatch_queue *)v4;

    multipleMediaIsolationQueue = v2->_multipleMediaIsolationQueue;
  }
  v6 = multipleMediaIsolationQueue;
  objc_sync_exit(v2);

  return v6;
}

- (NSOperationQueue)multipleMediaConversionConcurrentQueue
{
  NSOperationQueue *multipleMediaConversionConcurrentQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  multipleMediaConversionConcurrentQueue = self->_multipleMediaConversionConcurrentQueue;
  if (!multipleMediaConversionConcurrentQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_multipleMediaConversionConcurrentQueue;
    self->_multipleMediaConversionConcurrentQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_multipleMediaConversionConcurrentQueue, "setMaxConcurrentOperationCount:", 2);
    multipleMediaConversionConcurrentQueue = self->_multipleMediaConversionConcurrentQueue;
  }
  return multipleMediaConversionConcurrentQueue;
}

- (id)_host
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoPickerExtensionContext;
  -[PUPhotoPickerAbstractExtensionContext proxy](&v3, sel_proxy);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)invalidatePhotoPickerRemoteServices
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobileslideshow.photo-picker"), 0, MEMORY[0x1E0C9AA70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoPickerExtensionContext cancelRequestWithError:](self, "cancelRequestWithError:", v3);
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoPickerExtensionContext;
  -[PUPhotoPickerAbstractExtensionContext invalidateContext](&v4, sel_invalidateContext);

}

- (void)performTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerExtensionContext.m"), 114, CFSTR("NSData may not be nil in setTraitCollectionWithData:completion"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoPickerExtensionContext;
  -[PUPhotoPickerAbstractExtensionContext principalObject](&v11, sel_principalObject);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EECE15B0))
    objc_msgSend(v9, "performTraitCollectionUpdateUsingData:completion:", v7, v8);

}

- (void)cancelPhotoPicker
{
  id v2;

  -[PUPhotoPickerExtensionContext _host](self, "_host");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPhotoPicker");

}

- (void)invalidatePhotoPickerHostServices
{
  id v2;

  -[PUPhotoPickerExtensionContext _host](self, "_host");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidatePhotoPickerHostServices");

}

- (void)didSetOnboardingHeaderDismissed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUPhotoPickerExtensionContext _host](self, "_host");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didSetOnboardingHeaderDismissed:", v3);

}

- (void)dismissCurrentViewControllerFromPhotoPickerAnimated:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotoPickerExtensionContext _host](self, "_host");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissCurrentViewControllerFromPhotoPickerAnimated:", v4);

}

- (void)didDisplayPhotoPickerSourceType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotoPickerExtensionContext _host](self, "_host");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didDisplayPhotoPickerSourceType:", v4);

}

- (void)didDisplayPhotoPickerPreview
{
  id v2;

  -[PUPhotoPickerExtensionContext _host](self, "_host");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDisplayPhotoPickerPreview");

}

- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id obj;
  _QWORD block[4];
  NSObject *v22;
  id v23;
  id v24[2];
  _QWORD v25[5];
  id v26;
  NSObject *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotoPickerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134349056;
    v35 = objc_msgSend(v4, "count");
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ProcessingSelections", "%{public}ld", buf, 0xCu);
  }
  v18 = v8;
  v19 = (void *)v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_group_create();
  objc_initWeak((id *)buf, self);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13);
        dispatch_group_enter(v10);
        -[PUPhotoPickerExtensionContext multipleMediaConversionConcurrentQueue](self, "multipleMediaConversionConcurrentQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke;
        v25[3] = &unk_1E58A9F58;
        objc_copyWeak(&v28, (id *)buf);
        v25[4] = v14;
        v26 = v9;
        v27 = v10;
        objc_msgSend(v15, "addOperationWithBlock:", v25);

        objc_destroyWeak(&v28);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke_3;
  block[3] = &unk_1E58A6AC0;
  v22 = v18;
  v24[1] = v19;
  v16 = v18;
  objc_copyWeak(v24, (id *)buf);
  v23 = v9;
  v17 = v9;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);

}

- (void)_createPhotoPickerInfoDictionaryFromInfoDictionary:(id)a3 appendTo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__PUPhotoPickerExtensionContext__createPhotoPickerInfoDictionaryFromInfoDictionary_appendTo_completion___block_invoke;
  v13[3] = &unk_1E58A5750;
  objc_copyWeak(&v16, &location);
  v11 = v9;
  v14 = v11;
  v12 = v10;
  v15 = v12;
  -[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:completion:](self, "_photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:completion:", v8, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_handleMutlipleMediaCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__65819;
  v18 = __Block_byref_object_dispose__65820;
  v19 = 0;
  -[PUPhotoPickerExtensionContext multipleMediaIsolationQueue](self, "multipleMediaIsolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __64__PUPhotoPickerExtensionContext__handleMutlipleMediaCompletion___block_invoke;
  v11 = &unk_1E58AAE48;
  v13 = &v14;
  v6 = v4;
  v12 = v6;
  dispatch_sync(v5, &v8);

  -[PUPhotoPickerExtensionContext _host](self, "_host", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSelectMultipleMediaItemsWithInfoDictionaries:", v15[5]);

  _Block_object_dispose(&v14, 8);
}

- (void)didSelectMediaWithInfoDictionary:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PUPhotoPickerExtensionContext_didSelectMediaWithInfoDictionary___block_invoke;
  v5[3] = &unk_1E58A5778;
  objc_copyWeak(&v6, &location);
  -[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:completion:](self, "_photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:completion:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)initiatePhotoPickerSelection
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  void *v6;
  objc_super v7;
  uint8_t buf[16];

  PLPhotoPickerGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_EVENT, v5, "InitiateSelection", ", buf, 2u);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoPickerExtensionContext;
  -[PUPhotoPickerAbstractExtensionContext principalObject](&v7, sel_principalObject);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EECE15B0))
    objc_msgSend(v6, "performPhotosSelection");

}

- (void)performPhotoPickerPreviewOfFirstAsset
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoPickerExtensionContext;
  -[PUPhotoPickerAbstractExtensionContext principalObject](&v3, sel_principalObject);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EECE0798))
    objc_msgSend(v2, "performPhotoPickerPreviewOfFirstAsset");

}

- (void)_photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  char v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  dispatch_time_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  BOOL v73;
  void *v74;
  id v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void (**v89)(id, void *);
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  PUPhotoPickerExtensionContext *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  _QWORD v103[4];
  NSObject *v104;
  uint64_t *v105;
  _BYTE *v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint8_t v112[4];
  const char *v113;
  __int16 v114;
  void *v115;
  _BYTE buf[24];
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  _QWORD v120[5];
  _QWORD v121[8];

  v121[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v89 = (void (**)(id, void *))a4;
  v86 = v6;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v98 = self;
  -[PUPhotoPickerExtensionContext _principalObject](self, "_principalObject");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v96, "savingOptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD22C8]);

  objc_msgSend(v96, "properties");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC58D8];
  objc_msgSend(v88, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58D8]);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v87, v10);
  v11 = *MEMORY[0x1E0DC4CA0];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4CA0]);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    v111 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v94, 1, &v111);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v111;
    if (v13)
    {
      PLUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDi"
                             "ctionary:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "%s Unable to archive original image %@", buf, 0x16u);
      }

    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v11);

  }
  v15 = *MEMORY[0x1E0DC4C80];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C80]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v16;
  if (v16)
  {
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CD2298]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v15);

    v16 = v97;
  }
  v18 = v16 != 0;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD22C0]);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = !v18;
  if (!v95)
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    v20 = dispatch_semaphore_create(0);
    v92 = objc_alloc_init(MEMORY[0x1E0D47BE8]);
    v120[0] = *MEMORY[0x1E0D47D48];
    objc_msgSend(MEMORY[0x1E0D47C20], "policyWithLocation:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v21;
    v120[1] = *MEMORY[0x1E0D47D78];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIImagePickerController downscaling image to target length: %@"), v95);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v22;
    v23 = *MEMORY[0x1E0D47D38];
    v120[2] = *MEMORY[0x1E0D47CE0];
    v120[3] = v23;
    v121[2] = MEMORY[0x1E0C9AAB0];
    v121[3] = v95;
    v120[4] = *MEMORY[0x1E0D47D30];
    v121[4] = &unk_1E59BBD48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v107 = 0;
    v108 = &v107;
    v109 = 0x2020000000;
    v110 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v117 = __Block_byref_object_copy__65819;
    v118 = __Block_byref_object_dispose__65820;
    v119 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "temporaryDirectory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLByAppendingPathComponent:isDirectory:", v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D47C18], "collectionWithMainResourceURL:", v97);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D47C18], "collectionWithMainResourceURL:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = MEMORY[0x1E0C809B0];
    v103[1] = 3221225472;
    v103[2] = __112__PUPhotoPickerExtensionContext__photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary_completion___block_invoke;
    v103[3] = &unk_1E58A57A0;
    v105 = &v107;
    v106 = buf;
    v32 = v20;
    v104 = v32;
    objc_msgSend(v92, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v30, v31, v24, v103);
    v33 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v32, v33);
    objc_msgSend(v29, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    PLGetSandboxExtensionToken();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    if (v108[3] == 1 && v34 && v35)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0CD2298]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0CD22A0]);
    }
    else
    {
      PLUIGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v112 = 136315394;
        v113 = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary:completion:]";
        v114 = 2112;
        v115 = v38;
        _os_log_impl(&dword_1AAB61000, v37, OS_LOG_TYPE_ERROR, "%s Unable to scale image with error: %@", v112, 0x16u);

      }
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v107, 8);

  }
  v39 = *MEMORY[0x1E0DC4C78];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C78]);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v102 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v93, 1, &v102);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v102;
    if (v41)
    {
      PLUIGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDi"
                             "ctionary:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v41;
        _os_log_impl(&dword_1AAB61000, v42, OS_LOG_TYPE_ERROR, "%s Unable to archive edited image %@", buf, 0x16u);
      }

    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, v39);

  }
  v43 = *MEMORY[0x1E0DC58D0];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58D0]);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v101 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v91, 1, &v101);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v101;
    if (v45)
    {
      PLUIGetLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDi"
                             "ctionary:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v45;
        _os_log_impl(&dword_1AAB61000, v46, OS_LOG_TYPE_ERROR, "%s Unable to archive fullscreen image %@", buf, 0x16u);
      }

    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v44, v43);

  }
  v47 = *MEMORY[0x1E0DC4C70];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C70]);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v100 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v90, 1, &v100);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v100;
    if (v49)
    {
      PLUIGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfoDi"
                             "ctionary:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v49;
        _os_log_impl(&dword_1AAB61000, v50, OS_LOG_TYPE_ERROR, "%s Unable to archive crop rect %@", buf, 0x16u);
      }

    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0CD2248]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v47);

  }
  v51 = *MEMORY[0x1E0DC4CB0];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4CB0]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v52)
  {
    objc_msgSend(v52, "absoluteString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0CD22B8]);

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v51);
  v55 = *MEMORY[0x1E0DC4C98];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C98]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v56)
  {
    objc_msgSend(v56, "path");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v58, *MEMORY[0x1E0CD2288]);

    -[PUPhotoPickerExtensionContext _createSandboxTokenForURL:](v98, "_createSandboxTokenForURL:", v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v59, *MEMORY[0x1E0CD2290]);

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v55);
  v60 = *MEMORY[0x1E0DC58E0];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58E0]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
  {
    objc_msgSend(v61, "path");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v63, *MEMORY[0x1E0CD22A8]);

    -[PUPhotoPickerExtensionContext _createSandboxTokenForURL:](v98, "_createSandboxTokenForURL:", v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v64, *MEMORY[0x1E0CD22B0]);

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v60);
  v65 = *MEMORY[0x1E0DC5878];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5878]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v66)
  {
    objc_msgSend(v66, "path");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E0CD2250]);

    -[PUPhotoPickerExtensionContext _createSandboxTokenForURL:](v98, "_createSandboxTokenForURL:", v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v69, *MEMORY[0x1E0CD2258]);

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v65);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_UIImagePickerDebugSidecarFileURLs"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    -[PUPhotoPickerExtensionContext _auxiliaryConnection](v98, "_auxiliaryConnection");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "valueForEntitlement:", CFSTR("com.apple.photos.debugsidecar"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72 == 0;

    if (!v73)
    {
      v99 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v70, 1, &v99);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v99;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v74, CFSTR("_UIImagePickerDebugSidecarFileURLsData"));

      if (v75)
      {
        PLUIGetLog();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[PUPhotoPickerExtensionContext _photoPickerInfoDictionaryFromUIImagePickerControllerInfo"
                               "Dictionary:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v75;
          _os_log_impl(&dword_1AAB61000, v76, OS_LOG_TYPE_ERROR, "%s Unable to archive debug sidecar files %@", buf, 0x16u);
        }

      }
    }
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("_UIImagePickerDebugSidecarFileURLs"));
  }
  v77 = *MEMORY[0x1E0DC4C88];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C88]);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v77);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2260]);
    objc_msgSend(v78, "imageURL");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "videoURL");
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)v80;
    if (!v79 || !v80)
    {
      -[PUPhotoPickerExtensionContext _handleLivePhotoImageUrlFetch:appendTo:completion:](v98, "_handleLivePhotoImageUrlFetch:appendTo:completion:", v78, v7, v89);

      goto LABEL_61;
    }
    objc_msgSend(v79, "path");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v82, *MEMORY[0x1E0CD2268]);

    -[PUPhotoPickerExtensionContext _createSandboxTokenForURL:](v98, "_createSandboxTokenForURL:", v79);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v83, *MEMORY[0x1E0CD2270]);

    objc_msgSend(v81, "path");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v84, *MEMORY[0x1E0CD2278]);

    -[PUPhotoPickerExtensionContext _createSandboxTokenForURL:](v98, "_createSandboxTokenForURL:", v81);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v85, *MEMORY[0x1E0CD2280]);

  }
  if (v89)
  {
    v79 = (void *)objc_msgSend(v7, "copy");
    v89[2](v89, v79);
LABEL_61:

  }
}

- (void)_handleLivePhotoImageUrlFetch:(id)a3 appendTo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PUPhotoPickerExtensionContext__handleLivePhotoImageUrlFetch_appendTo_completion___block_invoke;
  aBlock[3] = &unk_1E58A57C8;
  objc_copyWeak(&v21, &location);
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v13 = v10;
  v20 = v13;
  v14 = _Block_copy(aBlock);
  objc_msgSend(v11, "imageFileLoader");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v15 + 16))(v15, 0, 0, v14);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_saveImageURLForLivePhoto:(id)a3 fileURL:(id)a4 appendTo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v16 = (id)objc_msgSend(a5, "mutableCopy");
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CD2268]);

  -[PUPhotoPickerExtensionContext _createSandboxTokenForURL:](self, "_createSandboxTokenForURL:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CD2270]);
  v15 = (void *)objc_msgSend(v16, "copy");
  -[PUPhotoPickerExtensionContext _handleLivePhotoVideoUrlFetch:appendTo:completion:](self, "_handleLivePhotoVideoUrlFetch:appendTo:completion:", v12, v15, v10);

}

- (void)_handleLivePhotoVideoUrlFetch:(id)a3 appendTo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PUPhotoPickerExtensionContext__handleLivePhotoVideoUrlFetch_appendTo_completion___block_invoke;
  aBlock[3] = &unk_1E58A57C8;
  objc_copyWeak(&v21, &location);
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v13 = v10;
  v20 = v13;
  v14 = _Block_copy(aBlock);
  objc_msgSend(v11, "videoFileLoader");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v15 + 16))(v15, 0, 0, v14);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_saveVideoURLForLivePhoto:(id)a3 fileURL:(id)a4 appendTo:(id)a5 completion:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a6;
  v9 = a4;
  v10 = (void *)objc_msgSend(a5, "mutableCopy");
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD2278]);

  -[PUPhotoPickerExtensionContext _createSandboxTokenForURL:](self, "_createSandboxTokenForURL:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CD2280]);
  if (v14)
  {
    v13 = (void *)objc_msgSend(v10, "copy");
    v14[2](v14, v13);

  }
}

- (id)_createSandboxTokenForURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoPickerExtensionContext _createSandboxTokenForPath:](self, "_createSandboxTokenForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createSandboxTokenForPath:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerExtensionContext.m"), 452, CFSTR("path cannot be nil"));

  }
  PLGetSandboxExtensionToken();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)temporaryDirectoryInHost
{
  return self->_temporaryDirectoryInHost;
}

- (void)setTemporaryDirectoryInHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryInHost, 0);
  objc_storeStrong((id *)&self->_multipleMediaConversionConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_multipleMediaIsolationQueue, 0);
}

void __83__PUPhotoPickerExtensionContext__handleLivePhotoVideoUrlFetch_appendTo_completion___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_saveVideoURLForLivePhoto:fileURL:appendTo:completion:", a1[4], v4, a1[5], a1[6]);

}

void __83__PUPhotoPickerExtensionContext__handleLivePhotoImageUrlFetch_appendTo_completion___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_saveImageURLForLivePhoto:fileURL:appendTo:completion:", a1[4], v4, a1[5], a1[6]);

}

void __112__PUPhotoPickerExtensionContext__photoPickerInfoDictionaryFromUIImagePickerControllerInfoDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, id obj)
{
  id v6;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v6 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __66__PUPhotoPickerExtensionContext_didSelectMediaWithInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didSelectMediaWithInfoDictionary:", v3);

}

void __64__PUPhotoPickerExtensionContext__handleMutlipleMediaCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __104__PUPhotoPickerExtensionContext__createPhotoPickerInfoDictionaryFromInfoDictionary_appendTo_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v4, "multipleMediaIsolationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__PUPhotoPickerExtensionContext__createPhotoPickerInfoDictionaryFromInfoDictionary_appendTo_completion___block_invoke_2;
    block[3] = &unk_1E58ABCA8;
    v9 = *(id *)(a1 + 32);
    v10 = v7;
    dispatch_sync(v5, block);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

uint64_t __104__PUPhotoPickerExtensionContext__createPhotoPickerInfoDictionaryFromInfoDictionary_appendTo_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke_2;
  v5[3] = &unk_1E58ABD10;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(WeakRetained, "_createPhotoPickerInfoDictionaryFromInfoDictionary:appendTo:completion:", v3, v4, v5);

}

void __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  id WeakRetained;
  uint8_t v6[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ProcessingSelections", ", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleMutlipleMediaCompletion:", *(_QWORD *)(a1 + 40));

}

void __81__PUPhotoPickerExtensionContext_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__PUPhotoPickerExtensionContext_requestedViewControllerOptionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    objc_msgSend(v11, "photoPickerProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerTemporaryDirectoryUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setTemporaryDirectoryInHost:", v8);

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, id, _QWORD))(v10 + 16))(v10, v11, 0);

  }
}

+ (void)configureImageManagerLimit
{
  if (configureImageManagerLimit_onceToken != -1)
    dispatch_once(&configureImageManagerLimit_onceToken, &__block_literal_global_65898);
}

uint64_t __59__PUPhotoPickerExtensionContext_configureImageManagerLimit__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CD1598], "setMaxConcurrentDecodeCount:", 1);
}

@end
