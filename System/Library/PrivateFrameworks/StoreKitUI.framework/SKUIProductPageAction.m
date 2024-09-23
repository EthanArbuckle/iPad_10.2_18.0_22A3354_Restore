@implementation SKUIProductPageAction

+ (id)actionWithType:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIProductPageAction actionWithType:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_alloc_init((Class)a1);
  objc_msgSend(v13, "setActionType:", a3);
  return v13;
}

- (UIViewController)viewController
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**viewControllerBlock)(void);

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIProductPageAction viewController].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  viewControllerBlock = (void (**)(void))self->_viewControllerBlock;
  if (viewControllerBlock)
  {
    viewControllerBlock[2]();
    viewControllerBlock = (void (**)(void))objc_claimAutoreleasedReturnValue();
  }
  return (UIViewController *)viewControllerBlock;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (SKUIItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)viewControllerBlock
{
  return self->_viewControllerBlock;
}

- (void)setViewControllerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_viewControllerBlock, 0);
  objc_storeStrong((id *)&self->_urlTitle, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

+ (void)actionWithType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewController
{
}

@end
