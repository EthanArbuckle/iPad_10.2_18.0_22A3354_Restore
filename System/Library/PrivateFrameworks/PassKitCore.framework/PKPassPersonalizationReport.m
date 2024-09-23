@implementation PKPassPersonalizationReport

void __PKPassPersonalizationReport_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = (uint64_t)v8;
      v10 = "Merchant Services Pass Personalization Report Error %@";
LABEL_7:
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v11 = objc_msgSend(v7, "statusCode");
  if (v11 != 200)
  {
    v12 = v11;
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v12;
      v10 = "Merchant Services Pass Personalization Report received failure status: %ld";
      goto LABEL_7;
    }
LABEL_8:

  }
}

@end
