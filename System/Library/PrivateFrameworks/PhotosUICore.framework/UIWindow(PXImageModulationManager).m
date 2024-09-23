@implementation UIWindow(PXImageModulationManager)

- (PXImageModulationManager)px_imageModulationManager
{
  PXImageModulationManager *v2;
  void *v3;
  PXImageModulationManager *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  objc_getAssociatedObject(a1, (const void *)modulationManagerKey);
  v2 = (PXImageModulationManager *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v4 = [PXImageModulationManager alloc];
    objc_msgSend(a1, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[PXImageModulationManager initWithRootViewController:mainScreen:](v4, "initWithRootViewController:mainScreen:", v3, v5 == v6);

    objc_setAssociatedObject(a1, (const void *)modulationManagerKey, v2, (void *)1);
    objc_initWeak(&location, a1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DC5618];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__UIWindow_PXImageModulationManager__px_imageModulationManager__block_invoke;
    v11[3] = &unk_1E51441D8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, a1, 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(a1, (const void *)px_imageModulationManager_resignKeyObserverKey, v9, (void *)1);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)_dismantleImageModulationManager
{
  objc_setAssociatedObject(a1, (const void *)modulationManagerKey, 0, (void *)1);
}

@end
