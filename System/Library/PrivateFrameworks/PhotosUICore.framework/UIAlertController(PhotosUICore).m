@implementation UIAlertController(PhotosUICore)

- (void)setPx_shouldForceAlertStyle:()PhotosUICore
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, (const void *)PXShouldForceAlertStyleKey, v2, (void *)1);

}

- (uint64_t)px_shouldForceAlertStyle
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)PXShouldForceAlertStyleKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (void)px_showDebugAlertInKeyWindowWithMessage:()PhotosUICore
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Debug UI"), v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  v5 = (void *)MEMORY[0x1E0DC3448];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __75__UIAlertController_PhotosUICore__px_showDebugAlertInKeyWindowWithMessage___block_invoke;
  v13 = &unk_1E5140760;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v5, "actionWithTitle:style:handler:", CFSTR("OK"), 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v6, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_firstKeyWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v4, 1, 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

@end
