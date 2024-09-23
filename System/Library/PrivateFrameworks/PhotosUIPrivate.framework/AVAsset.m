@implementation AVAsset

void __58__AVAsset_PhotosUI__pu_loadDurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t, __int128 *, BOOL, id);
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = 0;
  v3 = objc_msgSend(WeakRetained, "statusOfValueForKey:error:", CFSTR("duration"), &v12);
  v4 = v12;
  v10 = *MEMORY[0x1E0CA2E10];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  if (v3 == 2)
  {
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "duration");
    }
    else
    {
      v8 = 0uLL;
      v9 = 0;
    }
    v10 = v8;
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_pu_setCachedDuration:", v5);

  }
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = *(void (**)(uint64_t, __int128 *, BOOL, id))(v6 + 16);
      v8 = v10;
      v9 = v11;
      v7(v6, &v8, v3 == 2, v4);
    }
  }

}

void __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id v9;
  id v10[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 80));
  v2 = *(void **)(a1 + 80);
  _vitalityTransformRequiredProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke_2;
  v5[3] = &unk_1E589DDA0;
  objc_copyWeak(v10, &location);
  v4 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 32);
  v7 = v4;
  v8 = *(_OWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 88);
  objc_msgSend(v2, "loadValuesAsynchronouslyForKeys:completionHandler:", v3, v5);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  __int128 v3;
  id WeakRetained;
  _QWORD block[4];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id v9;
  id v10;

  if (dispatch_get_specific((const void *)VitalityLoadingQueueIdentifier))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(WeakRetained, "_pu_handleRequiredPropertiesLoadedWithAdditionalNormalizedTransform:completion:", *(_QWORD *)(a1 + 80), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));

  }
  else
  {
    _vitalityLoadingQueue();
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke_3;
    block[3] = &unk_1E589DDA0;
    objc_copyWeak(&v10, (id *)(a1 + 88));
    v3 = *(_OWORD *)(a1 + 48);
    v6 = *(_OWORD *)(a1 + 32);
    v7 = v3;
    v8 = *(_OWORD *)(a1 + 64);
    v9 = *(id *)(a1 + 80);
    dispatch_async(v2, block);

    objc_destroyWeak(&v10);
  }
}

void __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "_pu_handleRequiredPropertiesLoadedWithAdditionalNormalizedTransform:completion:", *(_QWORD *)(a1 + 80), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));

}

@end
