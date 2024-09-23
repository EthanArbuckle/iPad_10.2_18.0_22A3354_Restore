@implementation ICJSSign

- (ICJSSign)initWithConfiguration:(id)a3
{
  id v4;
  ICJSSign *v5;
  uint64_t v6;
  ICJSSignConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICJSSign;
  v5 = -[ICJSSign init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (ICJSSignConfiguration *)v6;

  }
  return v5;
}

- (id)signatureDataWithURLRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  CC_LONG v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  int v15;
  ICJSSign *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ICJSSign signatureStringWithURLRequest:](self, "signatureStringWithURLRequest:", a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (id)objc_msgSend(v4, "UTF8String");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 20);
    v7 = objc_msgSend(v4, "length");
    v8 = objc_retainAutorelease(v6);
    CC_SHA1(v5, v7, (unsigned __int8 *)objc_msgSend(v8, "mutableBytes"));
    objc_msgSend(v8, "setLength:", 16);
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isMac") ? 1 : 3;

    v5 = objc_retainAutorelease(v8);
    fd3fa4R8(v10, objc_msgSend(v5, "mutableBytes"));
    if (v11)
    {
      v12 = v11;
      v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = 138543618;
        v16 = self;
        v17 = 1024;
        v18 = v12;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to js-sign request. err=%d", (uint8_t *)&v15, 0x12u);
      }

    }
  }

  return v5;
}

- (id)signatureStringWithURLRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ICJSSignConfiguration *configuration;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithURL:resolvingAgainstBaseURL:", v7, 0);

  objc_msgSend(v8, "queryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  configuration = self->_configuration;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__ICJSSign_signatureStringWithURLRequest___block_invoke;
  v14[3] = &unk_1E43898D8;
  v15 = v4;
  v16 = v9;
  v17 = v5;
  v11 = v4;
  -[ICJSSignConfiguration _enumerateComponentsUsingBlock:](configuration, "_enumerateComponentsUsingBlock:", v14);
  v12 = v5;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __42__ICJSSign_signatureStringWithURLRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[2];
  BOOL (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v20 = v5;
  if (a2 == 2)
  {
    v9 = *(void **)(a1 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v22 = __42__ICJSSign_signatureStringWithURLRequest___block_invoke_2;
    v23 = &unk_1E43898B0;
    v24 = v5;
    v10 = v9;
    v11 = v21;
    v29 = 0;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (((unsigned int (*)(_QWORD *, void *, uint64_t, char *))v22)(v11, v18, v15 + i, &v29))
          {
            v19 = v18;
            v29 = 1;
            goto LABEL_18;
          }
          if (v29)
            goto LABEL_16;
        }
        v15 += i;
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        v19 = 0;
        if (v14)
          continue;
        break;
      }
    }
    else
    {
LABEL_16:
      v19 = 0;
    }
LABEL_18:

    objc_msgSend(v19, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "ic_valueForHTTPHeaderField:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2)
      goto LABEL_21;
    objc_msgSend(*(id *)(a1 + 32), "ic_valuesForCookieWithName:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = v20;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "appendString:", v8);

    v6 = v20;
  }
LABEL_21:

}

BOOL __42__ICJSSign_signatureStringWithURLRequest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;

  return v4;
}

@end
