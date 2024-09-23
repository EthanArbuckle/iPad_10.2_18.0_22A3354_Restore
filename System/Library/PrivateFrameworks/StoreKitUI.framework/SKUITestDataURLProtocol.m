@implementation SKUITestDataURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUITestDataURLProtocol canInitWithRequest:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = (void *)MEMORY[0x1BCCE6C7C]();
  objc_msgSend(v3, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v13) = objc_msgSend(v14, "isEqualToString:", CFSTR("x-apple-storekitui-test-data"));
  objc_autoreleasePoolPop(v12);

  return (char)v13;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUITestDataURLProtocol canonicalRequestForRequest:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUITestDataURLProtocol requestIsCacheEquivalent:toRequest:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  return 0;
}

- (void)startLoading
{
  OUTLINED_FUNCTION_1();
}

+ (void)canInitWithRequest:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)canonicalRequestForRequest:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestIsCacheEquivalent:(uint64_t)a3 toRequest:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
