@implementation PUWallpaperShuffleMediaProviderImageOperation

void __72___PUWallpaperShuffleMediaProviderImageOperation__handleRenderResponse___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "resultHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "px_finishIfPossible");
  CGImageRelease(*(CGImageRef *)(a1 + 48));
}

void __58___PUWallpaperShuffleMediaProviderImageOperation_px_start__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleRenderResponse:", v3);

}

@end
