@implementation PLRequestCloudPhotoLibraryTransferProgressForLibrary

void __PLRequestCloudPhotoLibraryTransferProgressForLibrary_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  PLiCPLTransferProgress *v10;

  v9 = a5;
  v10 = objc_alloc_init(PLiCPLTransferProgress);
  -[PLiCPLTransferProgress setNotUploadedPhotosCount:](v10, "setNotUploadedPhotosCount:", a2);
  -[PLiCPLTransferProgress setNotUploadedVideosCount:](v10, "setNotUploadedVideosCount:", a3);
  -[PLiCPLTransferProgress setNotUploadedItemsCount:](v10, "setNotUploadedItemsCount:", a4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
