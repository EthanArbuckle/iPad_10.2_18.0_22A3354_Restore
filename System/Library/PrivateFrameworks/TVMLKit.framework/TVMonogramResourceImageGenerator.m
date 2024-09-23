@implementation TVMonogramResourceImageGenerator

void __125___TVMonogramResourceImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isCancelled") & 1) == 0)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "imageForResource:", *(_QWORD *)(a1 + 32));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "imageAsset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v14, "imageAsset");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithLayoutDirection:", *(_QWORD *)(a1 + 80));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageWithTraitCollection:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v6;
    }
    objc_msgSend(*(id *)(a1 + 40), "fillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "fillColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tintImage:withColor:", v14, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_retainAutorelease(v10);
      +[TVImage imageWithCGImageRef:imageOrientation:preserveAlpha:](TVImage, "imageWithCGImageRef:imageOrientation:preserveAlpha:", objc_msgSend(v11, "CGImage"), objc_msgSend(v11, "imageOrientation"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v12, 1, *(_QWORD *)(a1 + 56));
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    }
    else
    {
      v13 = objc_retainAutorelease(v14);
      +[TVImage imageWithCGImageRef:imageOrientation:preserveAlpha:](TVImage, "imageWithCGImageRef:imageOrientation:preserveAlpha:", objc_msgSend(v13, "CGImage"), objc_msgSend(v13, "imageOrientation"), 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v11, 1, *(_QWORD *)(a1 + 56));
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

@end
