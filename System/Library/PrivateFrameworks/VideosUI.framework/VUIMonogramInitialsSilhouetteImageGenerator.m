@implementation VUIMonogramInitialsSilhouetteImageGenerator

uint64_t __77___VUIMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke(uint64_t a1)
{
  return +[_VUIMonogramInitialsSilhouetteImageGenerator drawInitialsWithRect:andDescription:](_VUIMonogramInitialsSilhouetteImageGenerator, "drawInitialsWithRect:andDescription:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __77___VUIMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __136___VUIMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 48));
  v2 = objc_loadWeakRetained(&to);
  v3 = objc_msgSend(v2, "isCancelled");

  if ((v3 & 1) == 0)
  {
    +[_VUIMonogramInitialsSilhouetteImageGenerator monogramImageWithDescription:](_VUIMonogramInitialsSilhouetteImageGenerator, "monogramImageWithDescription:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC69F0]), "initWithCGImageRef:exifOrientation:preserveAlpha:", objc_msgSend(v4, "vuiCGImage"), 1, 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __136___VUIMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
    v8[3] = &unk_1E9FA1900;
    objc_copyWeak(&v11, &to);
    v6 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&to);
}

void __136___VUIMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
