@implementation NSItemProvider

void __75__NSItemProvider_Sharing__loadURLClassWithPreviousError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)*MEMORY[0x1E0CEC618];
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, _QWORD))(v2 + 16))(v2, v4, v5, 0);

}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a4;
  if (!v7)
  {
    framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_cold_1(a1, (uint64_t)v8, v10);
LABEL_12:

    objc_msgSend(*(id *)(a1 + 40), "loadURLClassWithPreviousError:completionHandler:", v8, *(_QWORD *)(a1 + 48));
    goto LABEL_14;
  }
  if (*(_BYTE *)(a1 + 56))
    v9 = a3 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_3;
      v13[3] = &unk_1E48333F8;
      v14 = v7;
      v16 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 32);
      objc_msgSend(v14, "coordinateReadingWithSaveToTempDir:options:completionHandler:", 1, 8, v13);

      goto LABEL_14;
    }
    framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_cold_2(a1, v10);
    goto LABEL_12;
  }
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _QWORD))(v11 + 16))(v11, v7, v12, 0);

LABEL_14:
}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (!v5)
  {
    framework_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_3_cold_1(a1, (uint64_t)v6, v8);

    v7 = *(void **)(a1 + 32);
  }
  v11 = a1 + 40;
  v9 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(v11 + 8);
  v12 = v7;
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _QWORD))(v10 + 16))(v10, v12, v13, 0);

}

uint64_t __71__NSItemProvider_Sharing__sf_loadSecurityContextWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_1(&dword_1A2830000, a2, a3, "Could not load representation %{public}@ from the item provider. Error: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1A2830000, a2, OS_LOG_TYPE_ERROR, "Could not load representation %{public}@ from the item provider for opening in place", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_1(&dword_1A2830000, a2, a3, "Failed to save %@ to temp directory with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

@end
