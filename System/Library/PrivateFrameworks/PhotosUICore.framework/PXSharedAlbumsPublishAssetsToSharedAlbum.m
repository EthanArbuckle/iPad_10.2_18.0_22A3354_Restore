@implementation PXSharedAlbumsPublishAssetsToSharedAlbum

void __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void (**v23)(id, _QWORD, id);
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharedAlbumsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(a1[4], "count");
      v9 = a1[5];
      objc_msgSend(a1[6], "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v41 = v8;
      v42 = 2114;
      v43 = v9;
      v44 = 2114;
      v45 = v10;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Scheduling posting %lu assets to shared album with UUID=%{public}@, first asset UUID=%{public}@", buf, 0x20u);

    }
    objc_msgSend(a1[7], "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_217;
    v35[3] = &unk_1E513DD48;
    v36 = a1[4];
    v37 = a1[7];
    v38 = a1[8];
    v39 = a1[9];
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_2;
    v30[3] = &unk_1E5146940;
    v31 = a1[5];
    v32 = a1[7];
    v33 = a1[10];
    v34 = a1[11];
    objc_msgSend(v11, "performChanges:completionHandler:", v35, v30);

    v13 = v36;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v14 = a1[5];
      *(_DWORD *)buf = 138543618;
      v41 = (uint64_t)v14;
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Assets for shared album with UUID=%{public}@ not locally available. Error: %@", buf, 0x16u);
    }

    PXLocalizedSharedAlbumsString(CFSTR("PXSharedAlbumsErrorDownloadingAssetsForSharedAlbum_Title_Format"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "localizedTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v11, CFSTR("%@"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "localizedDescription", v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a1[10];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_225;
    v25[3] = &unk_1E51462E0;
    v13 = v15;
    v26 = v13;
    v18 = v16;
    v27 = v18;
    v29 = a1[11];
    v19 = v5;
    v28 = v19;
    objc_msgSend(v17, "presentAlertWithConfigurationHandler:", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedAlbumsGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEFAULT, "Presented shared album failure alert (ensure local assets)", buf, 2u);
      }

    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Failed to present shared album ensure local assets alert", buf, 2u);
      }

      v23 = (void (**)(id, _QWORD, id))a1[11];
      if (v23)
        v23[2](v23, 0, v19);
    }

  }
}

void __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_217(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD1390];
  v3 = a1[4];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_orderedAssetsFromAssets:sortDescriptors:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14C0], "changeRequestForCloudSharedAlbum:", a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "publishBatchOfOriginalAssets:withBatchCommentText:creationOptionsPerAsset:", v8, a1[6], a1[7]);

}

void __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_3;
  block[3] = &unk_1E5139650;
  v7 = v4;
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_225(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 40));
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_2_226;
  v6[3] = &unk_1E5148CE0;
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v5, 1, v6);

}

uint64_t __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_2_226(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PLSharedAlbumsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Failed to post assets to shared album with UUID=%{public}@. Error: %@", buf, 0x16u);
    }

    PXLocalizedSharedAlbumsString(CFSTR("PXSharedAlbumsCannotAddItemsTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedAlbumsString(CFSTR("PXSharedAlbumsErrorAddingToSharedAlbum_Title_Format"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "localizedTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v8, CFSTR("%@"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 56);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_220;
    v20[3] = &unk_1E51462E0;
    v11 = v7;
    v21 = v11;
    v12 = v9;
    v22 = v12;
    v24 = *(id *)(a1 + 64);
    v23 = *(id *)(a1 + 32);
    objc_msgSend(v10, "presentAlertWithConfigurationHandler:", v20, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedAlbumsGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Presented shared album failure alert (add assets)", buf, 2u);
      }

    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Failed to present shared album add assets alert", buf, 2u);
      }

      v18 = *(_QWORD *)(a1 + 64);
      if (v18)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v18 + 16))(v18, 0, *(_QWORD *)(a1 + 32));
    }

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v26 = v16;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Succesfully posted assets to shared album with UUID=%{public}@", buf, 0xCu);
    }

    v17 = *(_QWORD *)(a1 + 64);
    if (v17)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v17 + 16))(v17, 1, 0);
  }
}

void __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_220(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 40));
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_2_221;
  v6[3] = &unk_1E5148CE0;
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v5, 1, v6);

}

uint64_t __PXSharedAlbumsPublishAssetsToSharedAlbum_block_invoke_2_221(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end
