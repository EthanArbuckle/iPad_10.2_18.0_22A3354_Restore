@implementation NSURL

uint64_t __87__NSURL_TSUAdditions__tsu_performSecurityScopedResourceAccessAsynchronouslyUsingBlock___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "stopAccessingSecurityScopedResource");
  return result;
}

void __42__NSURL_TSUAdditions__tsu_fileSize_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __47__NSURL_TSUAdditions___isShareRole_role_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __45__NSURL_TSUAdditions__tsu_displayName_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __52__NSURL_TSUAdditions__tsu_isDocumentUploaded_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id obj;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBCD48];
  v3 = *MEMORY[0x24BDBCD50];
  v14[0] = *MEMORY[0x24BDBCD48];
  v14[1] = v3;
  v4 = *MEMORY[0x24BDBCD20];
  v14[2] = *MEMORY[0x24BDBCD20];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tsu_removeCachedResourceValueForKeys:", v5);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "resourceValuesForKeys:error:", v5, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8 != 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "BOOLValue");
    if (v12)
    {
      if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
        LOBYTE(v12) = 0;
      else
        LOBYTE(v12) = objc_msgSend((id)*MEMORY[0x24BDBCD10], "isEqualToString:", v11);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v12;

  }
  else if (TSUDefaultCat_init_token != -1)
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_6_0);
  }

}

void __52__NSURL_TSUAdditions__tsu_isDocumentUploaded_error___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __48__NSURL_TSUAdditions__tsu_shareOwnerName_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __45__NSURL_TSUAdditions__tsu_fileSystemTypeName__block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __44__NSURL_TSUAdditions__tsu_isOnSameVolumeAs___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __44__NSURL_TSUAdditions__tsu_isOnSameVolumeAs___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke_2;
  v7[3] = &unk_24F39AED0;
  v4 = *(_QWORD *)(a1 + 48);
  v9 = v3;
  v10 = v4;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v6 = v3;
  +[TSUFileProviderUtilities bookmarkableStringFromDocumentURL:completion:](TSUFileProviderUtilities, "bookmarkableStringFromDocumentURL:completion:", v5, v7);

}

void __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  v9 = a3;
  if (v9 && TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_17);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __57__NSURL_TSUAdditions__tsu_fileProviderBookmarkableString__block_invoke_3()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __36__NSURL_TSUAdditions__tsu_isInTrash__block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

@end
