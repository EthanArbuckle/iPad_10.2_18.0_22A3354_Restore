@implementation PHShareParticipant(PXSharedLibraryPhotoKitParticipant)

- (id)person
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonForShareParticipant:options:", a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)status
{
  unsigned int v3;

  if (objc_msgSend(a1, "exitState"))
    return 3;
  v3 = objc_msgSend(a1, "acceptanceStatus") - 1;
  if (v3 > 2)
    return 0;
  else
    return qword_1A7C0A1B8[v3];
}

- (PXSharedLibraryPhotoKitImageProvider)imageProvider
{
  return -[PXSharedLibraryPhotoKitImageProvider initWithParticipant:]([PXSharedLibraryPhotoKitImageProvider alloc], "initWithParticipant:", a1);
}

@end
