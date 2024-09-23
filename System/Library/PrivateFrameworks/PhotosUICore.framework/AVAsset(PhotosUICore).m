@implementation AVAsset(PhotosUICore)

- (void)_px_setCachedDuration:()PhotosUICore
{
  objc_setAssociatedObject(a1, sel_px_cachedDuration, a3, (void *)1);
}

- (id)px_cachedDuration
{
  return objc_getAssociatedObject(a1, sel_px_cachedDuration);
}

- (void)px_duration
{
  uint64_t v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  objc_msgSend(a1, "px_cachedDuration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  else
  {
    v8 = 0uLL;
    v9 = 0;
    objc_msgSend(a1, "duration");
    v6 = v8;
    v7 = v9;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_px_setCachedDuration:", v5);
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    if (!v5)
      return;
  }
  objc_msgSend(v5, "CMTimeValue");

}

- (void)px_loadDurationWithCompletionHandler:()PhotosUICore
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void (*v7)(_QWORD *, __int128 *, uint64_t, _QWORD);
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  _QWORD *v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  id location[2];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "px_cachedDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    location[0] = 0;
    location[1] = 0;
    v22 = 0;
    objc_msgSend(v5, "CMTimeValue");
    if (v4)
    {
      v7 = (void (*)(_QWORD *, __int128 *, uint64_t, _QWORD))v4[2];
      v19 = *(_OWORD *)location;
      v20 = v22;
      v7(v4, &v19, 1, 0);
    }
  }
  else
  {
    objc_initWeak(location, a1);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __62__AVAsset_PhotosUICore__px_loadDurationWithCompletionHandler___block_invoke;
    v16 = &unk_1E5146480;
    objc_copyWeak(&v18, location);
    v17 = v4;
    v8 = (void (**)(_QWORD))_Block_copy(&v13);
    NSStringFromSelector(sel_duration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "statusOfValueForKey:error:", v9, 0, v13, v14, v15, v16);

    if (v10 == 2)
    {
      v8[2](v8);
    }
    else
    {
      NSStringFromSelector(sel_duration);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:", v12, v8);

    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }

}

- (double)px_dimensionsOfFirstVideoTrack
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "dimensions");
  v4 = v3;

  return v4;
}

- (id)px_assetByClampingToDuration:()PhotosUICore error:
{
  CMTime *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  CFStringRef v14;
  id v15;
  CMTime duration;
  CMTimeRange time2;
  CMTime time1;
  CMTime start[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "duration");
  *(_OWORD *)&time2.start.value = *(_OWORD *)&a3->value;
  time2.start.epoch = a3->epoch;
  if (CMTimeCompare(&time1, &time2.start) <= 0)
    return a1;
  memset(&time2, 0, sizeof(time2));
  v7 = (CMTime *)MEMORY[0x1E0CA2E68];
  start[0] = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  duration = *a3;
  CMTimeRangeMake(&time2, start, &duration);
  v8 = objc_alloc_init(MEMORY[0x1E0C8B268]);
  v15 = 0;
  *(CMTimeRange *)&start[0].value = time2;
  duration = *v7;
  v9 = objc_msgSend(MEMORY[0x1E0D75130], "insertTimeRange:ofAsset:atTime:intoMutableComposition:error:", start, a1, &duration, v8, &v15);
  v10 = v15;
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    v12 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      start[0] = *a3;
      v14 = CMTimeCopyDescription(0, start);
      LODWORD(start[0].value) = 138412802;
      *(CMTimeValue *)((char *)&start[0].value + 4) = (CMTimeValue)a1;
      LOWORD(start[0].flags) = 2112;
      *(_QWORD *)((char *)&start[0].flags + 2) = v14;
      HIWORD(start[0].epoch) = 2112;
      start[1].value = (CMTimeValue)v11;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to produce trimmed AVAsset from asset %@, duration %@. Error: %@.", (uint8_t *)start, 0x20u);
    }
    v12 = 0;
  }

  return v12;
}

@end
