@implementation SKUIViewElementText

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4
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
  void *v16;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:textAlignment:](self, "attributedStringWithDefaultFont:foregroundColor:textAlignment:", v6, v7, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:textAlignment:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:textAlignment:style:](self, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v8, v9, a5, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 style:(id)a5
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
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v11)
        -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:style:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  -[IKTextParser attributedStringWithFont:foregroundColor:textAlignment:style:](self, "attributedStringWithFont:foregroundColor:textAlignment:style:", v8, v9, 0, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5 style:(id)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v13)
        -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:textAlignment:style:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  -[IKTextParser attributedStringWithFont:foregroundColor:textAlignment:style:](self, "attributedStringWithFont:foregroundColor:textAlignment:style:", v10, v11, a5, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)attributedStringWithDefaultFont:(uint64_t)a3 foregroundColor:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)attributedStringWithDefaultFont:(uint64_t)a3 foregroundColor:(uint64_t)a4 textAlignment:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)attributedStringWithDefaultFont:(uint64_t)a3 foregroundColor:(uint64_t)a4 style:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)attributedStringWithDefaultFont:(uint64_t)a3 foregroundColor:(uint64_t)a4 textAlignment:(uint64_t)a5 style:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
