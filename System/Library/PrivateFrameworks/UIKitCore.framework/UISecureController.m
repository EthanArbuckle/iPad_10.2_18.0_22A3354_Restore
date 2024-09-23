@implementation UISecureController

void __65___UISecureController__synchronousRemoteObjectProxyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE0CDFE8))
  {
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_119);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v8;
    v5 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }

}

void __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_UISecureController _updateSizeSpec:intrinsicContentSize:]((uint64_t)WeakRetained, *(void **)(a1 + 32), a2, a3);

}

void __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_3;
  v4[3] = &unk_1E16BE6B0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "getIntrinsicContentSizeForSpec:reply:", v3, v4);

  objc_destroyWeak(&v6);
}

void __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_3(uint64_t a1, double a2, double a3)
{
  _QWORD v6[4];
  id v7;
  id v8[3];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_4;
  v6[3] = &unk_1E16BE6D8;
  objc_copyWeak(v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v8[1] = *(id *)&a2;
  v8[2] = *(id *)&a3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(v8);
}

void __66___UISecureController_slotView_shouldSetFinalContentForStyle_tag___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_UISecureController _updateSizeSpec:intrinsicContentSize:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

@end
