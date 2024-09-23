@implementation ICQPhotosInfo

void __38___ICQPhotosInfo__photosShutdownQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.quota.photos.shutdown", v2);
  v1 = (void *)_photosShutdownQueue_photosShutdownQueue;
  _photosShutdownQueue_photosShutdownQueue = (uint64_t)v0;

}

void __40___ICQPhotosInfo_getInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _ICQPhotosInfo *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Photos transfer progress %@", (uint8_t *)&v10, 0xCu);
  }

  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Photos transfer error %@", (uint8_t *)&v10, 0xCu);
  }

  if (!v5 || v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = objc_alloc_init(_ICQPhotosInfo);
    -[_ICQPhotosInfo setPhotoCount:](v9, "setPhotoCount:", objc_msgSend(v5, "notUploadedPhotosCount"));
    -[_ICQPhotosInfo setVideoCount:](v9, "setVideoCount:", objc_msgSend(v5, "notUploadedVideosCount"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  objc_msgSend(*(id *)(a1 + 40), "_shutDownPhotoLibrary");

}

void __39___ICQPhotosInfo__shutDownPhotoLibrary__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(MEMORY[0x1E0CD16F8], "unsafeShutdownLibraryWithPhotoLibraryURL:", *(_QWORD *)(a1 + 32));
  _ICQGetLogSystem();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1CDEBD000, v1, OS_LOG_TYPE_DEFAULT, "Photos library shutdown completed!", v2, 2u);
  }

}

@end
