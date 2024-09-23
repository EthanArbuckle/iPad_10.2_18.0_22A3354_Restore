@implementation SKUILibraryItem

- (NSNumber)storeItemIdentifier
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUILibraryItem storeItemIdentifier].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUILibraryItem storeIdentifier](self, "storeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v12;
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
  id v16;
  void *v17;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUILibraryItem copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = -[NSString copyWithZone:](self->_storeFlavorIdentifier, "copyWithZone:", a3);
  v15 = (void *)v13[2];
  v13[2] = v14;

  v16 = -[SKUIStoreIdentifier copyWithZone:](self->_storeIdentifier, "copyWithZone:", a3);
  v17 = (void *)v13[1];
  v13[1] = v16;

  return v13;
}

- (id)description
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUILibraryItem description].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)SKUILibraryItem;
  -[SKUILibraryItem description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@, %@]"), v12, self->_storeIdentifier, self->_storeFlavorIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)hash
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  unint64_t v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUILibraryItem hash].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUILibraryItem storeItemIdentifier](self, "storeItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = -[NSString hash](self->_storeFlavorIdentifier, "hash") ^ v12;
  v14 = v13 ^ -[SKUIStoreIdentifier hash](self->_storeIdentifier, "hash");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  SKUIStoreIdentifier *storeIdentifier;
  NSString *storeFlavorIdentifier;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUILibraryItem isEqual:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_opt_class();
  if (v13 == objc_opt_class()
    && (storeIdentifier = self->_storeIdentifier) != 0
    && (storeIdentifier == (SKUIStoreIdentifier *)v4[1] || -[SKUIStoreIdentifier isEqual:](storeIdentifier, "isEqual:")))
  {
    storeFlavorIdentifier = self->_storeFlavorIdentifier;
    if (storeFlavorIdentifier == (NSString *)v4[2])
      v14 = 1;
    else
      v14 = -[NSString isEqualToString:](storeFlavorIdentifier, "isEqualToString:");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (SKUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)storeFlavorIdentifier
{
  return self->_storeFlavorIdentifier;
}

- (void)setStoreFlavorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFlavorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

- (void)storeItemIdentifier
{
  OUTLINED_FUNCTION_1();
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)description
{
  OUTLINED_FUNCTION_1();
}

- (void)hash
{
  OUTLINED_FUNCTION_1();
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
