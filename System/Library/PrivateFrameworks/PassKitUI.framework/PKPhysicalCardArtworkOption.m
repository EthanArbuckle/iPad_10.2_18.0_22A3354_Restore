@implementation PKPhysicalCardArtworkOption

void __59__PKPhysicalCardArtworkOption_PKUIUtilities__artworkImage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66DF8]), "initWithCGImage:scale:orientation:", objc_msgSend(objc_retainAutorelease(v6), "CGImage"), 1, PKUIScreenScale());
    objc_msgSend(v3, "setFrontFaceImage:", v4);

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 1, v6);

}

void __79__PKPhysicalCardArtworkOption_PKUIUtilities___downloadImageFromURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_4:
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:scale:", v7, PKUIScreenScale());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_13:
        v15 = *(_QWORD *)(a1 + 40);
        if (v15)
          (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v11);
        goto LABEL_20;
      }
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v19 = 138412546;
        v20 = v13;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Failed to download card image from %@ due to %@", (uint8_t *)&v19, 0x16u);
      }

    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v19 = 138412290;
      v20 = v14;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Could not parse card image from %@", (uint8_t *)&v19, 0xCu);
    }

    v11 = 0;
    goto LABEL_13;
  }
  v10 = v8;
  if (objc_msgSend(v10, "statusCode") == 200)
  {

    goto LABEL_4;
  }
  PKLogFacilityTypeGetObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v19 = 138412546;
    v20 = v17;
    v21 = 1024;
    LODWORD(v22) = objc_msgSend(v10, "statusCode");
    _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Could not download card image from %@ http status %d", (uint8_t *)&v19, 0x12u);
  }

  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);

  v11 = 0;
LABEL_20:

}

@end
