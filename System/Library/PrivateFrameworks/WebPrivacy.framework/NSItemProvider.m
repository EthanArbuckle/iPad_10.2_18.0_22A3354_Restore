@implementation NSItemProvider

id __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_2;
  v10[3] = &unk_251BCEE90;
  v13 = v5;
  v6 = *(void **)(a1 + 32);
  v11 = v6;
  v12 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(v6, "loadWithOptions_v2:completionHandler:", a2, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "typeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v6, "objectWithItemProviderData:typeIdentifier:error:", v7, v8, &v30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v30;
    v11 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (v12)
    {
      objc_msgSend(v12, "scheme");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("http")) & 1) != 0
        || (objc_msgSend(v21, "isEqualToString:", CFSTR("https")) & 1) != 0)
      {
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_8;
        v26[3] = &unk_251BCEE68;
        v29 = a1[6];
        v27 = v3;
        v28 = a1[5];
        objc_msgSend(v12, "_wp_removeTrackingInformation:", v26);

      }
      else
      {
        v23 = WPOSLogAPI();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24A44A000, v23, OS_LOG_TYPE_INFO, "Skipping URL returned from item provider (scheme is not HTTP-family)", buf, 2u);
        }
        (*((void (**)(void))a1[6] + 2))();
      }

    }
    else
    {
      v22 = (id)WPOSLogAPI();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "data");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "length");
        *(_DWORD *)buf = 134218242;
        v32 = v25;
        v33 = 2112;
        v34 = v10;
        _os_log_error_impl(&dword_24A44A000, v22, OS_LOG_TYPE_ERROR, "Failed to deserialize NSURL from item provider data (%zu bytes) with error: %@", buf, 0x16u);

      }
      (*((void (**)(void))a1[6] + 2))();
    }

  }
  else
  {
    v13 = WPOSLogAPI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_2_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  if (v3)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_9;
    v14[3] = &unk_251BCEE40;
    v4 = *(_QWORD *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 32);
    v5 = (id)objc_msgSend(v3, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v4, v14);

  }
  else
  {
    v6 = WPOSLogAPI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_8_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "length"))
  {
    v7 = WPOSLogAPI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_9_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyWithData:urlWrapper:cleanupHandler:error:", v5, 0, 0, 0);
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_24A44A000, a1, a3, "Failed to deserialize NSURL from item provider data (no data)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_8_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_24A44A000, a1, a3, "Failed to retrieve filtered NSURL in item provider", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __86__NSItemProvider_WebPrivacyExtras___wp_removeTrackingInformationFromURLRepresentation__block_invoke_9_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24A44A000, a2, a3, "Failed to reserialize filtered NSURL in item provider with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

@end
