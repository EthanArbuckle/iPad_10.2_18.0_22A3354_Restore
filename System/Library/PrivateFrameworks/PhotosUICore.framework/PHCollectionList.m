@implementation PHCollectionList

void __109__PHCollectionList_PhotosUICore__px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__otherAlbumsCollectionDictionary;
  px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__otherAlbumsCollectionDictionary = (uint64_t)v0;

}

void __79__PHCollectionList_PhotosUICore__px_transientIdentifierForWellKnownFolderName___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("media-types");
  v2[1] = CFSTR("shared-albums");
  v3[0] = CFSTR("PXMediaTypesVirtualCollection");
  v3[1] = CFSTR("PXSharedAlbumsAndActivityVirtualCollection");
  v2[2] = CFSTR("my-albums");
  v3[2] = CFSTR("PXMyAlbumsVirtualCollection");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_transientIdentifierForWellKnownFolderName__transientIdentifiers;
  px_transientIdentifierForWellKnownFolderName__transientIdentifiers = v0;

}

@end
