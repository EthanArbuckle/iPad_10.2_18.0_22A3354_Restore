@implementation UIRemoteCategoryKeyView

- (id)contentViewController
{
  STKCategoryViewController *viewController;
  void *v4;
  objc_class *v5;
  STKCategoryViewController *v6;
  STKCategoryViewController *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  viewController = self->_viewController;
  if (!viewController)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)_MergedGlobals_1_26;
    v13 = _MergedGlobals_1_26;
    if (!_MergedGlobals_1_26)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getSTKCategoryViewControllerClass_block_invoke;
      v9[3] = &unk_1E16B14C0;
      v9[4] = &v10;
      __getSTKCategoryViewControllerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (STKCategoryViewController *)objc_alloc_init(v5);
    v7 = self->_viewController;
    self->_viewController = v6;

    viewController = self->_viewController;
  }
  return viewController;
}

- (id)emojiKeyManager
{
  return objc_loadWeakRetained(&self->_emojiKeyManager);
}

- (void)setEmojiKeyManager:(id)a3
{
  objc_storeWeak(&self->_emojiKeyManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_emojiKeyManager);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
