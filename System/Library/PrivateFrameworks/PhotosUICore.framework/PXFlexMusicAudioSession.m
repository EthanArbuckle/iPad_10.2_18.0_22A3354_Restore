@implementation PXFlexMusicAudioSession

- (PXFlexMusicAudioSession)initWithAsset:(id)a3 volume:(float)a4 startTime:(id *)a5 queue:(id)a6 audioSessionDelegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  PXFlexMusicAudioSession *v16;
  void *v18;
  __int128 v19;
  int64_t var3;
  objc_super v21;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicAudioSession.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:PXFlexMusicAsset.class]"));

  }
  v21.receiver = self;
  v21.super_class = (Class)PXFlexMusicAudioSession;
  v19 = *(_OWORD *)&a5->var0;
  var3 = a5->var3;
  v16 = -[PXAVPlayerAudioSession initWithAsset:volume:startTime:queue:audioSessionDelegate:](&v21, sel_initWithAsset_volume_startTime_queue_audioSessionDelegate_, v13, &v19, v14, v15, COERCE_DOUBLE(__PAIR64__(DWORD1(v19), LODWORD(a4))));

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PXFlexMusicMediaProvider sharedInstance](PXFlexMusicMediaProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", -[PXFlexMusicAudioSession audioRequestID](self, "audioRequestID"));

  v4.receiver = self;
  v4.super_class = (Class)PXFlexMusicAudioSession;
  -[PXAVPlayerAudioSession dealloc](&v4, sel_dealloc);
}

- (void)requestMediaWithResultHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PXAudioRequestOptions *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PXFlexMusicLibrary sharedLibrary](PXFlexMusicLibrary, "sharedLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFlexMusicAudioSession flexMusicAsset](self, "flexMusicAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasLocalResourceForAsset:resourceType:", v6, 2);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0D09910];
    v24 = *MEMORY[0x1E0D09830];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.flexMusicDownloadRequiredAtPlaybackTime"), v11);

  }
  v22 = 0uLL;
  v23 = 0;
  -[PXFlexMusicAudioSession flexMusicAsset](self, "flexMusicAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "targetDuration");
  }
  else
  {
    v22 = 0uLL;
    v23 = 0;
  }

  v14 = objc_alloc_init(PXAudioRequestOptions);
  v20 = v22;
  v21 = v23;
  -[PXAudioRequestOptions setPreferredDuration:](v14, "setPreferredDuration:", &v20);
  +[PXFlexMusicMediaProvider sharedInstance](PXFlexMusicMediaProvider, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFlexMusicAudioSession flexMusicAsset](self, "flexMusicAsset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__PXFlexMusicAudioSession_requestMediaWithResultHandler___block_invoke;
  v18[3] = &unk_1E5124028;
  v19 = v4;
  v17 = v4;
  -[PXFlexMusicAudioSession setAudioRequestID:](self, "setAudioRequestID:", objc_msgSend(v15, "requestMediaForAsset:options:resultHandler:", v16, v14, v18));

}

- (void)cancelMediaRequest
{
  id v3;

  +[PXFlexMusicMediaProvider sharedInstance](PXFlexMusicMediaProvider, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", -[PXFlexMusicAudioSession audioRequestID](self, "audioRequestID"));

}

- (int64_t)audioRequestID
{
  return self->_audioRequestID;
}

- (void)setAudioRequestID:(int64_t)a3
{
  self->_audioRequestID = a3;
}

uint64_t __57__PXFlexMusicAudioSession_requestMediaWithResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
