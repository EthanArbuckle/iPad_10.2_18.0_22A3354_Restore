@implementation PopulateArtworkForItems

void ___PopulateArtworkForItems_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = ___PopulateArtworkForItems_block_invoke_2;
  v21[3] = &unk_1E3E7A4A8;
  v13 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v22 = v7;
  v23 = v12;
  v24 = v8;
  v25 = v9;
  v14 = v8;
  v15 = v9;
  v16 = v7;
  objc_msgSend(v10, "dataTaskWithURL:completionHandler:", v13, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "resume");
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = ___PopulateArtworkForItems_block_invoke_143;
  v19[3] = &unk_1E3E612E8;
  v20 = v17;
  v18 = v17;
  objc_msgSend(v16, "addCancelAction:", v19);

}

void ___PopulateArtworkForItems_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9 || (objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) != 0)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKAMSMediaItemsService: Failed to download artwork for %@ with error: %@", (uint8_t *)&v13, 0x16u);

    }
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "type") <= 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "musicItem");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject setArtwork:](v11, "setArtwork:", v7);
LABEL_8:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t ___PopulateArtworkForItems_block_invoke_143(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t ___PopulateArtworkForItems_block_invoke_2_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
