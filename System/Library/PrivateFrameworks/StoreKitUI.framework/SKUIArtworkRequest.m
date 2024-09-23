@implementation SKUIArtworkRequest

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIArtworkRequest description].cold.1();
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIArtworkRequest URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; URL = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)cachesInMemory
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        -[SKUIArtworkRequest cachesInMemory].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

- (void)finishWithResource:(id)a3
{
  UIImage *v4;
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
  char v16;
  void *v17;
  void *v18;
  UIImage *v19;
  void *v20;
  void *v21;

  v4 = (UIImage *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIArtworkRequest finishWithResource:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "artworkRequest:didLoadImage:", self, v4);
  }
  else
  {
    -[SKUIArtworkRequest URL](self, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("x-apple-identity-image"));

    if ((v16 & 1) != 0)
    {
      v17 = (void *)MEMORY[0x1E0DC3870];
      UIImagePNGRepresentation(v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageWithData:", v18);
      v19 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = v4;
    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v19, CFSTR("SKUIArtworkRequestImageKey"), 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("SKUIArtworkRequestDidLoadImageNotification"), self, v20);

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
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUIArtworkRequest newLoadOperation].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return -[SKUILoadArtworkResourceOperation initWithResourceRequest:]([SKUILoadArtworkResourceOperation alloc], "initWithResourceRequest:", self);
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
  id *v13;
  id WeakRetained;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  objc_super v20;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIArtworkRequest copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIArtworkRequest;
  v13 = -[SKUIResourceRequest copyWithZone:](&v20, sel_copyWithZone_, a3);
  objc_storeStrong(v13 + 3, self->_dataConsumer);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak(v13 + 4, WeakRetained);

  v15 = -[NSString copyWithZone:](self->_imageName, "copyWithZone:", a3);
  v16 = v13[5];
  v13[5] = (id)v15;

  v17 = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  v18 = v13[6];
  v13[6] = (id)v17;

  return v13;
}

- (SSVURLDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (void)setDataConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_dataConsumer, a3);
}

- (SKUIArtworkRequestDelegate)delegate
{
  return (SKUIArtworkRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

- (void)description
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIArtworkRequest description]";
  OUTLINED_FUNCTION_1();
}

- (void)cachesInMemory
{
  OUTLINED_FUNCTION_1();
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
