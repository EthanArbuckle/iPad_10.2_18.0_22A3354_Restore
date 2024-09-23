@implementation NSURL

void __57__NSURL_WebPrivacyExtras___wp_removeTrackingInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSURL *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = WPOSLogAPI();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__NSURL_WebPrivacyExtras___wp_removeTrackingInformation___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = *(_QWORD *)(a1 + 40);
  WebPrivacy::filterUsingCachedParameters(*(WebPrivacy **)(a1 + 32), v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

}

void __57__NSURL_WebPrivacyExtras___wp_removeTrackingInformation___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24A44A000, a2, a3, "Error updating known tracking parameters: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

@end
