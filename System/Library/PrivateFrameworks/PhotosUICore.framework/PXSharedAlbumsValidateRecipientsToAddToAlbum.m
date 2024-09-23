@implementation PXSharedAlbumsValidateRecipientsToAddToAlbum

void __PXSharedAlbumsValidateRecipientsToAddToAlbum_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 40));
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addActionWithTitle:style:action:", v5, 1, 0);

}

void __PXSharedAlbumsValidateRecipientsToAddToAlbum_block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 40));
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addActionWithTitle:style:action:", v5, 1, 0);

}

@end
