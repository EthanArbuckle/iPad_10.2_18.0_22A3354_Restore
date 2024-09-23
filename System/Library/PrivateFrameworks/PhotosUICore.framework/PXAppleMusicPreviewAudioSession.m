@implementation PXAppleMusicPreviewAudioSession

- (PXAppleMusicPreviewAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  PXAppleMusicPreviewAudioSession *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXAppleMusicPreviewAudioSession;
  v8 = *a5;
  result = -[PXAVPlayerAudioSession initWithAsset:volume:startTime:queue:audioSessionDelegate:](&v9, sel_initWithAsset_volume_startTime_queue_audioSessionDelegate_, a3, &v8, a6, a7);
  if (result)
    result->_requestID = 0;
  return result;
}

- (void)requestMediaWithResultHandler:(id)a3
{
  id v4;
  PXAudioRequestOptions *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  id location;

  v4 = a3;
  if (!self->_requestID)
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc_init(PXAudioRequestOptions);
    -[PXAudioRequestOptions setIntent:](v5, "setIntent:", 1);
    CMTimeMakeWithSeconds(&v18, 1.0, PXAudioDefaultCMTimeScale);
    v17 = v18;
    -[PXAudioRequestOptions setFadeOutDuration:](v5, "setFadeOutDuration:", &v17);
    CMTimeMakeWithSeconds(&v16, 30.0, PXAudioDefaultCMTimeScale);
    v15 = v16;
    -[PXAudioRequestOptions setMaximumDuration:](v5, "setMaximumDuration:", &v15);
    PLAudioPlaybackGetLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PXAppleMusicPreviewAudioSessionRequestMedia", " enableTelemetry=YES ", buf, 2u);
      }
    }

    +[PXAppleMusicMediaProvider sharedInstance](PXAppleMusicMediaProvider, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAudioSession asset](self, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PXAppleMusicPreviewAudioSession_requestMediaWithResultHandler___block_invoke;
    v11[3] = &unk_1E5129078;
    v11[4] = self;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    self->_requestID = objc_msgSend(v9, "requestMediaForAsset:options:resultHandler:", v10, v5, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (void)cancelMediaRequest
{
  id v3;

  +[PXAppleMusicMediaProvider sharedInstance](PXAppleMusicMediaProvider, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_requestID);

}

- (void)_handleRequestedAsset:(id)a3 audioMix:(id)a4 info:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  os_signpost_id_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];
  id location[5];
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v10)
  {
    v15 = MEMORY[0x1E0C809B0];
    location[1] = (id)MEMORY[0x1E0C809B0];
    location[2] = (id)3221225472;
    location[3] = __85__PXAppleMusicPreviewAudioSession__handleRequestedAsset_audioMix_info_resultHandler___block_invoke;
    location[4] = &unk_1E51290A0;
    v16 = v10;
    v28 = v16;
    if (PXExists())
    {
      objc_initWeak(location, self);
      PLAudioPlaybackGetLog();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = os_signpost_id_make_with_pointer(v17, self);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v19 = v18;
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PXAppleMusicPreviewAudioSessionLoadAssetKeys", " enableTelemetry=YES ", buf, 2u);
        }
      }

      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __85__PXAppleMusicPreviewAudioSession__handleRequestedAsset_audioMix_info_resultHandler___block_invoke_6;
      v20[3] = &unk_1E5147258;
      v20[4] = self;
      objc_copyWeak(&v25, location);
      v21 = v16;
      v22 = v11;
      v23 = v12;
      v24 = v14;
      objc_msgSend(v21, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E53E97B0, v20);

      objc_destroyWeak(&v25);
      objc_destroyWeak(location);
    }
    else
    {
      -[PXAppleMusicPreviewAudioSession _handleValuesLoadedForAsset:audioMix:info:resultHandler:](self, "_handleValuesLoadedForAsset:audioMix:info:resultHandler:", v16, v11, v12, v14);
    }

  }
  else
  {
    self->_requestID = 0;
    (*((void (**)(id, _QWORD, id, id))v13 + 2))(v13, 0, v11, v12);
  }

}

- (void)_handleValuesLoadedForAsset:(id)a3 audioMix:(id)a4 info:(id)a5 resultHandler:(id)a6
{
  self->_requestID = 0;
  (*((void (**)(id, id, id, id))a6 + 2))(a6, a3, a4, a5);
}

BOOL __85__PXAppleMusicPreviewAudioSession__handleRequestedAsset_audioMix_info_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", a2, 0) != 2;
}

void __85__PXAppleMusicPreviewAudioSession__handleRequestedAsset_audioMix_info_resultHandler___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  id WeakRetained;
  uint8_t v6[16];

  PLAudioPlaybackGetLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v2, OS_SIGNPOST_INTERVAL_END, v4, "PXAppleMusicPreviewAudioSessionLoadAssetKeys", " enableTelemetry=YES ", v6, 2u);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_handleValuesLoadedForAsset:audioMix:info:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __65__PXAppleMusicPreviewAudioSession_requestMediaWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  id WeakRetained;
  uint8_t v14[16];

  v7 = a4;
  v8 = a3;
  v9 = a2;
  PLAudioPlaybackGetLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 32));
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PXAppleMusicPreviewAudioSessionRequestMedia", " enableTelemetry=YES ", v14, 2u);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleRequestedAsset:audioMix:info:resultHandler:", v9, v8, v7, *(_QWORD *)(a1 + 40));

}

@end
