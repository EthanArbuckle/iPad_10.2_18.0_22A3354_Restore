@implementation NSItemProvider(SocialLayer)

- (uint64_t)sl_hasPossibleCollaborationRepresentation
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 1;
  objc_msgSend(a1, "registeredTypeIdentifiersWithFileOptions:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    if ((objc_msgSend(a1, "canLoadObjectOfClass:", objc_opt_class()) & 1) != 0)
    {
      v2 = 1;
    }
    else
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x2050000000;
      v4 = (void *)getCKContainerSetupInfoClass_softClass_1;
      v11 = getCKContainerSetupInfoClass_softClass_1;
      if (!getCKContainerSetupInfoClass_softClass_1)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __getCKContainerSetupInfoClass_block_invoke_1;
        v7[3] = &unk_1E3794510;
        v7[4] = &v8;
        __getCKContainerSetupInfoClass_block_invoke_1((uint64_t)v7);
        v4 = (void *)v9[3];
      }
      v5 = objc_retainAutorelease(v4);
      _Block_object_dispose(&v8, 8);
      v2 = objc_msgSend(a1, "canLoadObjectOfClass:", v5);
    }
  }

  return v2;
}

- (id)sl_representations
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  SLShareableContentRepresentation *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "registeredTypeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v16;
    *(_QWORD *)&v6 = 138412546;
    v14 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(a1, "_representationConformingToType:", v10, v14, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = -[SLShareableContentRepresentation initWithTypeIdentifier:preferredRepresentation:]([SLShareableContentRepresentation alloc], "initWithTypeIdentifier:preferredRepresentation:", v10, objc_msgSend(v11, "preferredRepresentation"));
          objc_msgSend(v3, "addObject:", v12);
        }
        else
        {
          SLShareableContentLogHandle();
          v12 = (SLShareableContentRepresentation *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            v20 = v10;
            v21 = 2112;
            v22 = a1;
            _os_log_error_impl(&dword_199EFF000, &v12->super, OS_LOG_TYPE_ERROR, "Unexpectedly got empty representation for registered type identifier: %@ on item provider: %@", buf, 0x16u);
          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)sl_loadRepresentationForTypeIdentifier:()SocialLayer completionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_representationConformingToType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__NSItemProvider_SocialLayer__sl_loadRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v16[3] = &unk_1E3796170;
    v17 = v8;
    v18 = v7;
    v10 = (id)objc_msgSend(v17, "loadWithOptions_v2:completionHandler:", 0, v16);

    v11 = v17;
  }
  else
  {
    SLShareableContentLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSItemProvider(SocialLayer) sl_loadRepresentationForTypeIdentifier:completionHandler:].cold.1((uint64_t)v6, a1, v12);

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v19 = CFSTR("typeIdentifier");
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLItemProviderErrorDomain"), 1, v14);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    +[SLShareableContentLoadResult resultWithError:](SLShareableContentLoadResult, "resultWithError:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (void)sl_loadRepresentationForTypeIdentifier:()SocialLayer completionHandler:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "sl_representations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_199EFF000, a3, OS_LOG_TYPE_ERROR, "Failed to find registered representation for requested type identifier: %@ registered representations: %@", (uint8_t *)&v6, 0x16u);

}

@end
