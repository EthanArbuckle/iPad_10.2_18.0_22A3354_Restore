@implementation NSURL

uint64_t __47__NSURL_PBFAdditions__pbf_isGallerySnapshotURL__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "pbf_snapshotDefinitionForPosterSnapshotURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v3);

  return v5;
}

uint64_t __53__NSURL_PBFAdditions__pbf_isConfigurationSnapshotURL__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "pbf_snapshotDefinitionForPosterSnapshotURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v3);

  return v5;
}

void __76__NSURL_PBFAdditions__pbf_URLIsReachableAndConformsToAttributeValues_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(a2) = BSEqualObjects();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

void __130__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues_URLsNotConformingToAttributes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (v3 && *(_BYTE *)(a1 + 40))
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v3;
    if (!v4)
    {
      v5 = objc_opt_new();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
    v3 = v8;
  }

}

uint64_t __130__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToAttributeValues_URLsNotConformingToAttributes_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

uint64_t __65__NSURL_PBFAdditions__pbf_recursivelyUpdateFileAttributes_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

void __74__NSURL_PBFAdditions__pbf_URLIsReachableAndConformToResourceValues_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  id *v8;
  char v9;
  id v10;
  id obj;
  id v12;

  v7 = a3;
  obj = 0;
  v12 = 0;
  v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v9 = objc_msgSend(*(id *)(a1 + 32), "getResourceValue:forKey:error:", &v12, a2, &obj);
  v10 = v12;
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = BSEqualObjects() ^ 1;
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

void __129__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues_URLsNotConformingToAttributes_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (v3 && *(_BYTE *)(a1 + 40))
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v3;
    if (!v4)
    {
      v5 = objc_opt_new();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
    v3 = v8;
  }

}

uint64_t __129__NSURL_PBFAdditions__pbf_recursivelyValidateContentsAreReachableAndConformToResourceValues_URLsNotConformingToAttributes_error___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

uint64_t __65__NSURL_PBFAdditions__pbf_recursivelyUpdateResourceValues_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

void __51__NSURL_PBFAdditions__pbf_archivedDataStoreBaseURL__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("ArchivedDataStores"), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL;
  pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL = v2;

  v4 = *MEMORY[0x1E0C99938];
  v9[0] = *MEMORY[0x1E0C999D8];
  v9[1] = v4;
  v5 = *MEMORY[0x1E0C99940];
  v10[0] = MEMORY[0x1E0C9AAB0];
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL, 1, MEMORY[0x1E0C9AA70], 0);

    if (v8)
      objc_msgSend((id)pbf_archivedDataStoreBaseURL_archivedDataStoreBaseURL, "pbf_updateResourceValues:error:", v6, 0);
  }

}

@end
