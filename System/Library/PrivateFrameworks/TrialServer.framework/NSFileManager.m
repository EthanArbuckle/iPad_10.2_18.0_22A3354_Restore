@implementation NSFileManager

void __66__NSFileManager_TRIServer__triRemoveNestedEmptyDirectoriesAtPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int *v5;
  char *v6;
  int v7;
  int v8;
  id v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a2);
  if (rmdir((const char *)objc_msgSend(v3, "fileSystemRepresentation")) && *__error() != 66)
  {
    TRILogCategory_ClientFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = __error();
      v6 = strerror(*v5);
      v7 = *__error();
      v8 = 138543874;
      v9 = v3;
      v10 = 2080;
      v11 = v6;
      v12 = 1024;
      v13 = v7;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Failed remove directory %{public}@: %s (%d)", (uint8_t *)&v8, 0x1Cu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

uint64_t __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke_22(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __53__NSFileManager_TRIServer__triDiskUsageForDirectory___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

@end
