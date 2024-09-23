@implementation AVAsset

void __62__AVAsset_PhotosUICore__px_loadDurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, __int128 *, BOOL, id);
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  NSStringFromSelector(sel_duration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v4 = objc_msgSend(WeakRetained, "statusOfValueForKey:error:", v3, &v13);
  v5 = v13;

  v11 = *MEMORY[0x1E0CA2E10];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  if (v4 == 2)
  {
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "duration");
    }
    else
    {
      v9 = 0uLL;
      v10 = 0;
    }
    v11 = v9;
    v12 = v10;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_px_setCachedDuration:", v6);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7 && WeakRetained)
  {
    v8 = *(void (**)(uint64_t, __int128 *, BOOL, id))(v7 + 16);
    v9 = v11;
    v10 = v12;
    v8(v7, &v9, v4 == 2, v5);
  }

}

@end
