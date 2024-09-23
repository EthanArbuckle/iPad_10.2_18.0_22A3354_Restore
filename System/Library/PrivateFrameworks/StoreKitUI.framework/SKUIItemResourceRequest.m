@implementation SKUIItemResourceRequest

- (void)finishWithResource:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemResourceRequest finishWithResource:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "loadedItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidItemIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "itemRequest:didFinishWithItems:invalidItemIdentifiers:", self, v14, v15);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "loadedItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "itemRequest:didFinishWithItems:", self, v16);

  }
}

- (id)newLoadOperation
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIItemResourceRequest newLoadOperation].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return -[SKUILoadItemResourceOperation initWithResourceRequest:]([SKUILoadItemResourceOperation alloc], "initWithResourceRequest:", self);
}

- (id)copyWithZone:(_NSZone *)a3
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
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemResourceRequest copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIItemResourceRequest;
  v13 = -[SKUIResourceRequest copyWithZone:](&v15, sel_copyWithZone_, a3);
  objc_msgSend(v13, "setImageProfile:", self->_imageProfile);
  objc_msgSend(v13, "setItemIdentifiers:", self->_itemIdentifiers);
  objc_msgSend(v13, "setKeyProfile:", self->_keyProfile);
  return v13;
}

- (SKUIItemRequestDelegate)delegate
{
  return (SKUIItemRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)imageProfile
{
  return self->_imageProfile;
}

- (void)setImageProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)keyProfile
{
  return self->_keyProfile;
}

- (void)setKeyProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)finishWithResource:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)newLoadOperation
{
  OUTLINED_FUNCTION_1();
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
