@implementation NSItemProvider(Sharing)

- (uint64_t)supportsShareSheetSendCopyRepresentation
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "registeredTypeIdentifiers", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    v5 = *MEMORY[0x1E0CEC528];
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "conformsToType:", v5);

        if ((v8 & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (uint64_t)supportsMessagesSendCopyRepresentation
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "registeredTypeIdentifiers", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    v5 = *MEMORY[0x1E0CEC528];
    v6 = *MEMORY[0x1E0CEC590];
    v7 = *MEMORY[0x1E0CEC618];
    v8 = *MEMORY[0x1E0CEC4E0];
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "conformsToType:", v5)
          && (objc_msgSend(v10, "conformsToType:", v6) & 1) == 0
          && (!objc_msgSend(v10, "conformsToType:", v7)
           || objc_msgSend(v10, "conformsToType:", v8)))
        {

          v11 = 1;
          goto LABEL_14;
        }

        ++v9;
      }
      while (v3 != v9);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v3)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (id)preferredContentTypeForSavingWithCanOpenInPlace:()Sharing
{
  void *v5;
  NSString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  id v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "registeredContentTypesForOpenInPlace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SFCollaborationUtilities _copyRepresentationTypeIdentifier](SFCollaborationUtilities, "_copyRepresentationTypeIdentifier");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v27 = a3;
    v10 = 0;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v6);

        if ((v15 & 1) == 0)
        {
          v16 = v13;

          v10 = v16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);

    a3 = v27;
    if (v10)
    {
      v17 = 1;
      if (!v27)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(a1, "registeredContentTypes");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    v22 = *MEMORY[0x1E0CEC528];
    while (2)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        if (objc_msgSend(v24, "conformsToType:", v22))
        {
          v10 = v24;
          goto LABEL_24;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v20)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_24:

  v17 = 0;
  if (a3)
LABEL_25:
    *a3 = v17;
LABEL_26:
  v25 = v10;

  return v25;
}

- (void)loadURLClassWithPreviousError:()Sharing completionHandler:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "canLoadObjectOfClass:", objc_opt_class()) & 1) != 0)
  {
    v8 = objc_opt_class();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__NSItemProvider_Sharing__loadURLClassWithPreviousError_completionHandler___block_invoke;
    v10[3] = &unk_1E4831608;
    v11 = v7;
    v9 = (id)objc_msgSend(a1, "loadObjectOfClass:completionHandler:", v8, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v6);
  }

}

- (void)loadFileURLRequiringOpenInPlace:()Sharing completionHandler:
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  id v16;
  char v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0;
  objc_msgSend(a1, "preferredContentTypeForSavingWithCanOpenInPlace:", &v18);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v18)
    v9 = 0;
  else
    v9 = a3;
  if (!v7 || (v9 & 1) != 0)
  {
    if (v7 && ((v9 ^ 1) & 1) == 0)
    {
      framework_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Not loading file representation for content type %@ because it can't be opened in place", buf, 0xCu);

      }
    }
    objc_msgSend(a1, "loadURLClassWithPreviousError:completionHandler:", 0, v6);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke;
    v13[3] = &unk_1E4833420;
    v17 = a3;
    v16 = v6;
    v14 = v8;
    v15 = a1;
    v10 = (id)objc_msgSend(a1, "loadFileRepresentationForContentType:openInPlace:completionHandler:", v14, a3, v13);

  }
}

- (void)sf_loadSecurityContextWithCompletionHandler:()Sharing
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__NSItemProvider_Sharing__sf_loadSecurityContextWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4833448;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "loadItemForTypeIdentifier:options:completionHandler:", CFSTR("com.apple.ShareUI.airdrop.supplementalSecurityContext"), 0, v6);

}

@end
