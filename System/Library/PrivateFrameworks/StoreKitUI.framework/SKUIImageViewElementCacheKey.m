@implementation SKUIImageViewElementCacheKey

- (SKUIImageViewElementCacheKey)initWithURL:(id)a3 size:(CGSize)a4 imageTreatment:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SKUIImageViewElementCacheKey *v20;
  objc_super v22;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v12)
        -[SKUIImageViewElementCacheKey initWithURL:size:imageTreatment:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIImageViewElementCacheKey;
  v20 = -[SKUIImageViewElementCacheKey init](&v22, sel_init);
  if (v20)
  {
    v20->_imageTreatment = SKUIImageTreatmentForString(v11);
    v20->_size.width = width;
    v20->_size.height = height;
    objc_storeStrong((id *)&v20->_url, a3);
  }

  return v20;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_url, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SKUIImageViewElementCacheKey *v4;
  uint64_t v5;
  char v6;

  v4 = (SKUIImageViewElementCacheKey *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && *(uint64_t *)&self->_size.height == *(uint64_t *)&v4->_size.height
      && *(uint64_t *)&self->_size.width == *(uint64_t *)&v4->_size.width
      && self->_imageTreatment == v4->_imageTreatment)
    {
      v6 = -[NSURL isEqual:](self->_url, "isEqual:", v4->_url);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithURL:(uint64_t)a3 size:(uint64_t)a4 imageTreatment:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
