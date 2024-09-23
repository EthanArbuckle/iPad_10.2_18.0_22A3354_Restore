@implementation PLSpotlightQueryUtilities

+ (id)countAssetsQueryStringForLibraryIdentifier:(int64_t)a3
{
  BOOL v3;
  const __CFString *v4;
  uint64_t *v5;
  uint64_t v6;
  const __CFString *v7;

  v3 = a3 == 3;
  if (a3 == 3)
    v4 = CFSTR("%@ > 0 && %@ > 0");
  else
    v4 = CFSTR("%@ == %@");
  v5 = (uint64_t *)MEMORY[0x1E0CA61B0];
  if (!v3)
    v5 = (uint64_t *)MEMORY[0x1E0CA6650];
  v6 = *v5;
  v7 = (const __CFString *)*MEMORY[0x1E0CA65A0];
  if (!v3)
    v7 = CFSTR("com.apple.photos.search.result.collection.asset");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)searchQueryForLibrary:(id)a3 queryString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightQueryUtilities.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library.libraryServicesManager != nil"));

  }
  objc_msgSend(v8, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "wellKnownPhotoLibraryIdentifier");
  objc_msgSend(v8, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "searchQueryForLibraryIdentifier:pathManager:queryString:", v11, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)searchQueryForLibraryIdentifier:(int64_t)a3 pathManager:(id)a4 queryString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  objc_msgSend(v9, "setDisableBlockingOnIndex:", 1);
  if ((unint64_t)a3 <= 1)
    objc_msgSend(v9, "setBundleIDs:", &unk_1E37640A0);
  if (+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", a3))
  {
    objc_msgSend(v7, "spotlightSearchIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AF0]), "initWithPath:queryString:context:", v10, v8, v9);

  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:queryContext:", v8, v9);
  }

  return v11;
}

+ (void)countForSearchQuery:(id)a3 timedDispatchGroup:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "enterWithName:", CFSTR("CSSearchQuery"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__PLSpotlightQueryUtilities_countForSearchQuery_timedDispatchGroup_completion___block_invoke;
  v20[3] = &unk_1E3674D50;
  v12 = v10;
  v21 = v12;
  objc_msgSend(v7, "setCompletionHandler:", v20);
  objc_msgSend(v7, "start");
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __79__PLSpotlightQueryUtilities_countForSearchQuery_timedDispatchGroup_completion___block_invoke_2;
  v16[3] = &unk_1E3676290;
  v17 = v12;
  v18 = v7;
  v19 = v8;
  v13 = v8;
  v14 = v7;
  v15 = v12;
  objc_msgSend(v9, "notify:", v16);

}

void __79__PLSpotlightQueryUtilities_countForSearchQuery_timedDispatchGroup_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0D732B8];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "successWithResult:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (uint64_t)v6;
  }
  v7 = (id)v4;
  objc_msgSend(v2, "leaveWithResult:", v4);

}

void __79__PLSpotlightQueryUtilities_countForSearchQuery_timedDispatchGroup_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFailure");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "foundItemCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "successWithResult:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
