@implementation CopyURLAction

uint64_t ___CopyURLAction_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sharedLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "shareURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      PXCopyURL(v8);
      objc_msgSend(v9, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _PresentAlert((uint64_t)CFSTR("URL Copied to Pasteboard"), (uint64_t)v10, v3);

    }
    else
    {
      _PresentAlert((uint64_t)CFSTR("Failed to Copy URL"), (uint64_t)CFSTR("No URL"), v3);
    }

  }
  else
  {
    _PresentAlert((uint64_t)CFSTR("Failed to Copy URL"), (uint64_t)CFSTR("No Shared Library"), v3);
  }

  return 1;
}

@end
