@implementation PXSharedAlbumsPublishSharedAlbum

void ___PXSharedAlbumsPublishSharedAlbum_block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD14C0], "changeRequestForCloudSharedAlbum:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "publish");

}

void ___PXSharedAlbumsPublishSharedAlbum_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSharedAlbumsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v4;
    v8 = "Failed to publish shared album '%@'. Error = %@";
    v9 = v6;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v7;
    v8 = "Succesfully published shared album '%@'";
    v9 = v6;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 12;
  }
  _os_log_impl(&dword_1A6789000, v9, v10, v8, (uint8_t *)&v13, v11);

LABEL_7:
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, *(_QWORD *)(a1 + 32), v4);

}

@end
