@implementation TVResourceImageLoader

void __40___TVResourceImageLoader_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_loader_0;
  sharedInstance_loader_0 = v0;

}

void __114___TVResourceImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  TVImage *v8;
  TVImage *v9;
  uint64_t v10;
  void *v11;
  id v12;

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageForResource:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "imageAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithLayoutDirection:", a1[7]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTraitCollection:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  v8 = [TVImage alloc];
  v12 = objc_retainAutorelease(v3);
  v9 = -[TVImage initWithCGImageRef:imageOrientation:preserveAlpha:](v8, "initWithCGImageRef:imageOrientation:preserveAlpha:", objc_msgSend(v12, "CGImage"), objc_msgSend(v12, "imageOrientation"), 1);
  +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v9, 1, a1[5]);
  v10 = a1[6];
  if (v10)
  {
    if (v9)
    {
      (*(void (**)(uint64_t, TVImage *, _QWORD, _QWORD, _QWORD, _QWORD))(v10 + 16))(v10, v9, 0, 0, 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, 0, 0, v11);

    }
  }

}

@end
