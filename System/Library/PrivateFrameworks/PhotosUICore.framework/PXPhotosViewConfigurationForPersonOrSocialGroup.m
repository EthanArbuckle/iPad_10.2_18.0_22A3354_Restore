@implementation PXPhotosViewConfigurationForPersonOrSocialGroup

id __PXPhotosViewConfigurationForPersonOrSocialGroup_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (!v2)
    v2 = *(void **)(a1 + 40);
  return v2;
}

id __PXPhotosViewConfigurationForPersonOrSocialGroup_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PXPhotosViewBannerControllerFactory makeBannerControllerForPerson:photosViewModel:](PXPhotosViewBannerControllerFactory, "makeBannerControllerForPerson:photosViewModel:", *(_QWORD *)(a1 + 32), a2);
}

uint64_t __PXPhotosViewConfigurationForPersonOrSocialGroup_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSortDescriptors:", *(_QWORD *)(a1 + 32));
}

@end
