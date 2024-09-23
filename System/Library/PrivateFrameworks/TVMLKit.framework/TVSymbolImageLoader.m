@implementation TVSymbolImageLoader

void __38___TVSymbolImageLoader_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_loader;
  sharedInstance_loader = v0;

}

void __112___TVSymbolImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  TVImage *v5;
  TVImage *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[_TVProcessInfo currentProcessInfo](_TVProcessInfo, "currentProcessInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPrivateEntitlement");

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:withConfiguration:", a1[4], a1[5]);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  v5 = [TVImage alloc];
  v9 = objc_retainAutorelease(v2);
  v6 = -[TVImage initWithCGImageRef:imageOrientation:preserveAlpha:](v5, "initWithCGImageRef:imageOrientation:preserveAlpha:", objc_msgSend(v9, "CGImage"), objc_msgSend(v9, "imageOrientation"), 1);
  +[ITMLUtilities image:didCompleteLoadingForCache:requestRecord:](ITMLUtilities, "image:didCompleteLoadingForCache:requestRecord:", v6, 1, a1[6]);
  v7 = a1[7];
  if (v7)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, TVImage *, _QWORD, _QWORD, uint64_t, _QWORD))(v7 + 16))(v7, v6, 0, 0, 2, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, void *))(v7 + 16))(v7, 0, 0, 0, 2, v8);

    }
  }

}

@end
