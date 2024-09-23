@implementation VUIMPDeviceMediaLibrary

- (VUIMPDeviceMediaLibrary)initWithManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  VUIMPMediaLibrary *v7;
  void *v8;
  VUIMPDeviceMediaLibrary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *rentalPlaybackStartDatesToSave;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v4 = (void *)MEMORY[0x1E0CC2408];
  v5 = a3;
  objc_msgSend(v4, "defaultMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIMPMediaLibrary initWithMPMediaLibrary:type:manager:]([VUIMPMediaLibrary alloc], "initWithMPMediaLibrary:type:manager:", v6, 0, v5);
  -[VUIMediaLibrary identifier](v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)VUIMPDeviceMediaLibrary;
  v9 = -[VUIMediaLibrary initWithIdentifier:type:manager:](&v20, sel_initWithIdentifier_type_manager_, v8, -[VUIMediaLibrary type](v7, "type"), v5);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, v7);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rentalPlaybackStartDatesToSave = v9->_rentalPlaybackStartDatesToSave;
    v9->_rentalPlaybackStartDatesToSave = v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CC1D30];
    objc_msgSend(MEMORY[0x1E0CC2358], "sharedCloudController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleMediaLibraryIsUpdateInProgressDidChangeNotification_, v13, v14);

    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleMediaLibraryContentsDidChangeNotification_, CFSTR("VUIMediaLibraryContentsDidChangeNotification"), v9->_mediaLibrary);
    v15 = *MEMORY[0x1E0DC4750];
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleApplicationDidBecomeActiveNotification_, v15, v16);

    v17 = *MEMORY[0x1E0DC4868];
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleApplicationWillResignActiveNotification_, v17, v18);

    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__accountsChanged_, CFSTR("VUIAuthenticationManagerAccountStoreDidChangeNotification"), 0);
  }

  return v9;
}

- (void)_handleApplicationDidBecomeActiveNotification:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CC2358], "sharedCloudController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeActive");

}

void __86__VUIMPDeviceMediaLibrary__handleMediaLibraryIsUpdateInProgressDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6[0] = CFSTR("isUpdating");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_isUpdateInProgress"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v2;
    v6[1] = CFSTR("isInitialUpdateInProgress");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_isInitialUpdateInProgress"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VUIDeviceMediaLibraryUpdateStateDidChangeNotification"), WeakRetained, v4);

  }
}

+ (BOOL)_isUpdateInProgress
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CC2358], "sharedCloudController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUpdateInProgress");

  return v3;
}

+ (BOOL)_isInitialUpdateInProgress
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CC2358], "sharedCloudController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInitialImport");

  return v3;
}

- (void)_handleMediaLibraryIsUpdateInProgressDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VUIMediaLibrary manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__VUIMPDeviceMediaLibrary__handleMediaLibraryIsUpdateInProgressDidChangeNotification___block_invoke;
  v6[3] = &unk_1E9F9A938;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "_enqueueCompletionQueueBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __49__VUIMPDeviceMediaLibrary_forceFailToSyncLibrary__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  forceFailToSyncLibrary_force = objc_msgSend(v0, "BOOLForKey:", CFSTR("forceFailToSyncLibrary"));

}

- (void)updateFromCloudWithReason:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  VUISignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 134217984;
    v10 = a3;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeviceMediaLibrary.updateFromCloud", "reason:%ld", buf, 0xCu);
  }

  -[VUIMPDeviceMediaLibrary setDidFailUpdateMPCloudLibrary:](self, "setDidFailUpdateMPCloudLibrary:", 0);
  objc_msgSend(MEMORY[0x1E0CC2358], "sharedCloudController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__VUIMPDeviceMediaLibrary_updateFromCloudWithReason___block_invoke;
  v8[3] = &unk_1E9F9B4F8;
  v8[4] = self;
  objc_msgSend(v6, "updateJaliscoMediaLibraryWithReason:completionHandler:", a3 == 1, v8);

  VUISignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeviceMediaLibrary.updateFromCloud", ", buf, 2u);
  }

}

uint64_t __53__VUIMPDeviceMediaLibrary_updateFromCloudWithReason___block_invoke(uint64_t a1, int a2)
{
  int v4;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "forceFailToSyncLibrary");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = a2;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1D96EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Updating Jalisco Media Library with result %d defaults is %d", (uint8_t *)v6, 0xEu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setDidFailUpdateMPCloudLibrary:", v4 | a2 ^ 1u);
}

- (void)setDidFailUpdateMPCloudLibrary:(BOOL)a3
{
  self->_didFailUpdateMPCloudLibrary = a3;
}

- (BOOL)forceFailToSyncLibrary
{
  if (forceFailToSyncLibrary_onceToken != -1)
    dispatch_once(&forceFailToSyncLibrary_onceToken, &__block_literal_global_140);
  return forceFailToSyncLibrary_force;
}

- (id)title
{
  void *v2;
  void *v3;

  -[VUIMPDeviceMediaLibrary mediaLibrary](self, "mediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (VUIMPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (BOOL)isInitialUpdateInProgress
{
  return objc_msgSend((id)objc_opt_class(), "_isInitialUpdateInProgress");
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[VUIMPDeviceMediaLibrary mediaLibrary](self, "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueueFetchRequests:completionHandler:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (VUIMPDeviceMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("The %@ initializer is not available."), v8);

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIMPDeviceMediaLibrary;
  -[VUIMediaLibraryImageLoader dealloc](&v4, sel_dealloc);
}

- (BOOL)isUpdating
{
  return objc_msgSend((id)objc_opt_class(), "_isUpdateInProgress");
}

- (void)updateProgressWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("completionHandler"));
  objc_msgSend(MEMORY[0x1E0CC2358], "sharedCloudController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__VUIMPDeviceMediaLibrary_updateProgressWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E9FA3528;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadUpdateProgressWithCompletionHandler:", v6);

}

uint64_t __63__VUIMPDeviceMediaLibrary_updateProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)didFailUpdateCloudLibrary
{
  return self->_didFailUpdateMPCloudLibrary;
}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VUIMPDeviceMediaLibrary mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueMediaItemEntityTypesFetchWithCompletionHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[VUIMPDeviceMediaLibrary mediaLibrary](self, "mediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveMediaEntity:completionHandler:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_imageLoaderIdentifier
{
  void *v2;
  void *v3;

  -[VUIMPDeviceMediaLibrary mediaLibrary](self, "mediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_imageLoaderIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VUIMPDeviceMediaLibrary mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_imageLoadParamsForImageLoaderObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  -[VUIMPDeviceMediaLibrary mediaLibrary](self, "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_imageLoadOperationWithParams:scaleToSize:cropToFit:", v9, v5, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_handleApplicationWillResignActiveNotification:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CC2358], "sharedCloudController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignActive");

}

- (void)_accountsChanged:(id)a3
{
  -[VUIMPDeviceMediaLibrary setDidFailUpdateMPCloudLibrary:](self, "setDidFailUpdateMPCloudLibrary:", 0);
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (NSMutableDictionary)rentalPlaybackStartDatesToSave
{
  return self->_rentalPlaybackStartDatesToSave;
}

- (void)setRentalPlaybackStartDatesToSave:(id)a3
{
  objc_storeStrong((id *)&self->_rentalPlaybackStartDatesToSave, a3);
}

- (BOOL)updatingRentalPlaybackStartDates
{
  return self->_updatingRentalPlaybackStartDates;
}

- (void)setUpdatingRentalPlaybackStartDates:(BOOL)a3
{
  self->_updatingRentalPlaybackStartDates = a3;
}

- (BOOL)didFailUpdateMPCloudLibrary
{
  return self->_didFailUpdateMPCloudLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalPlaybackStartDatesToSave, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end
