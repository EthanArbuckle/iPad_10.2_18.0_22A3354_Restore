@implementation SKUIScreenshot

- (id)_initSKUIScreenshot
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  unint64_t v12;
  unint64_t v13;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIScreenshot _initSKUIScreenshot].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIScreenshot;
  result = -[SKUIScreenshot init](&v14, sel_init);
  if (result)
  {
    do
    {
      v12 = __ldxr(&_initSKUIScreenshot_sUniqueID);
      v13 = v12 + 1;
    }
    while (__stxr(v13, &_initSKUIScreenshot_sUniqueID));
    *((_QWORD *)result + 2) = v13;
  }
  return result;
}

- (SKUIScreenshot)initWithScreenshotDictionary:(id)a3
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
  SKUIScreenshot *v13;
  void *v14;
  uint64_t v15;
  NSString *orientation;
  NSMutableDictionary *v17;
  NSMutableDictionary *urls;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *sizes;
  void *v28;
  void *v29;
  double v30;
  int v31;
  NSMutableDictionary *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  int v37;
  NSMutableDictionary *v38;
  void *v39;
  void *v40;
  uint64_t i;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIScreenshot initWithScreenshotDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = -[SKUIScreenshot _initSKUIScreenshot](self, "_initSKUIScreenshot");
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("orientation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      orientation = v13->_orientation;
      v13->_orientation = (NSString *)v15;

    }
    v43 = v14;
    v46[0] = CFSTR("low-dpi");
    v46[1] = CFSTR("high-dpi");
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    urls = v13->_urls;
    v13->_urls = v17;

    v19 = 0;
    v20 = 1;
    do
    {
      v21 = v20;
      v22 = v46[v19];
      objc_msgSend(v4, "objectForKey:", v22, v43);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "objectForKey:", CFSTR("url"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v24);
          if (v25)
            -[NSMutableDictionary setObject:forKey:](v13->_urls, "setObject:forKey:", v25, v22);

        }
      }

      v20 = 0;
      v19 = 1;
    }
    while ((v21 & 1) != 0);
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sizes = v13->_sizes;
    v13->_sizes = v26;

    objc_msgSend(v4, "objectForKey:", CFSTR("width"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("height"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = (double)(int)objc_msgSend(v28, "intValue");
        v31 = objc_msgSend(v29, "intValue");
        v32 = v13->_sizes;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v30, (double)v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v33, CFSTR("low-dpi"));

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("width2x"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("height2x"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = (double)(int)objc_msgSend(v34, "intValue");
        v37 = objc_msgSend(v35, "intValue");
        v38 = v13->_sizes;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v36, (double)v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v38, "setObject:forKey:", v39, CFSTR("high-dpi"));

      }
    }
    v44[0] = CFSTR("url");
    v44[1] = CFSTR("url2x");
    v45[0] = CFSTR("low-dpi");
    v45[1] = CFSTR("high-dpi");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIScreenshot _addURLsFromDictionary:withRemoteLocalKeysMap:](v13, "_addURLsFromDictionary:withRemoteLocalKeysMap:", v4, v40);

    for (i = 1; i != -1; --i)
  }

  return v13;
}

- (int64_t)numberOfVariants
{
  return -[NSMutableDictionary count](self->_urls, "count");
}

- (void)setArtwork:(id)a3 forVariant:(id)a4
{
  id v6;
  double v7;
  double v8;
  __CFString *v9;
  NSString *orientation;
  NSMutableDictionary *sizes;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *urls;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = (double)objc_msgSend(v19, "width");
  v8 = (double)objc_msgSend(v19, "height");
  if (!-[SKUIScreenshot numberOfVariants](self, "numberOfVariants"))
  {
    v9 = CFSTR("portrait");
    orientation = self->_orientation;
    if (v7 > v8)
      v9 = CFSTR("landscape");
    self->_orientation = &v9->isa;

  }
  sizes = self->_sizes;
  if (!sizes)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = self->_sizes;
    self->_sizes = v12;

    sizes = self->_sizes;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sizes, "setObject:forKey:", v14, v6);

  urls = self->_urls;
  if (!urls)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = self->_urls;
    self->_urls = v16;

    urls = self->_urls;
  }
  objc_msgSend(v19, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](urls, "setObject:forKey:", v18, v6);

}

- (CGSize)sizeForVariant:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSMutableDictionary *sizes;
  void *v10;
  double v11;
  double v12;
  CGSize result;

  -[NSMutableDictionary objectForKey:](self->_sizes, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || -[NSMutableDictionary count](self->_sizes, "count")
    && (sizes = self->_sizes,
        -[SKUIScreenshot _firstVariant](self, "_firstVariant"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKey:](sizes, "objectForKey:", v10),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v4))
  {
    objc_msgSend(v4, "CGSizeValue");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)URLForVariant:(id)a3
{
  void *v4;
  NSMutableDictionary *urls;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->_urls, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (-[NSMutableDictionary count](self->_urls, "count"))
    {
      urls = self->_urls;
      -[SKUIScreenshot _firstVariant](self, "_firstVariant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](urls, "objectForKey:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_orientation, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSMutableDictionary mutableCopyWithZone:](self->_sizes, "mutableCopyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSMutableDictionary mutableCopyWithZone:](self->_urls, "mutableCopyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (SKUIScreenshot)initWithCacheRepresentation:(id)a3
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
  SKUIScreenshot *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *urls;
  _QWORD v18[4];
  SKUIScreenshot *v19;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIScreenshot initWithCacheRepresentation:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = -[SKUIScreenshot _initSKUIScreenshot](self, "_initSKUIScreenshot");
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("orient"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_orientation, v14);
    objc_msgSend(v4, "objectForKey:", CFSTR("urls"));
    self = (SKUIScreenshot *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      urls = v13->_urls;
      v13->_urls = v15;

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __46__SKUIScreenshot_initWithCacheRepresentation___block_invoke;
      v18[3] = &unk_1E73A53B0;
      v13 = v13;
      v19 = v13;
      -[SKUIScreenshot enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v18);

    }
    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

void __46__SKUIScreenshot_initWithCacheRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5);
      if (v6)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v6, v7);

    }
  }

}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  void *v4;
  NSString *orientation;
  id v6;
  NSMutableDictionary *urls;
  id v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  orientation = self->_orientation;
  if (orientation)
    objc_msgSend(v3, "setObject:forKey:", orientation, CFSTR("orient"));
  if (self->_urls)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    urls = self->_urls;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__SKUIScreenshot_cacheRepresentation__block_invoke;
    v10[3] = &unk_1E73A53D8;
    v11 = v6;
    v8 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](urls, "enumerateKeysAndObjectsUsingBlock:", v10);
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("urls"));

  }
  return (NSMutableDictionary *)v4;
}

void __37__SKUIScreenshot_cacheRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "absoluteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (void)_addURLsFromDictionary:(id)a3 withRemoteLocalKeysMap:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SKUIScreenshot *v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__SKUIScreenshot__addURLsFromDictionary_withRemoteLocalKeysMap___block_invoke;
  v8[3] = &unk_1E73A5400;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __64__SKUIScreenshot__addURLsFromDictionary_withRemoteLocalKeysMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5);
    if (v6)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", v6, v7);

  }
}

- (id)_firstVariant
{
  void *v2;
  void *v3;

  -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_urls, "keysSortedByValueUsingComparator:", &__block_literal_global_27);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __31__SKUIScreenshot__firstVariant__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSString)orientationString
{
  return self->_orientation;
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTemplate, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_orientation, 0);
}

- (void)_initSKUIScreenshot
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithScreenshotDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCacheRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
