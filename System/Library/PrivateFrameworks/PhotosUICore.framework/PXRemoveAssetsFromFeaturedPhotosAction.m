@implementation PXRemoveAssetsFromFeaturedPhotosAction

- (PXFastEnumeration)suggestions
{
  NSArray *suggestions;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  suggestions = self->_suggestions;
  if (!suggestions)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[PXPhotosAction assetCount](self, "assetCount"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PXAssetsAction assets](self, "assets", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CD17D0], "fetchRecentInterestSuggestionsForAsset:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fetchedObjects");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v12 = (NSArray *)objc_msgSend(v4, "copy");
    v13 = self->_suggestions;
    self->_suggestions = v12;

    suggestions = self->_suggestions;
  }
  return (PXFastEnumeration *)suggestions;
}

- (id)actionIdentifier
{
  return CFSTR("RemoveAssetsFromFeaturedPhotos");
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(CFSTR("PXForYouRecentInterestSuggestionRemoveActionTitle"), CFSTR("PhotosUICore"));
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PXRemoveAssetsFromFeaturedPhotosAction suggestions](self, "suggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAction photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXRemoveAssetsFromFeaturedPhotosAction_performAction___block_invoke;
  v8[3] = &unk_1E5149198;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performChanges:completionHandler:", v8, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PXRemoveAssetsFromFeaturedPhotosAction suggestions](self, "suggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAction photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PXRemoveAssetsFromFeaturedPhotosAction_performUndo___block_invoke;
  v8[3] = &unk_1E5149198;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performChanges:completionHandler:", v8, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
}

void __54__PXRemoveAssetsFromFeaturedPhotosAction_performUndo___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "markReactivated");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __56__PXRemoveAssetsFromFeaturedPhotosAction_performAction___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "markDeclined");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

@end
