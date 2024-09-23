@implementation ISWrappedAVAudioSession

- (void)dealloc
{
  AVAudioSession *v3;
  void *v4;
  objc_super v5;

  -[ISWrappedAVAudioSession _endObservingOutputVolumeIfNeeded](self, "_endObservingOutputVolumeIfNeeded");
  v3 = self->_audioSession;
  +[ISDeferredDealloc sharedInstance](ISDeferredDealloc, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_performDeferredDealloc:", v3);

  v5.receiver = self;
  v5.super_class = (Class)ISWrappedAVAudioSession;
  -[ISWrappedAVAudioSession dealloc](&v5, sel_dealloc);
}

+ (id)auxiliarySession
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithAudioSession:category:", v3, *MEMORY[0x1E0C89660]);

  return v4;
}

- (ISWrappedAVAudioSession)initWithAudioSession:(id)a3
{
  id v5;
  ISWrappedAVAudioSession *v6;
  ISWrappedAVAudioSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISWrappedAVAudioSession;
  v6 = -[ISWrappedAVAudioSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_expectedCategory, (id)*MEMORY[0x1E0C89660]);
    objc_storeStrong((id *)&v7->_audioSession, a3);
  }

  return v7;
}

- (ISWrappedAVAudioSession)initWithAudioSession:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  ISWrappedAVAudioSession *v9;
  uint64_t v10;
  NSString *expectedCategory;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ISWrappedAVAudioSession;
  v9 = -[ISWrappedAVAudioSession init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    expectedCategory = v9->_expectedCategory;
    v9->_expectedCategory = (NSString *)v10;

    objc_storeStrong((id *)&v9->_audioSession, a3);
  }

  return v9;
}

- (BOOL)setCategory:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  NSString *v8;
  NSString *expectedCategory;

  v6 = a3;
  v7 = -[AVAudioSession setCategory:error:](self->_audioSession, "setCategory:error:", v6, a4);
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    expectedCategory = self->_expectedCategory;
    self->_expectedCategory = v8;

  }
  return v7;
}

- (void)registerVolumeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__ISWrappedAVAudioSession_registerVolumeObserver___block_invoke;
  v6[3] = &unk_1E9454130;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  is_dispatch_on_main_queue(v6);

}

- (void)unregisterVolumeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__ISWrappedAVAudioSession_unregisterVolumeObserver___block_invoke;
  v6[3] = &unk_1E9454130;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  is_dispatch_on_main_queue(v6);

}

- (BOOL)setActive:(BOOL)a3 error:(id *)a4
{
  return -[AVAudioSession setActive:error:](self->_audioSession, "setActive:error:", a3, a4);
}

- (NSString)category
{
  return self->_expectedCategory;
}

- (BOOL)setCategory:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  _BOOL4 v9;
  NSString *v10;
  NSString *expectedCategory;

  v8 = a3;
  v9 = -[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](self->_audioSession, "setCategory:mode:routeSharingPolicy:options:error:", v8, *MEMORY[0x1E0C89748], 0, a4, a5);
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    expectedCategory = self->_expectedCategory;
    self->_expectedCategory = v10;

  }
  return v9;
}

- (BOOL)setCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  NSString *v16;
  NSObject *expectedCategory;
  id v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  ISWrappedAVAudioSession *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  ISGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138413314;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 2048;
    v25 = a5;
    v26 = 2048;
    v27 = a6;
    v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_1D2DCA000, v14, OS_LOG_TYPE_DEFAULT, "Setting category (%@) mode (%@) routeSharingPolicy (%lu) options (%lu) on wrapped audio session %@", (uint8_t *)&v20, 0x34u);
  }

  v15 = -[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](self->_audioSession, "setCategory:mode:routeSharingPolicy:options:error:", v12, v13, a5, a6, a7);
  if (v15)
  {
    v16 = (NSString *)objc_msgSend(v12, "copy");
    expectedCategory = self->_expectedCategory;
    self->_expectedCategory = v16;
  }
  else
  {
    ISGetLog();
    expectedCategory = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(expectedCategory, OS_LOG_TYPE_ERROR))
    {
      v19 = *a7;
      v20 = 138412290;
      v21 = v19;
      _os_log_error_impl(&dword_1D2DCA000, expectedCategory, OS_LOG_TYPE_ERROR, "Failed! %@", (uint8_t *)&v20, 0xCu);
    }
  }

  return v15;
}

- (void)_beginObservingOutputVolumeIfNeeded
{
  if (!self->_didBeginObservingOutputVolume)
  {
    self->_didBeginObservingOutputVolume = 1;
    -[AVAudioSession addObserver:forKeyPath:options:context:](self->_audioSession, "addObserver:forKeyPath:options:context:", self, CFSTR("outputVolume"), 3, OutputVolumeObservationContext);
  }
}

- (void)_endObservingOutputVolumeIfNeeded
{
  if (self->_didBeginObservingOutputVolume)
  {
    self->_didBeginObservingOutputVolume = 0;
    -[AVAudioSession removeObserver:forKeyPath:context:](self->_audioSession, "removeObserver:forKeyPath:context:", self, CFSTR("outputVolume"), OutputVolumeObservationContext);
  }
}

- (void)_main_informObserversOfVolumeChangeFrom:(float)a3 to:(float)a4
{
  void *v7;
  _QWORD v8[5];
  float v9;
  float v10;

  -[NSHashTable allObjects](self->_main_volumeObservers, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__ISWrappedAVAudioSession__main_informObserversOfVolumeChangeFrom_to___block_invoke;
  v8[3] = &unk_1E9453ED0;
  v8[4] = self;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;

  v10 = a5;
  v11 = v10;
  if ((void *)OutputVolumeObservationContext == a6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__ISWrappedAVAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v13[3] = &unk_1E9454130;
    v13[4] = self;
    v14 = v10;
    is_dispatch_on_main_queue(v13);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ISWrappedAVAudioSession;
    -[ISWrappedAVAudioSession observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);
  }

}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_main_volumeObservers, 0);
  objc_storeStrong((id *)&self->_expectedCategory, 0);
}

void __74__ISWrappedAVAudioSession_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  LODWORD(v7) = v6;
  LODWORD(v8) = v4;
  objc_msgSend(v2, "_main_informObserversOfVolumeChangeFrom:to:", v8, v7);

}

uint64_t __70__ISWrappedAVAudioSession__main_informObserversOfVolumeChangeFrom_to___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  LODWORD(a4) = *(_DWORD *)(a1 + 44);
  return objc_msgSend(a2, "wrappedAudioSession:didChangeVolumeFrom:to:", *(_QWORD *)(a1 + 32), a3, a4);
}

uint64_t __52__ISWrappedAVAudioSession_unregisterVolumeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_endObservingOutputVolumeIfNeeded");
  return result;
}

uint64_t __50__ISWrappedAVAudioSession_registerVolumeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_beginObservingOutputVolumeIfNeeded");
}

+ (ISWrappedAVAudioSession)sharedAmbientInstance
{
  if (sharedAmbientInstance_onceToken != -1)
    dispatch_once(&sharedAmbientInstance_onceToken, &__block_literal_global_3638);
  return (ISWrappedAVAudioSession *)(id)sharedAmbientInstance_sharedAmbientInstance;
}

+ (void)sharedAmbientInstanceWithLoadHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  void (**v8)(id, void *);
  id v9;

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (mainQueue_ISWrappedAVAudioSessionDidLoadAmbientInstance == 1)
    {
      objc_msgSend(a1, "sharedAmbientInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v5);

    }
    else
    {
      dispatch_get_global_queue(2, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __64__ISWrappedAVAudioSession_sharedAmbientInstanceWithLoadHandler___block_invoke;
      v7[3] = &unk_1E9453E88;
      v8 = v4;
      v9 = a1;
      dispatch_async(v6, v7);

    }
  }

}

+ (ISWrappedAVAudioSession)sharedVideoPlaybackInstance
{
  if (sharedVideoPlaybackInstance_onceToken != -1)
    dispatch_once(&sharedVideoPlaybackInstance_onceToken, &__block_literal_global_3);
  return (ISWrappedAVAudioSession *)(id)sharedVideoPlaybackInstance_sharedVideoPlaybackInstance;
}

+ (void)sharedVideoPlaybackInstanceWithLoadHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  void (**v8)(id, void *);
  id v9;

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (mainQueue_ISWrappedAVAudioSessionDidLoadPlaybackInstance == 1)
    {
      objc_msgSend(a1, "sharedVideoPlaybackInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v5);

    }
    else
    {
      dispatch_get_global_queue(2, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __70__ISWrappedAVAudioSession_sharedVideoPlaybackInstanceWithLoadHandler___block_invoke;
      v7[3] = &unk_1E9453E88;
      v8 = v4;
      v9 = a1;
      dispatch_async(v6, v7);

    }
  }

}

+ (void)sharedPhotosOneUpInstanceWithLoadHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  void (**v8)(id, void *);
  id v9;

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (mainQueue_ISWrappedAVAudioSessionDidLoadOneUpInstance == 1)
    {
      objc_msgSend(a1, "sharedPhotosOneUpInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v5);

    }
    else
    {
      dispatch_get_global_queue(2, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __68__ISWrappedAVAudioSession_sharedPhotosOneUpInstanceWithLoadHandler___block_invoke;
      v7[3] = &unk_1E9453E88;
      v8 = v4;
      v9 = a1;
      dispatch_async(v6, v7);

    }
  }

}

+ (id)sharedPhotosOneUpInstance
{
  if (sharedPhotosOneUpInstance_onceToken != -1)
    dispatch_once(&sharedPhotosOneUpInstance_onceToken, &__block_literal_global_6);
  return (id)sharedPhotosOneUpInstance_sharedVideoPlaybackInstance;
}

void __52__ISWrappedAVAudioSession_sharedPhotosOneUpInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[ISWrappedAVAudioSession auxiliarySession](ISWrappedAVAudioSession, "auxiliarySession");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedPhotosOneUpInstance_sharedVideoPlaybackInstance;
  sharedPhotosOneUpInstance_sharedVideoPlaybackInstance = v0;

  v2 = *MEMORY[0x1E0C89660];
  v3 = *MEMORY[0x1E0C89748];
  v7 = 0;
  v4 = objc_msgSend((id)sharedPhotosOneUpInstance_sharedVideoPlaybackInstance, "setCategory:mode:routeSharingPolicy:options:error:", v2, v3, 0, 0, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    ISGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_1D2DCA000, v6, OS_LOG_TYPE_ERROR, "Unable to configure Playback audio session. Error: %@", buf, 0xCu);
    }

  }
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_8);

}

void __52__ISWrappedAVAudioSession_sharedPhotosOneUpInstance__block_invoke_7()
{
  mainQueue_ISWrappedAVAudioSessionDidLoadOneUpInstance = 1;
}

void __68__ISWrappedAVAudioSession_sharedPhotosOneUpInstanceWithLoadHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sharedPhotosOneUpInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __70__ISWrappedAVAudioSession_sharedVideoPlaybackInstanceWithLoadHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sharedVideoPlaybackInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __54__ISWrappedAVAudioSession_sharedVideoPlaybackInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[ISWrappedAVAudioSession auxiliarySession](ISWrappedAVAudioSession, "auxiliarySession");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedVideoPlaybackInstance_sharedVideoPlaybackInstance;
  sharedVideoPlaybackInstance_sharedVideoPlaybackInstance = v0;

  v2 = *MEMORY[0x1E0C89660];
  v3 = *MEMORY[0x1E0C89748];
  v7 = 0;
  v4 = objc_msgSend((id)sharedVideoPlaybackInstance_sharedVideoPlaybackInstance, "setCategory:mode:routeSharingPolicy:options:error:", v2, v3, 0, 0, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    ISGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_1D2DCA000, v6, OS_LOG_TYPE_ERROR, "Unable to configure Playback audio session. Error: %@", buf, 0xCu);
    }

  }
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_5);

}

void __54__ISWrappedAVAudioSession_sharedVideoPlaybackInstance__block_invoke_4()
{
  mainQueue_ISWrappedAVAudioSessionDidLoadPlaybackInstance = 1;
}

void __64__ISWrappedAVAudioSession_sharedAmbientInstanceWithLoadHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sharedAmbientInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __48__ISWrappedAVAudioSession_sharedAmbientInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[ISWrappedAVAudioSession auxiliarySession](ISWrappedAVAudioSession, "auxiliarySession");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedAmbientInstance_sharedAmbientInstance;
  sharedAmbientInstance_sharedAmbientInstance = v0;

  v2 = *MEMORY[0x1E0C89660];
  v3 = *MEMORY[0x1E0C89748];
  v7 = 0;
  v4 = objc_msgSend((id)sharedAmbientInstance_sharedAmbientInstance, "setCategory:mode:routeSharingPolicy:options:error:", v2, v3, 0, 0, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    ISGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_1D2DCA000, v6, OS_LOG_TYPE_ERROR, "Unable to configure Ambient audio session. Error: %@", buf, 0xCu);
    }

  }
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_2_3640);

}

void __48__ISWrappedAVAudioSession_sharedAmbientInstance__block_invoke_1()
{
  mainQueue_ISWrappedAVAudioSessionDidLoadAmbientInstance = 1;
}

@end
