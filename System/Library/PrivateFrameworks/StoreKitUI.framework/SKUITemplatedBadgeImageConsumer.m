@implementation SKUITemplatedBadgeImageConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUITemplatedBadgeImageConsumer objectForData:response:error:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUITemplatedBadgeImageConsumer;
  -[SKUIImageDataConsumer objectForData:response:error:](&v16, sel_objectForData_response_error_, v8, v9, a5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[SKUITemplatedBadgeImageConsumer templateColor](self, "templateColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SKUITemplatedBadgeImageConsumer templateColor](self, "templateColor");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_flatImageWithColor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    else
    {
      -[SKUIImageDataConsumer imageForImage:](self, "imageForImage:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (UIColor)templateColor
{
  return self->_templateColor;
}

- (void)setTemplateColor:(id)a3
{
  objc_storeStrong((id *)&self->_templateColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateColor, 0);
}

- (void)objectForData:response:error:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITemplatedBadgeImageConsumer objectForData:response:error:]";
}

@end
