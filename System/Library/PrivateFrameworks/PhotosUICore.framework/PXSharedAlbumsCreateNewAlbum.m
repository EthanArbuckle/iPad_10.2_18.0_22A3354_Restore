@implementation PXSharedAlbumsCreateNewAlbum

void __PXSharedAlbumsCreateNewAlbum_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  __int128 buf;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && *(_BYTE *)(a1 + 40))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v5;
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedAlbumsGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "localizedTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to publish shared album '%@'", (uint8_t *)&buf, 0xCu);

    }
    v13 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = ___PXSharedAlbumsPublishSharedAlbum_block_invoke;
    v16[3] = &unk_1E5149198;
    v17 = v8;
    *(_QWORD *)&buf = v13;
    *((_QWORD *)&buf + 1) = 3221225472;
    v19 = ___PXSharedAlbumsPublishSharedAlbum_block_invoke_2;
    v20 = &unk_1E5148348;
    v21 = v17;
    v22 = v9;
    v14 = v9;
    objc_msgSend(v10, "performChanges:completionHandler:", v16, &buf);

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
  }

}

void ___PXSharedAlbumsCreateNewAlbum_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  NSObject *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  NSObject *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD14C0], "creationRequestForCloudSharedAlbumWithTitle:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderForCreatedCloudSharedAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(MEMORY[0x1E0D719E0], "sharingFirstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCloudOwnerFirstName:", v7);

  objc_msgSend(MEMORY[0x1E0D719E0], "sharingLastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCloudOwnerLastName:", v8);

  objc_msgSend(MEMORY[0x1E0D719E0], "sharingDisplayNameIncludingEmail:allowsEmail:", 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCloudOwnerFullName:", v9);

  objc_msgSend(MEMORY[0x1E0D719E0], "sharingUsername");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCloudOwnerEmail:", v10);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v35 = a1;
  v11 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v37;
    *(_QWORD *)&v13 = 138412546;
    v34 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v17, "suggestedTransport", v34);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "addressKind");

        if (v19 == 1)
        {
          objc_msgSend(v17, "emailAddressString");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v17, "firstName");
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lastName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "displayName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addInvitationRecordWithFirstName:lastName:fullName:emails:phones:", v21, v22, v23, v24, 0);

            goto LABEL_12;
          }
          PLSharedAlbumsGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v30 = *(_QWORD *)(v35 + 32);
            *(_DWORD *)buf = v34;
            v42 = v17;
            v43 = 2112;
            v44 = v30;
            v31 = v21;
            v32 = "Will not invite %@ to shared album %@: Empty email address.";
            goto LABEL_19;
          }
          goto LABEL_20;
        }
        objc_msgSend(v17, "suggestedTransport");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "addressKind");

        if (v26 == 2)
        {
          objc_msgSend(v17, "phoneNumberString");
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v17, "firstName");
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lastName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "displayName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addInvitationRecordWithFirstName:lastName:fullName:emails:phones:", v21, v22, v27, 0, v28);

LABEL_12:
          }
          else
          {
            PLSharedAlbumsGetLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v33 = *(_QWORD *)(v35 + 32);
              *(_DWORD *)buf = v34;
              v42 = v17;
              v43 = 2112;
              v44 = v33;
              v31 = v21;
              v32 = "Will not invite %@ to shared album %@: Empty phone number.";
LABEL_19:
              _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
            }
          }
LABEL_20:

          goto LABEL_21;
        }
        PLSharedAlbumsGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v29 = *(_QWORD *)(v35 + 32);
          *(_DWORD *)buf = v34;
          v42 = v17;
          v43 = 2112;
          v44 = v29;
          _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Will not invite %@ to shared album %@: Invalid recipient type.", buf, 0x16u);
        }
LABEL_21:

      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v14);
  }

  PXSharedAlbumsRecordRecentInvitationRecipients(*(void **)(v35 + 40));
}

void ___PXSharedAlbumsCreateNewAlbum_block_invoke_231(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void (*v16)(void);
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    PLSharedAlbumsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v28 = 138412290;
      v29 = v7;
    }

    v8 = (void *)MEMORY[0x1E0CD13B8];
    v32[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchAssetCollectionsWithLocalIdentifiers:options:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PLSharedAlbumsGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v14;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Succesfully created shared album with UUID=%{public}@", (uint8_t *)&v28, 0xCu);

      }
      v15 = *(_QWORD *)(a1 + 48);
      if (!v15)
        goto LABEL_17;
      v16 = *(void (**)(void))(v15 + 16);
    }
    else
    {
      PLSharedAlbumsGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = *(void **)(a1 + 32);
        v28 = 138412290;
        v29 = v24;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "Failed to fetch shared album with name '%@' after creation.", (uint8_t *)&v28, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXSharedAlbumsErrorDomain"), -1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 48);
      if (!v25)
        goto LABEL_17;
      v16 = *(void (**)(void))(v25 + 16);
    }
    v16();
LABEL_17:

    goto LABEL_23;
  }
  PLSharedAlbumsGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (!v18)
      goto LABEL_21;
    v19 = *(void **)(a1 + 32);
    v28 = 138412546;
    v29 = v19;
    v30 = 2112;
    v31 = v5;
    v20 = "Failed to create shared album with name '%@'. Error = %@";
    v21 = v17;
    v22 = 22;
  }
  else
  {
    if (!v18)
      goto LABEL_21;
    v26 = *(void **)(a1 + 32);
    v28 = 138412290;
    v29 = v26;
    v20 = "Failed to create shared album with name '%@'";
    v21 = v17;
    v22 = 12;
  }
  _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v28, v22);
LABEL_21:

  v27 = *(_QWORD *)(a1 + 48);
  if (v27)
    (*(void (**)(uint64_t, _QWORD, id))(v27 + 16))(v27, 0, v5);
LABEL_23:

}

@end
