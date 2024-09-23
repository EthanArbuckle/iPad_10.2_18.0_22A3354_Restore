@implementation UIColorSampler

void __51___UIColorSampler_showSamplerWithSelectionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51___UIColorSampler_showSamplerWithSelectionHandler___block_invoke_2;
  v6[3] = &unk_1E16B2F48;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __51___UIColorSampler_showSamplerWithSelectionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __45___UIColorSampler__createServerProxyIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __45___UIColorSampler__createServerProxyIfNeeded__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v4 = WeakRetained;

    v3 = (void *)v4[1];
    v4[1] = 0;

    WeakRetained = v4;
  }

}

void __45___UIColorSampler__createServerProxyIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (qword_1ECD808C8 != -1)
    dispatch_once(&qword_1ECD808C8, &__block_literal_global_519);
  v3 = (id)_MergedGlobals_1233;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Error creating a remoteObjectProxy: %{public}@", (uint8_t *)&v5, 0xCu);

  }
}

@end
