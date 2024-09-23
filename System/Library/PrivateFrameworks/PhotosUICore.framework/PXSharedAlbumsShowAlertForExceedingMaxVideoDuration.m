@implementation PXSharedAlbumsShowAlertForExceedingMaxVideoDuration

void ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_2;
  v8[3] = &unk_1E51367A0;
  v2 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v13 = *(_BYTE *)(a1 + 72);
  v12 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v2, "presentAlertWithConfigurationHandler:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLSharedAlbumsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Presented shared album add video validation alert", v7, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to present shared album add video validation alert", v7, 2u);
    }

    v6 = *(_QWORD *)(a1 + 64);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }

}

void ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setMessage:", *(_QWORD *)(a1 + 40));
  v4 = CFSTR("PXOK");
  v5 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 64))
  {
    PXLocalizedStringFromTable(CFSTR("PXSkip"), CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_3;
    v10[3] = &unk_1E5148CE0;
    v12 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v3, "addActionWithTitle:style:action:", v6, 0, v10);

    if (*(_BYTE *)(a1 + 64))
      v4 = CFSTR("PXCancel");
  }
  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_4;
  v8[3] = &unk_1E5148A40;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v7, 1, v8);

}

uint64_t ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t ___PXSharedAlbumsShowAlertForExceedingMaxVideoDuration_block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

@end
