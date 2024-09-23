@implementation CRFormFieldAutoFillGuardingStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CROSLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldAutoFillGuardingStep is running (#input:%lu).", (uint8_t *)&buf, 0xCu);
  }

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__CRFormFieldAutoFillGuardingStep_process_externalFields_document_options___block_invoke;
  v11[3] = &unk_1E98DA0A0;
  v11[4] = &v12;
  v11[5] = &buf;
  v11[6] = &v16;
  v11[7] = &v20;
  +[CRFormPostProcessingManager enumerateDetectedFields:block:](CRFormPostProcessingManager, "enumerateDetectedFields:block:", v6, v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13[3] = 1;
    v8 = +[CRFormContentTypeUtilities contentTypeIsStartOfAutofillContext:previousType:nextType:](CRFormContentTypeUtilities, "contentTypeIsStartOfAutofillContext:previousType:nextType:", v17[3], v21[3], 1);
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setAutofillNewContextStart:", v8);
  }
  v9 = v6;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v9;
}

void __75__CRFormFieldAutoFillGuardingStep_process_externalFields_document_options___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "fieldType") == 1)
    v4 = objc_msgSend(v3, "textContentType");
  else
    v4 = 1;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v4;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setAutofillNewContextStart:", +[CRFormContentTypeUtilities contentTypeIsStartOfAutofillContext:previousType:nextType:](CRFormContentTypeUtilities, "contentTypeIsStartOfAutofillContext:previousType:nextType:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)));
  }
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

@end
