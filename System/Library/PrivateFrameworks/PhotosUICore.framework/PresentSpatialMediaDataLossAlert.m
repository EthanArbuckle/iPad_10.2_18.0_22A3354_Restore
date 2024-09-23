@implementation PresentSpatialMediaDataLossAlert

void ___PresentSpatialMediaDataLossAlert_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  PXLocalizedSharedAlbumsString(CFSTR("PXSharedAlbumSpatialMediaDataLossAlertTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedAlbumsString(CFSTR("PXSharedAlbumSpatialMediaDataLossAlertMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___PresentSpatialMediaDataLossAlert_block_invoke_2;
  v11[3] = &unk_1E5136710;
  v12 = v2;
  v13 = v3;
  v4 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = v2;
  objc_msgSend(v4, "presentAlertWithConfigurationHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSharedAlbumsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Presented shared album spatial data loss alert", v10, 2u);
    }

    PXPreferencesSetBool(CFSTR("HasShownSharedAlbumsSpatialMediaDataLossAlert"), 1);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Failed to present shared album spatial data loss alert", v10, 2u);
    }

  }
}

void ___PresentSpatialMediaDataLossAlert_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 40));
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___PresentSpatialMediaDataLossAlert_block_invoke_3;
  v6[3] = &unk_1E5148A40;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v5, 1, v6);

}

uint64_t ___PresentSpatialMediaDataLossAlert_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
