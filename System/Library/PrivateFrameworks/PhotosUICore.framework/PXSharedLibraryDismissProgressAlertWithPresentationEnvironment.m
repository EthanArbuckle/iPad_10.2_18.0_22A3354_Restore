@implementation PXSharedLibraryDismissProgressAlertWithPresentationEnvironment

uint64_t __PXSharedLibraryDismissProgressAlertWithPresentationEnvironment_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Did dismiss progress alert", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
