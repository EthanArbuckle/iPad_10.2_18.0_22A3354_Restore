@implementation AVAsset(PhotosUI)

- (void)_pu_setCachedDuration:()PhotosUI
{
  objc_setAssociatedObject(a1, sel_pu_cachedDuration, a3, (void *)1);
}

- (id)pu_cachedDuration
{
  return objc_getAssociatedObject(a1, sel_pu_cachedDuration);
}

- (void)pu_duration
{
  uint64_t v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  objc_msgSend(a1, "pu_cachedDuration");
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
    objc_msgSend(a1, "_pu_setCachedDuration:", v5);
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    if (!v5)
      return;
  }
  objc_msgSend(v5, "CMTimeValue");

}

- (void)pu_loadDurationWithCompletionHandler:()PhotosUI
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void (*v7)(_QWORD *, __int128 *, uint64_t, _QWORD);
  void (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  _QWORD *v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  id location[2];
  uint64_t v18;

  v4 = a3;
  objc_msgSend(a1, "pu_cachedDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    location[0] = 0;
    location[1] = 0;
    v18 = 0;
    objc_msgSend(v5, "CMTimeValue");
    if (v4)
    {
      v7 = (void (*)(_QWORD *, __int128 *, uint64_t, _QWORD))v4[2];
      v15 = *(_OWORD *)location;
      v16 = v18;
      v7(v4, &v15, 1, 0);
    }
  }
  else
  {
    objc_initWeak(location, a1);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __58__AVAsset_PhotosUI__pu_loadDurationWithCompletionHandler___block_invoke;
    v12 = &unk_1E58A4AC8;
    objc_copyWeak(&v14, location);
    v13 = v4;
    v8 = (void (**)(_QWORD))_Block_copy(&v9);
    if (objc_msgSend(a1, "statusOfValueForKey:error:", CFSTR("duration"), 0, v9, v10, v11, v12) == 2)
      v8[2](v8);
    else
      objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E59B9C40, v8);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }

}

@end
