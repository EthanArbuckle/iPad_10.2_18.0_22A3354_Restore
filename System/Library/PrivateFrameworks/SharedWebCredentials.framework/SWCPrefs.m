@implementation SWCPrefs

void __24___SWCPrefs_sharedPrefs__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_SWCPrefs _init]([_SWCPrefs alloc], "_init");
  v1 = (void *)qword_1ED1B61E0;
  qword_1ED1B61E0 = (uint64_t)v0;

}

void __40___SWCPrefs_containerURLReturningError___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 1;
  v0 = (void *)container_create_or_lookup_path_for_current_user();
  if (v0)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v0, 1, 0);
    v2 = (void *)qword_1ED1B61F0;
    qword_1ED1B61F0 = v1;

    objc_msgSend((id)qword_1ED1B61F0, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.SharedWebCredentials"), 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_1ED1B61F0;
    qword_1ED1B61F0 = v3;

    free(v0);
  }
  else
  {
    if (qword_1ED1B6240 != -1)
      dispatch_once(&qword_1ED1B6240, &__block_literal_global_88);
    v5 = qword_1ED1B6238;
    if (os_log_type_enabled((os_log_t)qword_1ED1B6238, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v16;
      _os_log_error_impl(&dword_1A855A000, v5, OS_LOG_TYPE_ERROR, "Error %llu getting container path", buf, 0xCu);
    }
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17[0] = CFSTR("Line");
    v17[1] = CFSTR("Function");
    v18[0] = &unk_1E5480EB8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCPrefs containerURLReturningError:]_block_invoke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithDomain:code:userInfo:", CFSTR("ContainerManager"), v16, v8);
    v10 = (void *)qword_1ED1B61F8;
    qword_1ED1B61F8 = v9;

  }
  if (qword_1ED1B61F0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", qword_1ED1B61F0, 1, 0, &v15);
    v13 = v15;

    if ((v12 & 1) == 0)
    {
      if (qword_1ED1B6240 != -1)
        dispatch_once(&qword_1ED1B6240, &__block_literal_global_88);
      v14 = qword_1ED1B6238;
      if (os_log_type_enabled((os_log_t)qword_1ED1B6238, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = (uint64_t)v13;
        _os_log_error_impl(&dword_1A855A000, v14, OS_LOG_TYPE_ERROR, "NSFileManager failed to create user container URL directory (ignoring): %{public}@", buf, 0xCu);
      }
    }

  }
}

uint64_t __38___SWCPrefs_retryIntervalAfterFailure__block_invoke()
{
  uint64_t result;

  result = arc4random_uniform(0xE10u);
  qword_1ED1B6208 = (result + 10800);
  return result;
}

uint64_t __38___SWCPrefs_retryIntervalAfterSuccess__block_invoke()
{
  uint64_t result;

  result = arc4random_uniform(0xE10u);
  qword_1ED1B6218 = (result + 428400);
  return result;
}

const char *__28___SWCPrefs_isAppleInternal__block_invoke()
{
  const char *result;

  result = (const char *)os_variant_has_internal_diagnostics();
  _MergedGlobals_2 = (char)result;
  if ((_DWORD)result)
  {
    result = getenv("SWC_MOCK_THE_PUBLIC");
    if (result)
    {
      result = (const char *)strtol(result, 0, 0);
      if (result)
        _MergedGlobals_2 = 0;
    }
  }
  return result;
}

uint64_t __45___SWCPrefs_Private___recheckFuzzForSuccess___block_invoke()
{
  uint64_t result;

  qword_1ED1B6248 = arc4random_uniform(0xE10u) + 10800;
  result = arc4random_uniform(0xE10u);
  qword_1ED1B6250 = (result + 428400);
  return result;
}

@end
