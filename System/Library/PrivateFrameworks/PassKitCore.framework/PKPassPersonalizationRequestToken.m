@implementation PKPassPersonalizationRequestToken

void __PKPassPersonalizationRequestToken_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (*(_QWORD *)(a1 + 32))
  {
    v11 = v9;
    v12 = (uint64_t)v11;
    if (v11)
    {
      v13 = 0;
      v14 = v11;
    }
    else
    {
      v16 = objc_msgSend(v8, "statusCode");
      if (v16 != 200)
      {
        v18 = v16;
        PKLogFacilityTypeGetObject(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v21 = v18;
          _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Merchant Services Pass Personalization Token Request received failure status: %ld", buf, 0xCu);
        }
        v13 = 0;
        v14 = 0;
        goto LABEL_14;
      }
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      objc_opt_class();
      v13 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("personalizationToken"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (!v14)
        goto LABEL_15;
    }
    PKLogFacilityTypeGetObject(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Merchant Services Pass Personalization Token Request Error: %@", buf, 0xCu);
    }
LABEL_14:

LABEL_15:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __PKPassPersonalizationRequestToken_block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  }
}

@end
