@implementation PXPresentCameraSharingSetup

uint64_t __PXPresentCameraSharingSetup_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewController:animated:completionHandler:", *(_QWORD *)(a1 + 40), 1, &__block_literal_global_131095);
}

uint64_t __PXPresentCameraSharingSetup_block_invoke_132(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewController:animated:completionHandler:", *(_QWORD *)(a1 + 40), 1, &__block_literal_global_134_131092);
}

void __PXPresentCameraSharingSetup_block_invoke_2_133()
{
  NSObject *v0;
  uint8_t v1[16];

  PLSharedLibraryGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6789000, v0, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryCameraSharingBanner: Did dismiss Camera sharing options", v1, 2u);
  }

}

void __PXPresentCameraSharingSetup_block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  PLSharedLibraryGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A6789000, v0, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryCameraSharingBanner: Did complete Camera sharing options", v1, 2u);
  }

}

@end
