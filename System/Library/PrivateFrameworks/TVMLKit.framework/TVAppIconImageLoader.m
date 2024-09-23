@implementation TVAppIconImageLoader

void __39___TVAppIconImageLoader_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_loader_1;
  sharedInstance_loader_1 = v0;

}

void __113___TVAppIconImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  TVImage *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_createApplicationIconForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [TVImage alloc];
  v8 = objc_retainAutorelease(v2);
  v4 = -[TVImage initWithCGImageRef:preserveAlpha:](v3, "initWithCGImageRef:preserveAlpha:", objc_msgSend(v8, "CGImage"), 1);
  v5 = (void *)v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    if (v4)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v6 + 16))(v6, v4, 0, 0, 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v6 + 16))(v6, 0, 0, 0, 0, v7);

    }
  }

}

@end
