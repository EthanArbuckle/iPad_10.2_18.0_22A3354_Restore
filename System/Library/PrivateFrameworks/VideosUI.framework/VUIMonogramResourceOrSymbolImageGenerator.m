@implementation VUIMonogramResourceOrSymbolImageGenerator

void __134___VUIMonogramResourceOrSymbolImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 64));
  v2 = objc_loadWeakRetained(&to);
  v3 = objc_msgSend(v2, "isCancelled");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC69B0], "imageForResource:accessibilityDescription:", *(_QWORD *)(a1 + 32), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "imageAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithLayoutDirection:", *(_QWORD *)(a1 + 72));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageWithTraitCollection:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
    objc_msgSend(*(id *)(a1 + 40), "fillColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "fillColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "vui_imageWithColor:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
    v12 = (void *)MEMORY[0x1E0DC69F0];
    v13 = objc_retainAutorelease(v4);
    objc_msgSend(v12, "imageWithCGImageRef:imageOrientation:preserveAlpha:", objc_msgSend(v13, "CGImage"), objc_msgSend(v13, "imageOrientation"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC69B0], "image:didCompleteLoadingForCache:requestRecord:", v14, 1, *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  objc_destroyWeak(&to);
}

void __134___VUIMonogramResourceOrSymbolImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 64));
  v2 = objc_loadWeakRetained(&to);
  v3 = objc_msgSend(v2, "isCancelled");

  if ((v3 & 1) == 0)
  {
    if (*(double *)(a1 + 72) <= 0.0)
      objc_msgSend(*(id *)(a1 + 32), "size");
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", (uint64_t)*MEMORY[0x1E0DC1440]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "vuiSystemImageNamed:withConfiguration:accessibilityDescription:", *(_QWORD *)(a1 + 40), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fillColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "fillColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vui_imageWithColor:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
    v9 = (void *)MEMORY[0x1E0DC69F0];
    v10 = objc_retainAutorelease(v5);
    objc_msgSend(v9, "imageWithCGImageRef:imageOrientation:preserveAlpha:", objc_msgSend(v10, "CGImage"), objc_msgSend(v10, "imageOrientation"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC69B0], "image:didCompleteLoadingForCache:requestRecord:", v11, 1, *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  objc_destroyWeak(&to);
}

@end
