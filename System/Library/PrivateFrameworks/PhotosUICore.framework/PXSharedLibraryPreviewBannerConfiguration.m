@implementation PXSharedLibraryPreviewBannerConfiguration

void __PXSharedLibraryPreviewBannerConfiguration_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  PXBannerViewConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryPreviewTitle_iOS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __PXSharedLibraryPreviewBannerConfiguration_block_invoke_2;
  aBlock[3] = &unk_1E512E700;
  v17 = *(id *)(a1 + 32);
  v4 = _Block_copy(aBlock);
  +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showPreviewCancelButton");

  if (v6)
  {
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __PXSharedLibraryPreviewBannerConfiguration_block_invoke_132;
    v14[3] = &unk_1E512E700;
    v15 = *(id *)(a1 + 32);
    v7 = _Block_copy(v14);

  }
  else
  {
    v7 = 0;
  }
  v8 = [PXBannerViewConfiguration alloc];
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryPreviewSubtitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXContinue"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXBannerViewConfiguration initWithTitle:subtitle:actionButtonTitle:cancelButtonTitle:actionButtonHandler:cancelButtonHandler:primaryActionIdentifier:cancelActionIdentifier:](v8, "initWithTitle:subtitle:actionButtonTitle:cancelButtonTitle:actionButtonHandler:cancelButtonHandler:primaryActionIdentifier:cancelActionIdentifier:", v2, v9, v10, v11, v4, v7, CFSTR("PXSharedLibrarySetup"), CFSTR("PXSharedLibraryExit"));
  v13 = (void *)PXSharedLibraryPreviewBannerConfiguration_config;
  PXSharedLibraryPreviewBannerConfiguration_config = v12;

}

void __PXSharedLibraryPreviewBannerConfiguration_block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a2)
  {
    PXSharedLibrarySetupSharedLibraryOrPreview(*(void **)(a1 + 32), 0, a2, CFSTR("PXSharedLibraryBanners"), 0);
  }
  else
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "No presentation environment for the 'continue from preview' action", v3, 2u);
    }

  }
}

void __PXSharedLibraryPreviewBannerConfiguration_block_invoke_132(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a2)
  {
    PXSharedLibraryExitSharedLibraryOrPreview(*(void **)(a1 + 32), a2, CFSTR("PXSharedLibraryBanners"), 0);
  }
  else
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "No presentation environment for the 'exit from preview' action", v3, 2u);
    }

  }
}

@end
