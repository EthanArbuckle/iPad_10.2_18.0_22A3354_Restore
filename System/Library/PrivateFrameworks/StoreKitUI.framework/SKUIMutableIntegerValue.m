@implementation SKUIMutableIntegerValue

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

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIMutableIntegerValue hash].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return ~self->_integerValue;
}

- (BOOL)isEqual:(id)a3
{
  SKUIMutableIntegerValue *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v4 = (SKUIMutableIntegerValue *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMutableIntegerValue isEqual:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    v13 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_integerValue == self->_integerValue;
  }

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
  void *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMutableIntegerValue copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v13, "setIntegerValue:", self->_integerValue);
  return v13;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (void)setIntegerValue:(int64_t)a3
{
  self->_integerValue = a3;
}

- (void)hash
{
  OUTLINED_FUNCTION_1();
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
