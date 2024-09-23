@implementation SKUIImageViewElement

- (SKUIImageViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKUIImageViewElement *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSURL *url;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  NSString *resourceName;
  NSURL *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  uint64_t v35;
  NSString *alt;
  void *v37;
  char v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(_QWORD *, void *, uint64_t, BOOL *);
  void *v43;
  id v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[4];
  objc_super v54;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v11)
        -[SKUIImageViewElement initWithDOMElement:parent:elementFactory:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v54.receiver = self;
  v54.super_class = (Class)SKUIImageViewElement;
  v19 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v54, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v19)
  {
    if (initWithDOMElement_parent_elementFactory__sOnce != -1)
      dispatch_once(&initWithDOMElement_parent_elementFactory__sOnce, &__block_literal_global_3);
    objc_msgSend(v8, "getAttribute:", CFSTR("srcset"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v21);
      url = v19->_url;
      v19->_url = (NSURL *)v22;

    }
    else if (objc_msgSend(v20, "length"))
    {
      v53[0] = 0;
      v53[1] = v53;
      v53[2] = 0x2020000000;
      v53[3] = 0;
      v47 = 0;
      v48 = &v47;
      v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__9;
      v51 = __Block_byref_object_dispose__9;
      v52 = 0;
      v24 = (void *)initWithDOMElement_parent_elementFactory__sSrcSetRegularExpression;
      v25 = objc_msgSend(v20, "length");
      v40 = MEMORY[0x1E0C809B0];
      v41 = 3221225472;
      v42 = __65__SKUIImageViewElement_initWithDOMElement_parent_elementFactory___block_invoke_11;
      v43 = &unk_1E73A2128;
      v44 = v20;
      v45 = v53;
      v46 = &v47;
      objc_msgSend(v24, "enumerateMatchesInString:options:range:usingBlock:", v44, 0, 0, v25, &v40);
      objc_storeStrong((id *)&v19->_url, (id)v48[5]);

      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(v53, 8);
    }
    -[NSURL scheme](v19->_url, "scheme", v40, v41, v42, v43);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("resource"));

    if (v27)
    {
      -[NSURL host](v19->_url, "host");
      v28 = objc_claimAutoreleasedReturnValue();
      resourceName = v19->_resourceName;
      v19->_resourceName = (NSString *)v28;

      v30 = v19->_url;
      v19->_url = 0;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("height"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("width"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "length") && objc_msgSend(v32, "length"))
    {
      objc_msgSend(v31, "doubleValue");
      v19->_size.height = v33;
      objc_msgSend(v32, "doubleValue");
      v19->_size.width = v34;
    }
    objc_msgSend(v8, "getAttribute:", CFSTR("alt"));
    v35 = objc_claimAutoreleasedReturnValue();
    alt = v19->_alt;
    v19->_alt = (NSString *)v35;

    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "length"))
      v38 = objc_msgSend(v37, "BOOLValue") ^ 1;
    else
      v38 = -1;
    v19->_enabled = v38;

  }
  return v19;
}

void __65__SKUIImageViewElement_initWithDOMElement_parent_elementFactory___block_invoke()
{
  void *v0;
  double v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  initWithDOMElement_parent_elementFactory__sScreenScale = (uint64_t)v1;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("([^ ,]+) +([^,]+)"), 0, 0);
  v3 = (void *)initWithDOMElement_parent_elementFactory__sSrcSetRegularExpression;
  initWithDOMElement_parent_elementFactory__sSrcSetRegularExpression = v2;

}

void __65__SKUIImageViewElement_initWithDOMElement_parent_elementFactory___block_invoke_11(_QWORD *a1, void *a2, uint64_t a3, BOOL *a4)
{
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v6 = objc_msgSend(v20, "numberOfRanges") == 3;
  v7 = v20;
  if (v6)
  {
    v8 = (void *)a1[4];
    v9 = objc_msgSend(v20, "rangeAtIndex:", 2);
    objc_msgSend(v8, "substringWithRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v13 = objc_alloc(MEMORY[0x1E0C99E98]);
    v14 = (void *)a1[4];
    v15 = objc_msgSend(v20, "rangeAtIndex:", 1);
    objc_msgSend(v14, "substringWithRange:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v13, "initWithString:", v17);

    if (v18)
    {
      v19 = *(_QWORD *)(a1[5] + 8);
      if (v12 > *(_QWORD *)(v19 + 24))
      {
        *(_QWORD *)(v19 + 24) = v12;
        objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v18);
        *a4 = v12 == initWithDOMElement_parent_elementFactory__sScreenScale;
      }
    }

    v7 = v20;
  }

}

- (id)resourceCacheKey
{
  SKUIImageViewElementCacheKey *resourceCacheKey;
  SKUIImageViewElementCacheKey *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  SKUIImageViewElementCacheKey *v12;
  SKUIImageViewElementCacheKey *v13;

  resourceCacheKey = self->_resourceCacheKey;
  if (!resourceCacheKey)
  {
    v4 = [SKUIImageViewElementCacheKey alloc];
    -[SKUIImageViewElement URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIImageViewElement size](self, "size");
    v7 = v6;
    v9 = v8;
    -[SKUIImageViewElement style](self, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageTreatment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SKUIImageViewElementCacheKey initWithURL:size:imageTreatment:](v4, "initWithURL:size:imageTreatment:", v5, v11, v7, v9);
    v13 = self->_resourceCacheKey;
    self->_resourceCacheKey = v12;

    resourceCacheKey = self->_resourceCacheKey;
  }
  return resourceCacheKey;
}

- (CGSize)size
{
  double height;
  double width;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  double v10;
  double v11;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  -[SKUIImageViewElement style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxWidth");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "floatValue");
    height = v8;
    objc_msgSend(v7, "floatValue");
    width = v9;
  }

  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)accessibilityText
{
  NSString *alt;
  objc_super v4;

  alt = self->_alt;
  if (alt)
    return alt;
  v4.receiver = self;
  v4.super_class = (Class)SKUIImageViewElement;
  -[SKUIImageViewElement accessibilityText](&v4, sel_accessibilityText);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIImageViewElement *v4;
  SKUIImageViewElement *v5;
  SKUIImageViewElement *v6;
  SKUIImageViewElementCacheKey *v7;
  NSURL *v8;
  CGSize *p_size;
  void *url;
  void *v11;
  uint64_t v12;
  SKUIImageViewElementCacheKey *transientResourceCacheKey;
  NSString *v14;
  NSString *alt;
  SKUIImageViewElementCacheKey *resourceCacheKey;
  NSString *v17;
  NSString *resourceName;
  CGFloat v19;
  CGFloat v20;
  NSURL *v21;
  objc_super v23;

  v4 = (SKUIImageViewElement *)a3;
  v23.receiver = self;
  v23.super_class = (Class)SKUIImageViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v23, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIImageViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
  {
    if (v4 != self && v4)
    {
      v14 = (NSString *)-[NSString copy](v4->_alt, "copy");
      alt = self->_alt;
      self->_alt = v14;

      resourceCacheKey = self->_resourceCacheKey;
      self->_resourceCacheKey = 0;

      -[SKUIImageViewElement resourceName](v4, "resourceName");
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      resourceName = self->_resourceName;
      self->_resourceName = v17;

      -[SKUIImageViewElement size](v4, "size");
      self->_size.width = v19;
      self->_size.height = v20;
      -[SKUIImageViewElement URL](v4, "URL");
      v21 = (NSURL *)objc_claimAutoreleasedReturnValue();
      url = self->_url;
      self->_url = v21;
      goto LABEL_7;
    }
  }
  else if ((-[NSURL isEqual:](v5->_url, "isEqual:", self->_url) & 1) == 0)
  {
    v7 = [SKUIImageViewElementCacheKey alloc];
    v8 = self->_url;
    p_size = &self->_size;
    -[SKUIImageViewElement style](self, "style");
    url = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(url, "imageTreatment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SKUIImageViewElementCacheKey initWithURL:size:imageTreatment:](v7, "initWithURL:size:imageTreatment:", v8, v11, p_size->width, p_size->height);
    transientResourceCacheKey = v6->_transientResourceCacheKey;
    v6->_transientResourceCacheKey = (SKUIImageViewElementCacheKey *)v12;

LABEL_7:
  }

  return v6;
}

- (id)entityValueProperties
{
  void *v2;
  void *v3;
  void *v4;

  -[SKUIImageViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("valueProperty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)entityValueProviderDidChange
{
  NSString *entityResourceName;
  NSURL *entityURL;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIImageViewElement;
  -[SKUIViewElement entityValueProviderDidChange](&v5, sel_entityValueProviderDidChange);
  self->_hasValidEntityValues = 0;
  entityResourceName = self->_entityResourceName;
  self->_entityResourceName = 0;

  entityURL = self->_entityURL;
  self->_entityURL = 0;

}

- (BOOL)isEnabled
{
  int enabled;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  -[SKUIImageViewElement style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageTreatment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SKUIImageTreatmentForString(v5);

  if (v6 == 8)
    return 0;
  -[SKUIImageViewElement style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageTreatment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SKUIImageTreatmentForString(v8);

  if (v9 == 9)
    return 0;
  v11.receiver = self;
  v11.super_class = (Class)SKUIImageViewElement;
  return -[SKUIViewElement isEnabled](&v11, sel_isEnabled);
}

- (int64_t)pageComponentType
{
  return 24;
}

- (BOOL)rendersWithPerspective
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[SKUIImageViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageTreatment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SKUIImageTreatmentForString(v3);

  return v4 == 7;
}

- (BOOL)rendersWithParallax
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[SKUIImageViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageTreatment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SKUIImageTreatmentForString(v3);

  return v4 == 13;
}

- (id)uniquingMapKey
{
  NSURL *entityURL;
  NSURL *v4;
  objc_super v6;

  -[SKUIImageViewElement _loadEntityValuesIfNeeded](self, "_loadEntityValuesIfNeeded");
  entityURL = self->_entityURL;
  if (entityURL || (entityURL = (NSURL *)self->_entityResourceName) != 0)
  {
    v4 = entityURL;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SKUIImageViewElement;
    -[SKUIViewElement uniquingMapKey](&v6, sel_uniquingMapKey);
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSString)resourceName
{
  NSString *entityResourceName;

  -[SKUIImageViewElement _loadEntityValuesIfNeeded](self, "_loadEntityValuesIfNeeded");
  entityResourceName = self->_entityResourceName;
  if (!entityResourceName)
    entityResourceName = self->_resourceName;
  return entityResourceName;
}

- (NSURL)URL
{
  NSURL *entityURL;

  -[SKUIImageViewElement _loadEntityValuesIfNeeded](self, "_loadEntityValuesIfNeeded");
  entityURL = self->_entityURL;
  if (!entityURL)
    entityURL = self->_url;
  return entityURL;
}

- (void)_loadEntityValuesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  NSURL *v8;
  void *v9;
  int v10;
  NSString *v11;
  NSURL *entityURL;
  NSString *entityResourceName;
  NSString *v14;
  SKUIImageViewElementCacheKey *resourceCacheKey;
  NSURL *v16;

  if (!self->_hasValidEntityValues)
  {
    self->_hasValidEntityValues = 1;
    -[SKUIViewElement entityValueProvider](self, "entityValueProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[SKUIImageViewElement attributes](self, "attributes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("valueProperty"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "scale");
        objc_msgSend(v3, "imageURLForEntityArtworkProperty:fittingSize:destinationScale:", v5, self->_size.width, self->_size.height, v7);
        v8 = (NSURL *)objc_claimAutoreleasedReturnValue();

        -[NSURL scheme](v8, "scheme");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("resource"));

        if (v10)
        {
          -[NSURL host](v8, "host");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
        v8 = 0;
      }

    }
    else
    {
      v11 = 0;
      v8 = 0;
    }
    entityURL = self->_entityURL;
    self->_entityURL = v8;
    v16 = v8;

    entityResourceName = self->_entityResourceName;
    self->_entityResourceName = v11;
    v14 = v11;

    resourceCacheKey = self->_resourceCacheKey;
    self->_resourceCacheKey = 0;

  }
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (id)transientResourceCacheKey
{
  return self->_transientResourceCacheKey;
}

- (float)layerShadowOpacity
{
  return self->_layerShadowOpacity;
}

- (void)setLayerShadowOpacity:(float)a3
{
  self->_layerShadowOpacity = a3;
}

- (CGSize)layerShadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_layerShadowOffset.width;
  height = self->_layerShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLayerShadowOffset:(CGSize)a3
{
  self->_layerShadowOffset = a3;
}

- (double)layerShadowRadius
{
  return self->_layerShadowRadius;
}

- (void)setLayerShadowRadius:(double)a3
{
  self->_layerShadowRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_transientResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_resourceCacheKey, 0);
  objc_storeStrong((id *)&self->_entityURL, 0);
  objc_storeStrong((id *)&self->_entityResourceName, 0);
  objc_storeStrong((id *)&self->_alt, 0);
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
