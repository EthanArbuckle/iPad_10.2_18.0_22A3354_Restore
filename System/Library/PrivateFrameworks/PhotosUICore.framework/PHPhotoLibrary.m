@implementation PHPhotoLibrary

void __50__PHPhotoLibrary_PhotosUICore__px_appPhotoLibrary__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  px_appPhotoLibrary_appProvidesPhotoLibrary = objc_msgSend(v0, "conformsToProtocol:", &unk_1EEBEB138);

}

id __58__PHPhotoLibrary_PhotosUICore__px_rootAlbumCollectionList__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CD14E0], "fetchRootAlbumCollectionListWithOptions:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

PXPeoplePetsHomeVisibilitySource *__59__PHPhotoLibrary_PhotosUICore__px_peoplePetsHomeVisibility__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PXPeoplePetsHomeVisibilitySource *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PXPeoplePetsHomeVisibilitySource initWithPhotoLibrary:]([PXPeoplePetsHomeVisibilitySource alloc], "initWithPhotoLibrary:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

PXPhotoLibraryLocalDefaults *__48__PHPhotoLibrary_PhotosUICore__px_localDefaults__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PXPhotoLibraryLocalDefaults *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PXPhotoLibraryLocalDefaults initWithPhotoLibrary:]([PXPhotoLibraryLocalDefaults alloc], "initWithPhotoLibrary:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

PXPhotoKitVirtualCollections *__53__PHPhotoLibrary_PhotosUICore__px_virtualCollections__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PXPhotoKitVirtualCollections *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PXPhotoKitVirtualCollections initWithPhotoLibrary:]([PXPhotoKitVirtualCollections alloc], "initWithPhotoLibrary:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

@end
