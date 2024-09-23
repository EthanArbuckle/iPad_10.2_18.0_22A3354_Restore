@implementation WFAppIconLoader

+ (void)loadIconWithBundleIdentifier:(id)a3 desiredSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *, void *);
  void *v22;
  id v23;
  id v24;
  CGFloat v25;
  CGFloat v26;
  _QWORD v27[2];

  height = a4.height;
  width = a4.width;
  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://itunes.apple.com/"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPath:", CFSTR("/lookup"));
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("bundleId"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQueryItems:", v13);

  objc_msgSend(MEMORY[0x1E0CB39F0], "wf_sharedSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke;
  v22 = &unk_1E5FC5638;
  v23 = v8;
  v24 = v9;
  v25 = width;
  v26 = height;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v14, "dataTaskWithURL:completionHandler:", v15, &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resume", v19, v20, v21, v22);

}

void __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  _QWORD v33[4];
  id v34;
  id v35;
  _BYTE *v36;
  _QWORD v37[5];
  uint64_t (*v38)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v38 = v9;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v38;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("results"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("artworkUrl60"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("artworkUrl100"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("artworkUrl512"));
      v13 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v13;
      v14 = *(double *)(a1 + 48);
      v15 = v30;
      if (v14 > 100.0)
        v15 = (void *)v13;
      if (v14 <= 60.0)
        v15 = v31;
      v28 = v15;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFFileType typeFromFilename:](WFFileType, "typeFromFilename:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "conformsToUTType:", *MEMORY[0x1E0CEC530]);

      if (v20)
      {
        objc_msgSend(v16, "URLByDeletingPathExtension");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "URLByAppendingPathExtension:", CFSTR("png"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v43[0] = v22;
        v43[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
        v23 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v23;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v40 = __Block_byref_object_copy__2540;
      v41 = __Block_byref_object_dispose__2541;
      v42 = 0;
      v36 = buf;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_54;
      v37[3] = &unk_1E5FC55E8;
      v37[4] = buf;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_3;
      v33[3] = &unk_1E5FC5610;
      v34 = *(id *)(a1 + 32);
      v35 = *(id *)(a1 + 40);
      objc_msgSend(v17, "if_enumerateAsynchronouslyInSequence:completionHandler:", v37, v33);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      getWFInterchangeLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "+[WFAppIconLoader loadIconWithBundleIdentifier:desiredSize:completionHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2114;
        v40 = v32;
        _os_log_impl(&dword_1AF681000, v24, OS_LOG_TYPE_ERROR, "%s Failed to fetch icon for %{public}@, %{public}@", buf, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

    v9 = v32;
  }
  else
  {
    getWFInterchangeLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[WFAppIconLoader loadIconWithBundleIdentifier:desiredSize:completionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2114;
      v40 = v9;
      _os_log_impl(&dword_1AF681000, v26, OS_LOG_TYPE_ERROR, "%s Failed to fetch icon for %{public}@, %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_54(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB39F0];
  v10 = a2;
  objc_msgSend(v9, "wf_sharedSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5FC55C0;
  v12 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v12;
  v18 = a5;
  v13 = v8;
  objc_msgSend(v11, "dataTaskWithURL:completionHandler:", v10, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "resume");
}

void __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v5)
  {
    +[WFImage imageWithData:scale:allowAnimated:](WFImage, "imageWithData:scale:allowAnimated:", v5, 0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();

  }
  else
  {
    getWFInterchangeLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = 136315650;
      v10 = "+[WFAppIconLoader loadIconWithBundleIdentifier:desiredSize:completionHandler:]_block_invoke_3";
      v11 = 2114;
      v12 = v8;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1AF681000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch icon for %{public}@, %{public}@", (uint8_t *)&v9, 0x20u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }

}

void __78__WFAppIconLoader_loadIconWithBundleIdentifier_desiredSize_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB36B8];
  v10 = a3;
  objc_msgSend(v9, "indexSetWithIndexesInRange:", 200, 100);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "statusCode");

  LOBYTE(v10) = objc_msgSend(v11, "containsIndex:", v12);
  if ((v10 & 1) != 0)
  {
    **(_BYTE **)(a1 + 48) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
