@implementation PKCommonCachedImageFromURL

void __PKCommonCachedImageFromURL_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PKCommonCachedImageFromURL_block_invoke_2;
  block[3] = &unk_1E3E66418;
  v15 = v8;
  v16 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v18 = v9;
  v19 = v10;
  v17 = v7;
  v11 = v9;
  v12 = v7;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __PKCommonCachedImageFromURL_block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_4:
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0DC3870];
      if (qword_1ED06C668 != -1)
        dispatch_once(&qword_1ED06C668, &__block_literal_global_204);
      objc_msgSend(v4, "imageWithData:scale:", v3, *(double *)&qword_1ED06C660);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_15;
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 56);
        v14 = 138412546;
        v15 = v7;
        v16 = 2112;
        v17 = v8;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Failed to download card image from %@ due to %@", (uint8_t *)&v14, 0x16u);
      }

    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Could not parse card image from %@", (uint8_t *)&v14, 0xCu);
    }

    v5 = 0;
LABEL_15:
    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
      (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, 1, v5);
    goto LABEL_22;
  }
  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(v2, "statusCode") == 200)
  {

    goto LABEL_4;
  }
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v14 = 138412546;
    v15 = v12;
    v16 = 1024;
    LODWORD(v17) = objc_msgSend(v2, "statusCode");
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Could not download card image from %@ http status %d", (uint8_t *)&v14, 0x12u);
  }

  v13 = *(_QWORD *)(a1 + 64);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v13 + 16))(v13, 1, 0);

  v5 = 0;
LABEL_22:

}

@end
