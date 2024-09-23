@implementation ICFileAttachmentsContentMapping

- (BOOL)supportsMultipleItems
{
  void *v2;
  void *v3;
  char v4;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SupportsMultipleItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)skipURLEncoding
{
  return 1;
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v7 = a3;
  v8 = a5;
  -[ICContentMapping sourceKey](self, "sourceKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "numberOfItems"))
  {
    -[ICContentMapping definition](self, "definition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("AttachmentNameKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICContentMapping definition](self, "definition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("AttachmentDataKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "removeCharactersInString:", CFSTR("?=&"));
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __80__ICFileAttachmentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
    v20[3] = &unk_1E7AE9DF8;
    v21 = v12;
    v22 = v16;
    v23 = v14;
    v24 = v7;
    v17 = v14;
    v18 = v16;
    v19 = v12;
    objc_msgSend(v10, "getFileRepresentations:forType:", v20, 0);

  }
  else
  {
    (*((void (**)(id, const __CFString *, _QWORD))v7 + 2))(v7, &stru_1E7AFA810, 0);
  }

}

void __80__ICFileAttachmentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v19 = v6;
    v7 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v5;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
          v13 = a1[4];
          if (v13)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "filename");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", a1[5]);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("&%@=%@"), v13, v15);

          }
          v16 = a1[6];
          objc_msgSend(v12, "data");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("&%@=%@"), v16, v18);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(a1[7] + 16))();
    v6 = v19;
    v5 = v20;
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

@end
