@implementation SKUIEntityProviderInvalidationContext

- (void)setInvalidateDataSourceCounts:(BOOL)a3
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
        -[SKUIEntityProviderInvalidationContext setInvalidateDataSourceCounts:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  self->_invalidateDataSourceCounts = a3;
}

- (void)setInvalidateEverything:(BOOL)a3
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
        -[SKUIEntityProviderInvalidationContext setInvalidateEverything:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  self->_invalidateEverything = a3;
}

- (BOOL)invalidateEverything
{
  return self->_invalidateEverything;
}

- (BOOL)invalidateDataSourceCounts
{
  return self->_invalidateDataSourceCounts;
}

- (void)setInvalidateDataSourceCounts:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setInvalidateEverything:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
