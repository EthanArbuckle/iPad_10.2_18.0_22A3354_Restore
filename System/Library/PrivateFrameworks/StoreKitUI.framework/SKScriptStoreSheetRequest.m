@implementation SKScriptStoreSheetRequest

- (id)newNativeStorePageRequest
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  WebScriptObject *productParameters;
  BOOL v15;
  void *v16;
  void *v17;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKScriptStoreSheetRequest newNativeStorePageRequest].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = objc_alloc_init(MEMORY[0x1E0CD8060]);
  -[SUScriptObject webFrame](self, "webFrame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "globalContext");

  -[SUScriptObject lock](self, "lock");
  objc_msgSend(v11, "setProductPageStyle:", self->_pageStyle);
  productParameters = self->_productParameters;
  if (productParameters)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (!v15)
  {
    v16 = (void *)-[WebScriptObject copyArrayOrDictionaryWithContext:](productParameters, "copyArrayOrDictionaryWithContext:", v13);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v11, "setProductParameters:", v16);

  }
  if (self->_productURL)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", self->_productURL);
    objc_msgSend(v11, "setProductURL:", v17);

  }
  -[SUScriptObject unlock](self, "unlock");
  return v11;
}

- (id)_className
{
  return CFSTR("iTunesStoreSheetRequest");
}

- (int64_t)productPageStyle
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t pageStyle;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKScriptStoreSheetRequest productPageStyle].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SUScriptObject lock](self, "lock");
  pageStyle = self->_pageStyle;
  -[SUScriptObject unlock](self, "unlock");
  return pageStyle;
}

- (WebScriptObject)productParameters
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WebScriptObject *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKScriptStoreSheetRequest productParameters].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SUScriptObject lock](self, "lock");
  v11 = self->_productParameters;
  -[SUScriptObject unlock](self, "unlock");
  return v11;
}

- (NSString)productURL
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKScriptStoreSheetRequest productURL].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SUScriptObject lock](self, "lock");
  v11 = self->_productURL;
  -[SUScriptObject unlock](self, "unlock");
  return v11;
}

- (void)setProductPageStyle:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKScriptStoreSheetRequest setProductPageStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SUScriptObject lock](self, "lock");
  self->_pageStyle = a3;
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setProductParameters:(id)a3
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
  uint64_t v13;
  id v14;
  WebScriptObject *v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKScriptStoreSheetRequest setProductParameters:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = SKUIWebCoreFramework();
  v14 = SKUIWeakLinkedClassForString(CFSTR("WebScriptObject"), v13);
  -[SKScriptStoreSheetRequest _safeValueForValue:](self, "_safeValueForValue:", v4);
  v15 = (WebScriptObject *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v14, "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    -[SUScriptObject lock](self, "lock");
    if (self->_productParameters != v15)
      objc_storeStrong((id *)&self->_productParameters, v15);
    -[SUScriptObject unlock](self, "unlock");
  }

}

- (void)setProductURL:(id)a3
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
  NSString *v13;
  uint64_t v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKScriptStoreSheetRequest setProductURL:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKScriptStoreSheetRequest _safeValueForValue:](self, "_safeValueForValue:", v4);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = SKUIWebCoreFramework();
    objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("WebScriptObject"), v14), "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    -[SUScriptObject lock](self, "lock");
    if (self->_productURL != v13)
      objc_storeStrong((id *)&self->_productURL, v13);
    -[SUScriptObject unlock](self, "unlock");
  }

}

- (int64_t)productPageStyleAutomatic
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
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKScriptStoreSheetRequest productPageStyleAutomatic].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 0;
}

- (int64_t)productPageStyleBanner
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
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKScriptStoreSheetRequest productPageStyleBanner].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 1;
}

- (int64_t)productPageStylePad
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
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKScriptStoreSheetRequest productPageStylePad].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 3;
}

- (int64_t)productPageStylePhone
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
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKScriptStoreSheetRequest productPageStylePhone].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return 2;
}

- (id)_safeValueForValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (v4 = SKUIWebCoreFramework(),
        SKUIWeakLinkedClassForString(CFSTR("WebUndefined"), v4),
        v5 = v3,
        (objc_opt_isKindOfClass() & 1) != 0))
  {

    v5 = 0;
  }

  return v5;
}

+ (id)webScriptNameForKey:(const char *)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
  objc_msgSend((id)__KeyMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SKScriptStoreSheetRequest;
    objc_msgSendSuper2(&v8, sel_webScriptNameForKey_, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SKScriptStoreSheetRequest;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKScriptStoreSheetRequest;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("sheetStyle"), CFSTR("productPageStyle"), CFSTR("productParameters"), CFSTR("productParameters"), CFSTR("productURL"), CFSTR("productURL"), CFSTR("SHEET_STYLE_AUTOMATIC"), CFSTR("productPageStyleAutomatic"), CFSTR("SHEET_STYLE_BANNER"), CFSTR("productPageStyleBanner"), CFSTR("SHEET_STYLE_PAD"), CFSTR("productPageStylePad"), CFSTR("SHEET_STYLE_PHONE"), CFSTR("productPageStylePhone"), 0);
    v3 = (void *)__KeyMapping;
    __KeyMapping = v2;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_productParameters, 0);
}

- (void)newNativeStorePageRequest
{
  OUTLINED_FUNCTION_1();
}

- (void)productPageStyle
{
  OUTLINED_FUNCTION_1();
}

- (void)productParameters
{
  OUTLINED_FUNCTION_1();
}

- (void)productURL
{
  OUTLINED_FUNCTION_1();
}

- (void)setProductPageStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setProductParameters:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setProductURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)productPageStyleAutomatic
{
  OUTLINED_FUNCTION_1();
}

- (void)productPageStyleBanner
{
  OUTLINED_FUNCTION_1();
}

- (void)productPageStylePad
{
  OUTLINED_FUNCTION_1();
}

- (void)productPageStylePhone
{
  OUTLINED_FUNCTION_1();
}

@end
