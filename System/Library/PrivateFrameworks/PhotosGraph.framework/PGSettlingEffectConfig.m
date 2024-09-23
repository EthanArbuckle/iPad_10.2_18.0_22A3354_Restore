@implementation PGSettlingEffectConfig

- (PGSettlingEffectConfig)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v6;
  NSObject *v7;
  char *v8;
  PGSettlingEffectConfig *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  objc_super v29;
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PGSettlingEffectConfig;
  v8 = -[PGSettlingEffectConfig init](&v29, sel_init);
  v9 = (PGSettlingEffectConfig *)v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 8) = xmmword_1CA8ED9E0;
    *(_OWORD *)(v8 + 24) = xmmword_1CA8ED9F0;
    objc_msgSend(v8, "_requestWallpaperDownloadServerConfigWithPhotoLibrary:loggingConnection:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("max.num.stabilizationFailuresAllowed"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = objc_msgSend(v12, "unsignedIntegerValue");
        v15 = v14;
        v9->_maxL1FailuresAllowed = v14;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v31 = v15;
          _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Set server configured maxL1FailuresAllowed: %d", buf, 8u);
        }
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("max.num.frcRequestsAllowed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = objc_msgSend(v16, "unsignedIntegerValue");
        v19 = v18;
        v9->_maxFRCRequestsAllowed = v18;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v31 = v19;
          _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Set server configured maxFRCRequestsAllowed: %d", buf, 8u);
        }
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("default.num.stabilizationFailuresAllowed"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = objc_msgSend(v20, "unsignedIntegerValue");
        v23 = v22;
        v9->_defaultL1FailuresAllowed = v22;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v31 = v23;
          _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Set server configured defaultL1FailuresAllowed: %d", buf, 8u);
        }
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("default.num.frcRequestsAllowed"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        v26 = objc_msgSend(v24, "unsignedIntegerValue");
        v27 = v26;
        v9->_defaultFRCRequestsAllowed = v26;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v31 = v27;
          _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Set server configured defaultFRCRequestsAllowed: %d", buf, 8u);
        }
      }

    }
  }

  return v9;
}

- (id)_requestWallpaperDownloadServerConfigWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  uint32_t denom;
  uint32_t numer;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  id v20;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  mach_timebase_info info;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__30315;
  v30 = __Block_byref_object_dispose__30316;
  v31 = 0;
  v6 = a4;
  v7 = os_signpost_id_generate(v6);
  v8 = v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RequestWallpaperDownloadServerConfig", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v10 = mach_absolute_time();
  v11 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __98__PGSettlingEffectConfig__requestWallpaperDownloadServerConfigWithPhotoLibrary_loggingConnection___block_invoke;
  v22[3] = &unk_1E842CB60;
  v24 = &v26;
  v12 = v11;
  v23 = v12;
  objc_msgSend(v5, "getCPLConfigrationValueForClient:completionHandler:", 0, v22);
  v13 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v12, v13) && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "[PGSettlingEffectConfig] Timeout requesting 'Wallpaper Download' server config.", buf, 2u);
  }
  v14 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v17 = v9;
  v18 = v17;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v18, OS_SIGNPOST_INTERVAL_END, v7, "RequestWallpaperDownloadServerConfig", ", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "RequestWallpaperDownloadServerConfig";
    v34 = 2048;
    v35 = (float)((float)((float)((float)(v14 - v10) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (const char *)v27[5];
    *(_DWORD *)buf = 138412290;
    v33 = v19;
    _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Requested 'Wallpaper Download' server config: %@", buf, 0xCu);
  }
  v20 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v20;
}

- (unint64_t)maxL1FailuresAllowed
{
  return self->_maxL1FailuresAllowed;
}

- (unint64_t)maxFRCRequestsAllowed
{
  return self->_maxFRCRequestsAllowed;
}

- (unint64_t)defaultL1FailuresAllowed
{
  return self->_defaultL1FailuresAllowed;
}

- (unint64_t)defaultFRCRequestsAllowed
{
  return self->_defaultFRCRequestsAllowed;
}

void __98__PGSettlingEffectConfig__requestWallpaperDownloadServerConfigWithPhotoLibrary_loggingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
