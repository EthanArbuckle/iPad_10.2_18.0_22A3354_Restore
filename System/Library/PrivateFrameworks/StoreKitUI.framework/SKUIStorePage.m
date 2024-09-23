@implementation SKUIStorePage

- (void)setPageComponents:(id)a3
{
  NSArray *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *pageComponents;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStorePage setPageComponents:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_pageComponents != v4)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v4;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v19, "metricsElementName", (_QWORD)v23);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v19, "_setMetricsLocationPosition:", objc_msgSend(v13, "countForObject:", v20));
            objc_msgSend(v13, "addObject:", v20);
          }

        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }

    v21 = (NSArray *)-[NSArray copy](v14, "copy");
    pageComponents = self->_pageComponents;
    self->_pageComponents = v21;

  }
}

- (void)setValue:(id)a3 forPageKey:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *values;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIStorePage setValue:forPageKey:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  values = self->_values;
  if (v6)
  {
    if (!values)
    {
      v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = self->_values;
      self->_values = v17;

      values = self->_values;
    }
    -[NSMutableDictionary setObject:forKey:](values, "setObject:forKey:", v6, v7);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](values, "removeObjectForKey:", v7);
  }

}

- (id)valueForPageKey:(id)a3
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
  void *v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStorePage valueForPageKey:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[NSMutableDictionary objectForKey:](self->_values, "objectForKey:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIStorePage copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v13, "setBackgroundArtwork:", self->_backgroundArtwork);
  objc_msgSend(v13, "setITMLData:", self->_itmlData);
  objc_msgSend(v13, "setITMLResponse:", self->_itmlResponse);
  objc_msgSend(v13, "setMetricsConfiguration:", self->_metricsConfiguration);
  objc_msgSend(v13, "setMetricsPageDescription:", self->_metricsPageDescription);
  v14 = -[NSArray copyWithZone:](self->_pageComponents, "copyWithZone:", a3);
  v15 = (void *)v13[6];
  v13[6] = v14;

  objc_msgSend(v13, "setPageType:", self->_pageType);
  objc_msgSend(v13, "setPageURL:", self->_pageURL);
  objc_msgSend(v13, "setProductPage:", self->_productPage);
  objc_msgSend(v13, "setTitle:", self->_title);
  objc_msgSend(v13, "setUber:", self->_uber);
  v16 = -[NSMutableDictionary mutableCopyWithZone:](self->_values, "mutableCopyWithZone:", a3);
  v17 = (void *)v13[12];
  v13[12] = v16;

  return v13;
}

- (SKUIArtwork)backgroundArtwork
{
  return self->_backgroundArtwork;
}

- (void)setBackgroundArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundArtwork, a3);
}

- (NSData)ITMLData
{
  return self->_itmlData;
}

- (void)setITMLData:(id)a3
{
  objc_storeStrong((id *)&self->_itmlData, a3);
}

- (NSHTTPURLResponse)ITMLResponse
{
  return self->_itmlResponse;
}

- (void)setITMLResponse:(id)a3
{
  objc_storeStrong((id *)&self->_itmlResponse, a3);
}

- (SSMetricsConfiguration)metricsConfiguration
{
  return self->_metricsConfiguration;
}

- (void)setMetricsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_metricsConfiguration, a3);
}

- (NSString)metricsPageDescription
{
  return self->_metricsPageDescription;
}

- (void)setMetricsPageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)pageComponents
{
  return self->_pageComponents;
}

- (NSString)pageType
{
  return self->_pageType;
}

- (void)setPageType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SKUIProductPage)productPage
{
  return self->_productPage;
}

- (void)setProductPage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SKUIUber)uber
{
  return self->_uber;
}

- (void)setUber:(id)a3
{
  objc_storeStrong((id *)&self->_uber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_uber, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_pageComponents, 0);
  objc_storeStrong((id *)&self->_metricsPageDescription, 0);
  objc_storeStrong((id *)&self->_metricsConfiguration, 0);
  objc_storeStrong((id *)&self->_itmlResponse, 0);
  objc_storeStrong((id *)&self->_itmlData, 0);
  objc_storeStrong((id *)&self->_backgroundArtwork, 0);
}

- (void)setPageComponents:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setValue:(uint64_t)a3 forPageKey:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)valueForPageKey:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
