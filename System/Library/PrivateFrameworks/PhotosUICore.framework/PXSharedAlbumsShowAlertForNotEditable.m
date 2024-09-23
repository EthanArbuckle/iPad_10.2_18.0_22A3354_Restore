@implementation PXSharedAlbumsShowAlertForNotEditable

void ___PXSharedAlbumsShowAlertForNotEditable_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t v9[16];
  _QWORD v10[4];
  id v11;
  id v12;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___PXSharedAlbumsShowAlertForNotEditable_block_invoke_2;
  v10[3] = &unk_1E5142AB0;
  v2 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v2, "presentAlertWithConfigurationHandler:", v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLSharedAlbumsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      v6 = "Presented shared album editable validation alert";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v7, v8, v6, v9, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    v6 = "Failed to present shared album editable validation alert";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

void ___PXSharedAlbumsShowAlertForNotEditable_block_invoke_2(uint64_t a1, void *a2)
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
