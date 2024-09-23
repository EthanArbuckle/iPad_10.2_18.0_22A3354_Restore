@implementation LookupStoreApplications

void __LookupStoreApplications_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  _QWORD v44[4];
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PKLogFacilityTypeGetObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v32 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v46 = v32;
      _os_log_error_impl(&dword_19D178000, v24, OS_LOG_TYPE_ERROR, "PKLinkedApplication: Error looking up items %{public}@ in store.", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isCanceled") & 1) != 0)
  {
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 48), "scale");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 48), "size");
  v7 = floor(v5 * floor(v6));
  v9 = floor(v5 * floor(v8));
  objc_msgSend(v3, "artwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = *MEMORY[0x1E0CF9AC8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v12;
  v43[1] = *MEMORY[0x1E0CF9AC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0CF9AB8];
  v16 = *MEMORY[0x1E0CF9AA8];
  v44[1] = v14;
  v44[2] = v16;
  v17 = *MEMORY[0x1E0CF9AB0];
  v43[2] = v15;
  v43[3] = v17;
  v44[3] = *MEMORY[0x1E0CF9A80];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "makeURLWithSubstitutions:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if ((objc_msgSend(v19, "isFileURL") & 1) != 0
      || (objc_msgSend(v19, "scheme"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("data")),
          v20,
          v21))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v19, 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 48);
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __LookupStoreApplications_block_invoke_330;
      v40[3] = &unk_1E3E65930;
      v41 = v3;
      v42 = *(id *)(a1 + 56);
      ImageFromData(v22, v23, v40);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __LookupStoreApplications_block_invoke_333;
      v35[3] = &unk_1E3E65958;
      v36 = *(id *)(a1 + 40);
      v37 = *(id *)(a1 + 48);
      v38 = v3;
      v39 = *(id *)(a1 + 56);
      objc_msgSend(v27, "dataTaskWithURL:completionHandler:", v19, v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "resume");
      v30 = *(void **)(a1 + 40);
      v33[0] = v28;
      v33[1] = 3221225472;
      v33[2] = __LookupStoreApplications_block_invoke_335;
      v33[3] = &unk_1E3E612E8;
      v34 = v29;
      v31 = v29;
      objc_msgSend(v30, "addCancelAction:", v33);

    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "appStoreIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v26;
      _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: Unable to find app icon URL for %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

LABEL_16:
}

void __LookupStoreApplications_block_invoke_330(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIconImage:", v3);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "appStoreIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: Failed to create app image from data for %@", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setIconImage:", 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __LookupStoreApplications_block_invoke_333(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 48), "appStoreIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKLinkedApplication: Failed to download app icon for %@ with error: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __LookupStoreApplications_block_invoke_2;
    v14[3] = &unk_1E3E65930;
    v13 = *(void **)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    ImageFromData(v7, v13, v14);

  }
}

uint64_t __LookupStoreApplications_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "setIconImage:", a2);
  if (a2)
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
}

uint64_t __LookupStoreApplications_block_invoke_335(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __LookupStoreApplications_block_invoke_336(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
