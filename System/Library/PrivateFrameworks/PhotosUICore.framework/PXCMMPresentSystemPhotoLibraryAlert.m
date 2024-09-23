@implementation PXCMMPresentSystemPhotoLibraryAlert

void __PXCMMPresentSystemPhotoLibraryAlert_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  PXLocalizedStringFromTable(CFSTR("PXCMMSystemPhotoLibraryAlertTitle"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  PXLocalizedStringFromTable(CFSTR("PXCMMSystemPhotoLibraryAlertMessage"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMessage:", v4);

  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addActionWithTitle:style:action:", v5, 0, 0);

}

@end
