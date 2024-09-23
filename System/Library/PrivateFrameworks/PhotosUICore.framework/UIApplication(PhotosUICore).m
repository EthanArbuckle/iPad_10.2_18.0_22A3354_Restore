@implementation UIApplication(PhotosUICore)

- (void)px_navigateToWelcomeCloudViewWithCompletionHandler:()PhotosUICore
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = a3;
  objc_msgSend(v4, "URLWithString:", CFSTR("photos://show-welcome-cpl"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v6, v5);

}

- (void)px_navigateToMomentsViewRevealingAsset:()PhotosUICore completionHandler:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigateToMomentsViewRevealingAssetWithUUID:openOneUp:completionHandler:", v7, 0, v6);

}

- (void)px_navigateToMomentsViewRevealingDisplayAsset:()PhotosUICore openOneUp:completionHandler:
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  objc_opt_class();
  v9 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v14;
    objc_msgSend(v10, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "wellKnownPhotoLibraryIdentifier");

    v9 = v10;
    if (v12 == 3)
    {
      PXAssetToRevealForSyndicationLibraryAsset(v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v9, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigateToMomentsViewRevealingAssetWithUUID:openOneUp:completionHandler:", v13, a4, v8);

}

- (void)px_navigateToForYouRevealingSharedLibrarySharingSuggestionsWithCompletionHandler:()PhotosUICore
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = a3;
  objc_msgSend(v4, "URLWithString:", CFSTR("photos://forYou?type=sharedLibrarySuggestions"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v6, v5);

}

- (void)px_navigateToMomentsViewRevealingAssetWithUUID:()PhotosUICore openOneUp:completionHandler:
{
  id v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  if (!objc_msgSend(v12, "length"))
  {
    v9 = CFSTR("photos://contentmode?id=photos");
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(CFSTR("photos://contentmode?id=photos"), "stringByAppendingFormat:", CFSTR("&assetuuid=%@"), v12);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
LABEL_3:
    -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("&oneUp=1"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v10;
  }
LABEL_4:
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v11, v8);

}

- (void)px_navigateToCollectionSubtype:()PhotosUICore completionHandler:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CD13B8];
  v7 = a4;
  objc_msgSend(v6, "px_builtInAlbumNameForSubtype:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photos://album?name=%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v10, v7);

  }
  else
  {
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("Cannot obtain failed-to-upload album name");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXUIApplicationErrorDomain"), -1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

- (void)px_navigateToRevealDroppedAsset:()PhotosUICore completionHandler:
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = (void *)MEMORY[0x1E0CB3998];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "componentsWithString:", CFSTR("photos://album"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("name"), CFSTR("camera-roll"));
  objc_msgSend(v9, "addObject:", v10);
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("assetuuid"), v11);
    objc_msgSend(v9, "addObject:", v12);

  }
  objc_msgSend(v14, "setQueryItems:", v9);
  objc_msgSend(v14, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v13, v7);

}

- (void)px_navigateToOneUpShowingAsset:()PhotosUICore completionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("photos://asset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("uuid"), v8);
    objc_msgSend(v10, "addObject:", v11);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("albumname"), CFSTR("camera-roll"));
    objc_msgSend(v10, "addObject:", v12);
    objc_msgSend(v9, "setQueryItems:", v10);
    objc_msgSend(v9, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v13, v7);

  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Unable to navigate to an asset without an asset UUID. Asset: %@", buf, 0xCu);
    }

    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__UIApplication_PhotosUICore__px_navigateToOneUpShowingAsset_completionHandler___block_invoke;
      block[3] = &unk_1E5148A40;
      v16 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

- (void)px_navigateToCollection:()PhotosUICore selectedObject:completionHandler:
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a3, "px_navigationURLWithSelectedObject:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v9, v8);

}

- (void)px_navigateToPhotosURL:()PhotosUICore completionHandler:
{
  id v6;
  id v7;
  PXProgrammaticNavigationDestination *v8;
  void *v9;
  void *v10;
  PXProgrammaticNavigationRequest *v11;
  id *v12;
  id *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = -[PXProgrammaticNavigationDestination initWithURL:]([PXProgrammaticNavigationDestination alloc], "initWithURL:", v6);
  objc_msgSend(a1, "px_firstKeyWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "routingOptionsForDestination:", v8))
  {
    v11 = [PXProgrammaticNavigationRequest alloc];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke;
    v22[3] = &unk_1E5142E28;
    v12 = &v23;
    v13 = &v24;
    v23 = v6;
    v24 = v7;
    v14 = v7;
    v15 = v6;
    v16 = -[PXProgrammaticNavigationRequest initWithDestination:options:completionHandler:](v11, "initWithDestination:options:completionHandler:", v8, 0, v22);
    PXProgrammaticNavigationRequestExecute(v16, v10);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke_181;
    v19[3] = &unk_1E5148CE0;
    v12 = &v20;
    v13 = &v21;
    v20 = v6;
    v21 = v7;
    v17 = v7;
    v18 = v6;
    dispatch_async(v16, v19);
  }

}

@end
