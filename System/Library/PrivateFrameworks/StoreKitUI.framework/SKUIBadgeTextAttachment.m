@implementation SKUIBadgeTextAttachment

- (SKUIBadgeTextAttachment)initWithViewElement:(id)a3
{
  id v4;
  SKUIBadgeTextAttachment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSURL *imageURL;
  double v13;
  double v14;
  double v15;
  double v16;
  dispatch_semaphore_t v17;
  _QWORD v19[4];
  SKUIBadgeTextAttachment *v20;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIBadgeTextAttachment initWithViewElement:].cold.1();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIBadgeTextAttachment;
  v5 = -[SKUIBadgeTextAttachment init](&v24, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "badgeType"))
    {
      v6 = v5;
      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "fallbackImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resourceName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "style");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ikColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "URL");
      v11 = objc_claimAutoreleasedReturnValue();
      imageURL = v5->_imageURL;
      v5->_imageURL = (NSURL *)v11;

      v13 = *MEMORY[0x1E0C9D648];
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      objc_msgSend(v4, "size");
      -[SKUIBadgeTextAttachment setBounds:](v5, "setBounds:", v13, v14, v15, v16);
      if (v7 && !objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        v17 = dispatch_semaphore_create(0);
        -[SKUIBadgeTextAttachment setImageLoadingSemaphore:](v5, "setImageLoadingSemaphore:", v17);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __47__SKUIBadgeTextAttachment_initWithViewElement___block_invoke;
        v19[3] = &unk_1E73A1350;
        v20 = v5;
        v21 = v7;
        v22 = v6;
        v23 = v10;
        dispatch_async(MEMORY[0x1E0C80D38], v19);

      }
      else
      {
        -[SKUIBadgeTextAttachment _loadImageWithResourceName:fallbackImage:styleColor:](v5, "_loadImageWithResourceName:fallbackImage:styleColor:", v7, v6, v10);
      }

    }
  }

  return v5;
}

uint64_t __47__SKUIBadgeTextAttachment_initWithViewElement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadImageWithResourceName:fallbackImage:styleColor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  -[SKUIBadgeTextAttachment _ensureImageIsLoaded](self, "_ensureImageIsLoaded");
  v3 = -[NSURL hash](self->_imageURL, "hash");
  -[SKUIBadgeTextAttachment bounds](self, "bounds");
  v8 = (unint64_t)((double)(unint64_t)((double)(unint64_t)((double)(unint64_t)((double)v3 + v4 * 10.0)
                                                                              + v5 * 100.0)
                                                   + v6 * 1000.0)
                        + v7 * 10000.0);
  -[SKUIBadgeTextAttachment image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 + 100000 * objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SKUIBadgeTextAttachment *v4;
  SKUIBadgeTextAttachment *v5;
  NSURL *imageURL;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  char v21;
  CGRect v23;
  CGRect v24;

  v4 = (SKUIBadgeTextAttachment *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      imageURL = self->_imageURL;
      if (imageURL != v5->_imageURL && !-[NSURL isEqual:](imageURL, "isEqual:"))
        goto LABEL_10;
      -[SKUIBadgeTextAttachment bounds](self, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[SKUIBadgeTextAttachment bounds](v5, "bounds");
      v24.origin.x = v15;
      v24.origin.y = v16;
      v24.size.width = v17;
      v24.size.height = v18;
      v23.origin.x = v8;
      v23.origin.y = v10;
      v23.size.width = v12;
      v23.size.height = v14;
      if (CGRectEqualToRect(v23, v24))
      {
        -[SKUIBadgeTextAttachment _ensureImageIsLoaded](self, "_ensureImageIsLoaded");
        -[SKUIBadgeTextAttachment _ensureImageIsLoaded](v5, "_ensureImageIsLoaded");
        -[SKUIBadgeTextAttachment image](self, "image");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIBadgeTextAttachment image](v5, "image");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 == v20)
          v21 = 1;
        else
          v21 = objc_msgSend(v19, "isEqual:", v20);

      }
      else
      {
LABEL_10:
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKUIBadgeTextAttachment *v4;
  void *v5;

  -[SKUIBadgeTextAttachment _ensureImageIsLoaded](self, "_ensureImageIsLoaded", a3);
  v4 = objc_alloc_init(SKUIBadgeTextAttachment);
  objc_storeStrong((id *)&v4->_imageURL, self->_imageURL);
  -[SKUIBadgeTextAttachment bounds](self, "bounds");
  -[SKUIBadgeTextAttachment setBounds:](v4, "setBounds:");
  -[SKUIBadgeTextAttachment image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIBadgeTextAttachment setImage:](v4, "setImage:", v5);

  return v4;
}

- (CGSize)badgeSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[SKUIBadgeTextAttachment bounds](self, "bounds");
  v5 = v4;
  v6 = v3;
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[SKUIBadgeTextAttachment image](self, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "size");
      v5 = v10;
      v6 = v11;
    }

  }
  v12 = v5;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_ensureImageIsLoaded
{
  NSObject *v2;
  NSObject *v3;

  -[SKUIBadgeTextAttachment imageLoadingSemaphore](self, "imageLoadingSemaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    v2 = v3;
  }

}

- (void)_loadImageWithResourceName:(id)a3 fallbackImage:(id)a4 styleColor:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (!v15)
    goto LABEL_14;
  SKUIImageWithResourceName(v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 && objc_msgSend(v10, "renderingMode") == 2)
  {
    objc_msgSend(v11, "_flatImageWithColor:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v12;
  }
  if (!v11)
  {
LABEL_14:
    if (self->_imageURL)
      v11 = 0;
    else
      v11 = v8;
  }
  -[SKUIBadgeTextAttachment setImage:](self, "setImage:", v11);
  -[SKUIBadgeTextAttachment imageLoadingSemaphore](self, "imageLoadingSemaphore");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    dispatch_semaphore_signal(v13);
    -[SKUIBadgeTextAttachment setImageLoadingSemaphore:](self, "setImageLoadingSemaphore:", 0);
  }

}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (OS_dispatch_semaphore)imageLoadingSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 128, 1);
}

- (void)setImageLoadingSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoadingSemaphore, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

- (void)initWithViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBadgeTextAttachment initWithViewElement:]";
}

@end
