@implementation PTUISettingsController(PXSettingsSearch)

- (void)px_performWithoutAnimations:()PXSettingsSearch completionHandler:
{
  uint64_t v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  id v9;
  void (**v10)(void);
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)();
  void *v14;
  void *v15;

  block = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __90__PTUISettingsController_PXSettingsSearch__px_performWithoutAnimations_completionHandler___block_invoke;
  v14 = &unk_1E5149198;
  v15 = a1;
  v6 = px_performWithoutAnimations_completionHandler__onceToken;
  v9 = a4;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&px_performWithoutAnimations_completionHandler__onceToken, &block);
  v8 = objc_msgSend(a1, "px_shouldPreventAnimations", v9, block, v12, v13, v14, v15);
  objc_msgSend(a1, "px_setShouldPreventAnimations:", 1);
  v7[2](v7);

  objc_msgSend(a1, "px_setShouldPreventAnimations:", v8);
  v10[2]();

}

- (void)_pxswizzled_pushViewController:()PXSettingsSearch animated:
{
  id v6;

  v6 = a3;
  objc_msgSend(a1, "_pxswizzled_pushViewController:animated:", v6, a4 & ~objc_msgSend(a1, "px_shouldPreventAnimations"));

}

- (uint64_t)px_shouldPreventAnimations
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_px_shouldPreventAnimations);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)px_setShouldPreventAnimations:()PXSettingsSearch
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_px_shouldPreventAnimations, v2, (void *)1);

}

@end
