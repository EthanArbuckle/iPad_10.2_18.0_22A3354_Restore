@implementation SKUIStorePageItemPinningConfiguration

- (void)setPinningContentInset:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIStorePageItemPinningConfiguration setPinningContentInset:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  self->_pinningContentInset.top = top;
  self->_pinningContentInset.left = left;
  self->_pinningContentInset.bottom = bottom;
  self->_pinningContentInset.right = right;
  self->_hasValidPinningContentInset = 1;
}

- (void)setPinningStyle:(int64_t)a3
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
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIStorePageItemPinningConfiguration setPinningStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  self->_pinningStyle = a3;
  self->_hasValidPinningStyle = 1;
}

- (void)setPinningGroup:(int64_t)a3
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
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUIStorePageItemPinningConfiguration setPinningGroup:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  self->_pinningGroup = a3;
  self->_hasValidPinningGroup = 1;
}

- (void)setPinningTransitionStyle:(int64_t)a3
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
        -[SKUIStorePageItemPinningConfiguration setPinningTransitionStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  self->_pinningTransitionStyle = a3;
  self->_hasValidPinningTransitionStyle = 1;
}

- (void)invalidatePinningContentInset
{
  OUTLINED_FUNCTION_1();
}

- (void)invalidatePinningStyle
{
  OUTLINED_FUNCTION_1();
}

- (void)invalidatePinningGroup
{
  OUTLINED_FUNCTION_1();
}

- (void)invalidatePinningTransitionStyle
{
  OUTLINED_FUNCTION_1();
}

- (UIEdgeInsets)pinningContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_pinningContentInset.top;
  left = self->_pinningContentInset.left;
  bottom = self->_pinningContentInset.bottom;
  right = self->_pinningContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)hasValidPinningContentInset
{
  return self->_hasValidPinningContentInset;
}

- (int64_t)pinningStyle
{
  return self->_pinningStyle;
}

- (int64_t)pinningGroup
{
  return self->_pinningGroup;
}

- (BOOL)hasValidPinningStyle
{
  return self->_hasValidPinningStyle;
}

- (BOOL)hasValidPinningGroup
{
  return self->_hasValidPinningGroup;
}

- (int64_t)pinningTransitionStyle
{
  return self->_pinningTransitionStyle;
}

- (BOOL)hasValidPinningTransitionStyle
{
  return self->_hasValidPinningTransitionStyle;
}

- (void)setPinningContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setPinningStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setPinningGroup:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setPinningTransitionStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
