@implementation CRFormTextBasedFieldDedupingStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CROSLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormTextBasedFieldDedupingStep is running.", buf, 2u);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke;
  v32[3] = &unk_1E98D9ED0;
  v10 = v6;
  v33 = v10;
  v11 = v8;
  v34 = v11;
  +[CRFormPostProcessingManager enumerateTextBasedDetectedFields:block:](CRFormPostProcessingManager, "enumerateTextBasedDetectedFields:block:", v10, v32);
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_4;
  v29[3] = &unk_1E98D9ED0;
  v12 = v11;
  v30 = v12;
  v13 = v10;
  v31 = v13;
  +[CRFormPostProcessingManager enumerateTextBasedDetectedFields:block:](CRFormPostProcessingManager, "enumerateTextBasedDetectedFields:block:", v13, v29);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v12, "containsObject:", v19, (_QWORD)v25) & 1) == 0)
          objc_msgSend(v14, "addObject:", v19);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v16);
  }

  CROSLogForCategory(6);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = objc_msgSend(v12, "count");
    v22 = objc_msgSend(v15, "count");
    v23 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134218496;
    v36 = v21;
    v37 = 2048;
    v38 = v22;
    v39 = 2048;
    v40 = v23;
    _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_DEBUG, "CRFormTextBasedFieldDedupingStep removed %ld text fields from %ld fields, preserving %ld fields.", buf, 0x20u);
  }

  return v14;
}

void __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, _BYTE *);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v3 = a2;
  objc_msgSend(v3, "boundingQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "boundingQuad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v14 = (void *)objc_opt_class();
  v15 = *(_QWORD *)(a1 + 32);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_3;
  v20 = &unk_1E98D9FA0;
  v23 = v6;
  v24 = v8;
  v25 = v10;
  v26 = v12;
  v22 = &v27;
  v16 = v13;
  v21 = v16;
  objc_msgSend(v14, "enumerateFieldsInFields:filter:block:", v15, &__block_literal_global_154, &v17);
  if (*((_BYTE *)v28 + 24))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, v17, v18, v19, v20);

  _Block_object_dispose(&v27, 8);
}

BOOL __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fieldSource") != 3;
}

void __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL IsNull;
  char v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v26 = a2;
  objc_msgSend(v26, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingBox");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  if (CGRectContainsRect(*(CGRect *)(a1 + 48), v31)
    || (v27.origin.x = v7,
        v27.origin.y = v9,
        v27.size.width = v11,
        v27.size.height = v13,
        CGRectContainsRect(v27, *(CGRect *)(a1 + 48))))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v26, "boundingQuad");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "boundingBoxIOUWithQuad:", *(_QWORD *)(a1 + 32));
    if (v15 > 0.05)
      goto LABEL_9;
    v32.origin.x = v7;
    v32.origin.y = v9;
    v32.size.width = v11;
    v32.size.height = v13;
    v28 = CGRectIntersection(*(CGRect *)(a1 + 48), v32);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
    v20 = CGRectGetWidth(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v21 = CGRectGetHeight(v29);
    v22 = CGRectGetWidth(*(CGRect *)(a1 + 48));
    v23 = CGRectGetHeight(*(CGRect *)(a1 + 48));
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    IsNull = CGRectIsNull(v30);
    v25 = v20 * v21 / (v22 * v23) <= 0.5 || IsNull;
    if ((v25 & 1) == 0)
    {
LABEL_9:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }

  }
}

void __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(v3, "boundingQuad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundingBox");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v13 = (void *)objc_opt_class();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_5;
    v19 = &unk_1E98D9FA0;
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    v22 = v6;
    v23 = v8;
    v24 = v10;
    v25 = v12;
    v20 = v15;
    v21 = &v26;
    objc_msgSend(v13, "enumerateTextBasedDetectedFields:block:", v14, &v16);
    if (*((_BYTE *)v27 + 24))
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3, v16, v17, v18, v19);

    _Block_object_dispose(&v26, 8);
  }

}

void __76__CRFormTextBasedFieldDedupingStep_process_externalFields_document_options___block_invoke_5(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v25 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(v25, "boundingQuad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "boundingBox");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v31.origin.x = v7;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v13;
    v26 = CGRectIntersection(*(CGRect *)(a1 + 48), v31);
    x = v26.origin.x;
    y = v26.origin.y;
    width = v26.size.width;
    height = v26.size.height;
    v24 = CGRectGetWidth(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v23 = CGRectGetHeight(v27);
    v28.origin.x = v7;
    v28.origin.y = v9;
    v28.size.width = v11;
    v28.size.height = v13;
    v22 = CGRectGetWidth(v28);
    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    v18 = CGRectGetHeight(v29);
    v19 = CGRectGetWidth(*(CGRect *)(a1 + 48));
    v20 = CGRectGetHeight(*(CGRect *)(a1 + 48));
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    if (!CGRectIsNull(v30) && v24 * v23 / (v19 * v20) > 0.3 && v19 * v20 < v22 * v18)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

@end
