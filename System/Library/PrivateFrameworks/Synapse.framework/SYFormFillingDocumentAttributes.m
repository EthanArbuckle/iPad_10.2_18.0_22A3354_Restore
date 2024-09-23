@implementation SYFormFillingDocumentAttributes

- (SYFormFillingDocumentAttributes)initWithFormFillingCoachingDisabled:(BOOL)a3
{
  SYFormFillingDocumentAttributes *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SYFormFillingDocumentAttributes;
  result = -[SYFormFillingDocumentAttributes init](&v5, sel_init);
  if (result)
    result->_formFillingCoachingDisabled = a3;
  return result;
}

- (void)initWithDictionary:(void *)result
{
  if (result)
    return (void *)objc_msgSend(result, "initWithFormFillingCoachingDisabled:", -[SYFormFillingDocumentAttributes _formFillingCoachingDisabledValueFromDictionary:]((uint64_t)result, a2));
  return result;
}

- (uint64_t)_formFillingCoachingDisabledValueFromDictionary:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;

  if (!a1)
    return 0;
  objc_msgSend(a2, "objectForKey:", CFSTR("SYFormFillingCoachingDisabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v2 == (void *)v3)
  {

    goto LABEL_7;
  }
  v4 = (void *)v3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));
LABEL_8:

  return v6;
}

- (id)dictionaryRepresentation
{
  int v1;
  const __CFString *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = CFSTR("SYFormFillingCoachingDisabled");
    v1 = objc_msgSend(a1, "formFillingCoachingDisabled");
    v2 = CFSTR("0");
    if (v1)
      v2 = CFSTR("1");
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)dictionaryRepresentationWithNullValues
{
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1 = CFSTR("SYFormFillingCoachingDisabled");
  v2[0] = &stru_1E757CA18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)formFillingDocumentAttributesForFileAtURL:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  os_log_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  os_log_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__5;
    v33 = __Block_byref_object_dispose__5;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__5;
    v27 = __Block_byref_object_dispose__5;
    v28 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__SYFormFillingDocumentAttributes_formFillingDocumentAttributesForFileAtURL_error___block_invoke;
    v19[3] = &unk_1E757C070;
    v21 = &v29;
    v22 = &v23;
    v8 = v7;
    v20 = v8;
    +[SYFormFillingDocumentAttributes _formFillingDocumentAttributesForFileAtURL:completion:]((uint64_t)a1, v6, v19);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      v9 = (void *)v24[5];
      if (v9)
        *a4 = objc_retainAutorelease(v9);
    }
    v10 = (id)v30[5];

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SYFormFillingDocumentAttributes formFillingDocumentAttributesForFileAtURL:error:].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
    v10 = 0;
  }

  return v10;
}

void __83__SYFormFillingDocumentAttributes_formFillingDocumentAttributesForFileAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_formFillingDocumentAttributesForFileAtURL:(void *)a3 completion:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  SYFormFillingDocumentAttributes *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SYFormFillingCoachingDisabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {

LABEL_2:
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__SYFormFillingDocumentAttributes__formFillingDocumentAttributesForFileAtURL_completion___block_invoke;
    v11[3] = &unk_1E757C098;
    v12 = v5;
    +[SYFileExtendedAttributes fetchPrivateAttributesForFileURL:completion:](SYFileExtendedAttributes, "fetchPrivateAttributesForFileURL:completion:", v4, v11);
    v6 = v12;
    goto LABEL_3;
  }
  v8 = objc_msgSend(v6, "BOOLForKey:", CFSTR("SYFormFillingCoachingDisabled"));
  v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = CFSTR("SYFormFillingCoachingDisabled");
    v15 = 1024;
    v16 = v8;
    _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_INFO, "Found internal setting to override %@ state to %{BOOL}d", buf, 0x12u);
  }

  if (v5)
  {
    v10 = -[SYFormFillingDocumentAttributes initWithFormFillingCoachingDisabled:]([SYFormFillingDocumentAttributes alloc], "initWithFormFillingCoachingDisabled:", v8);
    (*((void (**)(id, SYFormFillingDocumentAttributes *, _QWORD))v5 + 2))(v5, v10, 0);

  }
LABEL_3:

}

void __89__SYFormFillingDocumentAttributes__formFillingDocumentAttributesForFileAtURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  SYFormFillingDocumentAttributes *v6;
  SYFormFillingDocumentAttributes *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = [SYFormFillingDocumentAttributes alloc];
  v7 = v6;
  if (v6)
    v7 = -[SYFormFillingDocumentAttributes initWithFormFillingCoachingDisabled:](v6, "initWithFormFillingCoachingDisabled:", -[SYFormFillingDocumentAttributes _formFillingCoachingDisabledValueFromDictionary:]((uint64_t)v6, v9));
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, SYFormFillingDocumentAttributes *, id))(v8 + 16))(v8, v7, v5);

}

- (BOOL)saveToFileURL:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  void *v9;
  char v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__SYFormFillingDocumentAttributes_saveToFileURL_error___block_invoke;
  v12[3] = &unk_1E757C0C0;
  v14 = &v22;
  v15 = &v16;
  v8 = v7;
  v13 = v8;
  -[SYFormFillingDocumentAttributes _saveToFileURL:completion:](self, v6, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v9 = (void *)v17[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __55__SYFormFillingDocumentAttributes_saveToFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_saveToFileURL:(void *)a3 completion:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke;
    v15[3] = &unk_1E757B338;
    v16 = v6;
    v9 = (void *)MEMORY[0x1BCCFF08C](v15);
    -[SYFormFillingDocumentAttributes dictionaryRepresentation](a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke_2;
    v12[3] = &unk_1E757B580;
    v13 = v5;
    v14 = v9;
    v11 = v9;
    +[SYFileExtendedAttributes setPrivateAttributes:forFileURL:completion:](SYFileExtendedAttributes, "setPrivateAttributes:forFileURL:completion:", v10, v13, v12);

  }
}

uint64_t __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke_2_cold_1(a1);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)removeFormFillingDocumentAttributesForFileAtURL:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  os_log_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  os_log_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v6 = a3;
  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__5;
    v27 = __Block_byref_object_dispose__5;
    v28 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__SYFormFillingDocumentAttributes_removeFormFillingDocumentAttributesForFileAtURL_error___block_invoke;
    v19[3] = &unk_1E757B5A8;
    v21 = &v29;
    v22 = &v23;
    v8 = v7;
    v20 = v8;
    +[SYFormFillingDocumentAttributes _removeFormFillingDocumentAttributesForFileAtURL:completion:]((uint64_t)a1, v6, v19);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      v9 = (void *)v24[5];
      if (v9)
        *a4 = objc_retainAutorelease(v9);
    }
    v10 = *((_BYTE *)v30 + 24) != 0;

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SYFormFillingDocumentAttributes formFillingDocumentAttributesForFileAtURL:error:].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
    v10 = 0;
  }

  return v10;
}

void __89__SYFormFillingDocumentAttributes_removeFormFillingDocumentAttributesForFileAtURL_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)_removeFormFillingDocumentAttributesForFileAtURL:(void *)a3 completion:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  +[SYFormFillingDocumentAttributes dictionaryRepresentationWithNullValues]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__SYFormFillingDocumentAttributes__removeFormFillingDocumentAttributesForFileAtURL_completion___block_invoke;
  v9[3] = &unk_1E757B580;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  +[SYFileExtendedAttributes setPrivateAttributes:forFileURL:completion:](SYFileExtendedAttributes, "setPrivateAttributes:forFileURL:completion:", v6, v8, v9);

}

void __95__SYFormFillingDocumentAttributes__removeFormFillingDocumentAttributesForFileAtURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __95__SYFormFillingDocumentAttributes__removeFormFillingDocumentAttributesForFileAtURL_completion___block_invoke_cold_1(a1);

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v3 == 0, v3);

}

- (BOOL)formFillingCoachingDisabled
{
  return self->_formFillingCoachingDisabled;
}

+ (void)formFillingDocumentAttributesForFileAtURL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__SYFormFillingDocumentAttributes__saveToFileURL_completion___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v2, v3, "Unable to write form filling document attributes to: %@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __95__SYFormFillingDocumentAttributes__removeFormFillingDocumentAttributesForFileAtURL_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1BCC38000, v2, v3, "Unable to remove form filling document attributes from file: %@, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

@end
