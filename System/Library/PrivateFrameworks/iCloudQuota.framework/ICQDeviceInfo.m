@implementation ICQDeviceInfo

void __49___ICQDeviceInfo_getInfoWithBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _ICQDeviceInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5 || a3)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = a3;
    +[_ICQDeviceInfo defaultDeviceInfoWithBundleId:](_ICQDeviceInfo, "defaultDeviceInfoWithBundleId:", v15);
    v7 = (_ICQDeviceInfo *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    v7 = objc_alloc_init(_ICQDeviceInfo);
    -[_ICQDeviceInfo setBundleId:](v7, "setBundleId:", *(_QWORD *)(a1 + 32));
    +[_ICQDeviceInfo templateKeyForPhotos:video:](_ICQDeviceInfo, "templateKeyForPhotos:video:", objc_msgSend(v5, "photoCount"), objc_msgSend(v5, "videoCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQDeviceInfo setKey:](v7, "setKey:", v8);

    v18[0] = CFSTR("%$PhotosCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "photoCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions getStringFromNumber:](_ICQHelperFunctions, "getStringFromNumber:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v18[1] = CFSTR("%$VideosCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "videoCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions getStringFromNumber:](_ICQHelperFunctions, "getStringFromNumber:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v11;
    v18[2] = CFSTR("%$TotalPhotosVideosCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "videoCount") + objc_msgSend(v5, "photoCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions getStringFromNumber:](_ICQHelperFunctions, "getStringFromNumber:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQDeviceInfo setWordsToReplace:](v7, "setWordsToReplace:", v14);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __38___ICQDeviceInfo_getInfoWithBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "device Info = %@", (uint8_t *)&v12, 0xCu);
  }

  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "error = %@", (uint8_t *)&v12, 0xCu);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
