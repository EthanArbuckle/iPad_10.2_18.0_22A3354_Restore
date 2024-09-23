@implementation PXAppleMusicCueProvider

- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = objc_msgSend(v5, "catalog");
  if (v7 == 3)
  {
    objc_msgSend(v5, "originalAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cueSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v7 == 2)
    {
      objc_msgSend(v5, "cueSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v8 = 0;
  }
  PLAudioPlaybackGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Unable to provide audio cues for asset %@ because it does not respond to -cueSource as expected.", (uint8_t *)&v12, 0xCu);
  }

LABEL_9:
  v6[2](v6, v8, 0);

  return 0;
}

@end
