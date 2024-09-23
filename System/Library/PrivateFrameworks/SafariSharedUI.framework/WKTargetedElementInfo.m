@implementation WKTargetedElementInfo

void __84___WKTargetedElementInfo_ScribbleUtilities__safari_imageAnalysisTextWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v4 = (void *)getVNImageRequestHandlerClass_softClass;
    v27 = getVNImageRequestHandlerClass_softClass;
    v5 = MEMORY[0x1E0C809B0];
    if (!getVNImageRequestHandlerClass_softClass)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __getVNImageRequestHandlerClass_block_invoke;
      v22 = &unk_1E54424C0;
      v23 = &v24;
      __getVNImageRequestHandlerClass_block_invoke((uint64_t)&v19);
      v4 = (void *)v25[3];
    }
    v6 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v24, 8);
    v7 = [v6 alloc];
    v8 = (void *)objc_msgSend(v7, "initWithCGImage:options:", a2, MEMORY[0x1E0C9AA70]);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v9 = (void *)getVNRecognizeTextRequestClass_softClass;
    v27 = getVNRecognizeTextRequestClass_softClass;
    if (!getVNRecognizeTextRequestClass_softClass)
    {
      v19 = v5;
      v20 = 3221225472;
      v21 = __getVNRecognizeTextRequestClass_block_invoke;
      v22 = &unk_1E54424C0;
      v23 = &v24;
      __getVNRecognizeTextRequestClass_block_invoke((uint64_t)&v19);
      v9 = (void *)v25[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v24, 8);
    v11 = [v10 alloc];
    v14 = v5;
    v15 = 3221225472;
    v16 = __84___WKTargetedElementInfo_ScribbleUtilities__safari_imageAnalysisTextWithCompletion___block_invoke_2;
    v17 = &unk_1E5444C88;
    v18 = *(id *)(a1 + 32);
    v12 = (void *)objc_msgSend(v11, "initWithCompletionHandler:", &v14);
    objc_msgSend(v12, "setRecognitionLevel:", 1, v14, v15, v16, v17);
    v28[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performRequests:error:", v13, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

void __84___WKTargetedElementInfo_ScribbleUtilities__safari_imageAnalysisTextWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v15 = a1;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "topCandidates:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v6, "length"))
            objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v14);
          else
            objc_msgSend(v6, "appendString:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(v15 + 32) + 16))();
  }

}

@end
